import 'dart:convert';
import 'dart:io';

import 'package:first_flutter/api_book_searcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'api_book_searcher_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BookApiManager>()])
Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('APIのレスポンステスト', () {
    final mockBookManager = MockBookApiManager();

    test('正常系テスト', () async {
      final List<Map<String, dynamic>> bookData = [
        await createBookData({'volumeInfo.title': 'title1'}),
        await createBookData({'volumeInfo.title': 'title2'}),
        await createBookData({'volumeInfo.title': 'title3'}),
      ];
      when(mockBookManager.getBookDataFromApi('success')).thenAnswer((_) async {
        final body = createApiResponse(bookData);

        return http.Response(utf8.decode(utf8.encode(body)), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        });
      });

      final body = await mockBookManager.getBookDataFromApi('success');
      expect(BookApiManager().getBookTitles(body.body),
          ['title1', 'title2', 'title3']);
    });

    test('titleが抜けたデータだった時のテスト', () async {
      final List<Map<String, dynamic>> bookData = [
        await createBookData({'volumeInfo.title': 'title1'}),
        await createBookData({'volumeInfo.title': 'title2'}),
        await createBookData({'volumeInfo.title': null}),
      ];
      final mockBookManager = MockBookApiManager();
      when(mockBookManager.getBookDataFromApi('no_title')).thenAnswer((_) async {
        final body = createApiResponse(bookData);

        return http.Response(utf8.decode(utf8.encode(body)), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        });
      });
      final body = await mockBookManager.getBookDataFromApi('no_title');
      expect(BookApiManager().getBookTitles(body.body),
          ['title1', 'title2', null]);
    });
  });
}

String createApiResponse(List<Map<String, dynamic>> items) {
  return json.encode(
      {'kind': 'books#volumes', 'totalItems': 1121, 'items': items.toList()});
}

Future<Map<String, dynamic>> createBookData(
    Map<String, dynamic> changes) async {
  final jsonData = jsonDecode(
      await File('test/assets/google_book_api_example.json').readAsString());

  for (var path in changes.keys) {
    dynamic currentLevel = jsonData;
    List<String> keys = path.split('.');
    for (int i = 0; i < keys.length; i++) {
      String key = keys[i];

      // 最終キーの場合
      if (i == keys.length - 1) {
        // valueがnullならキーごと削除
        if (changes[path] == null) {
          (currentLevel as Map).remove(key);
        } else {
          currentLevel[key] = changes[path];
        }
      } else {
        // キーが存在しないかMapでない場合は空のMapを作成
        if (currentLevel[key] == null ||
            currentLevel[key] is! Map<String, dynamic>) {
          currentLevel[key] = <String, dynamic>{};
        }
        currentLevel = currentLevel[key];
      }
    }
  }
  return jsonData;
}

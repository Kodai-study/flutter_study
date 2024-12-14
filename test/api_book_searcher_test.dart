import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_flutter/api_book_searcher.dart';
import 'package:first_flutter/model/book_data.dart';
import 'package:first_flutter/model/book_search_data.dart';
import 'package:first_flutter/model/book_search_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';


@GenerateNiceMocks([MockSpec<BookApiManager>()])
Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Dio dio;
  late DioAdapter dioAdapter;
  late BookApiClient bookApiClient;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    bookApiClient = BookApiClient(dio);
  });

  group('APIのレスポンステスト', () {
    test("実際のAPIレスポンスを使った正常系テスト", () {
      dioAdapter.onGet(
          '/volumes',
          (server) =>
              server.reply(200, fixture('google_book_api_example_all.json')),
          queryParameters: {'q': 'success'});
    });

    test("テストデータを正しく作成できる事のテスト", () async {
      dioAdapter.onGet(
          '/volumes',
          (server) => server.reply(
              200,
              BookSearchResponse(totalItems: 100, items: [
                BookSearchData(
                    volumeInfo: BookData(title: "title1", publisher: "出版社1")),
                BookSearchData(
                    volumeInfo: BookData(title: "title2", publisher: "出版社2"))
              ]).toJson()),
          queryParameters: {'q': 'success'});

      final response = await bookApiClient.getBookDataFromApi("success");
      expect(response.totalItems, 100);
      expect(response.items[0].volumeInfo?.title, "title1");
      expect(response.items[0].volumeInfo?.publisher, "出版社1");
      expect(response.items[1].volumeInfo?.title, "title2");
      expect(response.items[1].volumeInfo?.publisher, "出版社2");
    });

    test("ステータスコード400が帰ってきたときのエラー", () async {
      dioAdapter.onGet('/volumes', (server) => server.reply(400, 'error'),
          queryParameters: {'q': 'error'});
      expect(bookApiClient.getBookDataFromApi("error"),
          throwsA(isA<DioException>()));
    });

    test("検索結果が0の場合に正しく処理されることのテスト", () async {
      dioAdapter.onGet(
          '/volumes',
          (server) => server.reply(
              200, jsonDecode('{"kind": "books#volumes", "totalItems": 0}')),
          queryParameters: {'q': 'no_result'});

      final response = await bookApiClient.getBookDataFromApi("no_result");
      expect(response.totalItems, 0);
      expect(response.items.length, 0);
    });
  });
}

String fixture(String name) {
  return File('test/stub/$name').readAsStringSync();
}

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
      dioAdapter.onGet('/volumes',
              (server) => server.reply(200, createSuccessResponse(3).toJson()),
          queryParameters: {'q': 'success'});

      final response = await bookApiClient.getBookDataFromApi("success");
      expect(response.totalItems, 3);
      expect(response.items[0].volumeInfo?.title, "title0");
      expect(response.items[0].volumeInfo?.publisher, "出版社0");
      expect(response.items[0].dataLink, "link0");
      expect(response.items[0].id, "id0");

      expect(response.items[1].volumeInfo?.title, "title1");
      expect(response.items[1].volumeInfo?.publisher, "出版社1");
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
              (server) =>
              server.reply(
                  200,
                  jsonDecode('{"kind": "books#volumes", "totalItems": 0}')),
          queryParameters: {'q': 'no_result'});

      final response = await bookApiClient.getBookDataFromApi("no_result");
      expect(response.totalItems, 0);
      expect(response.items.length, 0);
    });
  });

  group("APIレスポンスの変換", () {
    test("名前一覧の取得_正常系", () async {
      dioAdapter.onGet('/volumes',
              (server) => server.reply(200, createSuccessResponse(3).toJson()),
          queryParameters: {'q': 'success'});

      final bookApiManager = BookApiManager(bookApiClient);
      final bookTitles = await bookApiManager.getBoolTitles("success");
      expect(bookTitles, ["title0", "title1", "title2"]);
    });
  });
}

String fixture(String name) {
  return File('test/stub/$name').readAsStringSync();
}

/// 正常系のテスト用APIレスポンスを作成
BookSearchResponse createSuccessResponse(int itemCount, {int? totalItems}) {
  return BookSearchResponse(
    totalItems: (totalItems == null) ? itemCount : totalItems,
    items: List.generate(itemCount, (index) {
      return BookSearchData(dataLink: "link$index", id: "id$index",
          volumeInfo: BookData(
              title: "title$index", publisher: "出版社$index"));
    }),
  );
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:first_flutter/api_book_searcher.dart';
import 'package:first_flutter/screen_test_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'api_book_searcher_test.dart';

void main() {
  group("テキストボックスに入れて検索", () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late BookApiClient bookApiClient;
    setUp(() {
      dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      bookApiClient = BookApiClient(dio);
    });

    testWidgets('検索結果が正しく表示されること', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: TestApiScreen(bookApiClient),
      ));

      dioAdapter.onGet("/volumes",
          (server) => server.reply(200, createSuccessResponse(1).toJson()),
          queryParameters: {'q': 'item_1'});
      dioAdapter.onGet("/volumes",
              (server) => server.reply(200, createSuccessResponse(2).toJson()),
          queryParameters: {'q': 'item_2'});

      final queryTextField = find.byType(TextField);
      final searchButton = find.text("data");

      //検索結果が1件の場合、1件表示されること
      await tester.enterText(queryTextField, "item_1");
      await tester.tap(searchButton);
      await tester.pumpAndSettle();

      expect(find.text('title0'), findsOneWidget);
      //1件のみ表示されること
      expect(find.text('title1'), findsNothing);

      //検索結果が2件の場合、2件表示されること
      await tester.enterText(queryTextField, "item_2");
      await tester.tap(searchButton);
      await tester.pumpAndSettle();
      expect(find.text('title0'), findsOneWidget);
      expect(find.text('title1'), findsOneWidget);
    });


    testWidgets('検索エラー発生時に、「検索エラー」が表示されるテスト', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: TestApiScreen(bookApiClient),
      ));
      dioAdapter.onGet(
          "/volumes",
          (server) =>
              server.reply(400, fixture('google_book_api_missing_query.json')),
          queryParameters: {'q': 'badRequest'});

      final queryTextField = find.byType(TextField);
      await tester.enterText(queryTextField, "badRequest");
      await tester.tap(find.text("data"));
      await tester.pumpAndSettle();

      expect(find.text('エラーが発生しました。'), findsOneWidget);
    });
  });
}

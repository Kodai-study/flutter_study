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

import 'package:first_flutter/main.dart';
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
          (server) => server.reply(200, createSuccessResponse(100).toJson()),
          queryParameters: {'q': 'success'});

      final queryTextField = find.byType(TextField);
      await tester.enterText(queryTextField, "success");
      await tester.tap(find.text("data"));
      await tester.pumpAndSettle();

      expect(find.text('title0'), findsOneWidget);
      expect(find.text('title1'), findsOneWidget);
    });
  });
}

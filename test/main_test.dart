import 'package:first_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  final displayWebViewButtonFinder =
      find.widgetWithText(ElevatedButton, "WebViewの表示");
  final toApiScreenButtonFinder =
      find.widgetWithText(ElevatedButton, "WebViewの表示");

  group("メイン画面の正常系テスト", () {
    testWidgets("画面にwidgetがすべてあること", (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.text("Flutter デモ メイン画面"), findsOneWidget);
      expect(displayWebViewButtonFinder, findsOneWidget);
      expect(toApiScreenButtonFinder, findsOneWidget);
    });
  });
}

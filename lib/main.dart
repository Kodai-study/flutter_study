import 'package:first_flutter/screen_test_api.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter デモ API呼び出し画面'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isWebView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            // isWebViewがtrueの場合はWebViewを表示
            if (isWebView)
              Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: const TestWebView(),
              ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isWebView = !isWebView;
                  });
                },
                child: const Text('WebViewの表示')),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    //画面遷移
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TestApiScreen()));
                  },
                  child: const Text('APIテスト画面に遷移')),
            ),
          ],
        ),
      ),
    );
  }
}

class TestWebView extends StatefulWidget {
  const TestWebView({super.key});

  @override
  State<TestWebView> createState() => _TestWebViewState();
}

class _TestWebViewState extends State<TestWebView> {
  late WebViewController controller = WebViewController();

  void setWebView(String url) {
    controller.loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    controller.loadRequest(Uri.parse('https://www.google.com'));
    return WebViewWidget(controller: controller);
  }
}

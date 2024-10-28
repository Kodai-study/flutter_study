import 'package:flutter/material.dart';

class TestApiScreen extends StatefulWidget {
  const TestApiScreen({super.key});

  final String title = 'Flutter デモ API呼び出し画面';

  @override
  State<TestApiScreen> createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}

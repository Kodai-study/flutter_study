import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApiScreen extends StatefulWidget {
  const TestApiScreen({super.key});

  final String title = 'Flutter デモ API呼び出し画面';

  @override
  State<TestApiScreen> createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  String stateMessage = '';
  List<String> bookData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text("data")),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bookData.length,
              itemBuilder: (context, index) {
                return Text(bookData[index],style: TextStyle(fontSize: 30),);
              },
            ),
          ),
        ],
      ),
    );
  }
}

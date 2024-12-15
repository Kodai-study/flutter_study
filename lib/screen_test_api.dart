import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_book_searcher.dart';

class TestApiScreen extends StatefulWidget {
  final BookApiClient bookApiClient;

  const TestApiScreen(this.bookApiClient, {super.key});

  final String title = 'Flutter デモ API呼び出し画面';

  @override
  State<TestApiScreen> createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  String stateMessage = '';
  List<dynamic> bookData = [];

  final _queryTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(controller: _queryTextFieldController),
          ElevatedButton(
              onPressed: () {
                var query = _queryTextFieldController.text;
                searchBooks(query);
              },
              child: Text("data")),
          Expanded(
            child: stateMessage.isNotEmpty
                ? Text(stateMessage)
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          bookData[index],
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> searchBooks(String query) async {
    setState(() {
      stateMessage = '検索中...';
      bookData.clear();
    });

    try {
      final bookSearchResult =
          await widget.bookApiClient.getBookDataFromApi(query);
      setState(() {
        bookData = bookSearchResult.items
            .map((bookData) => bookData.volumeInfo?.title)
            .toList();
        stateMessage = '';
      });
    } catch (e) {
      setState(() {
        stateMessage = 'エラーが発生しました。';
      });
      return;
    }
  }
}

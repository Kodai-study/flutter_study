import 'dart:convert';
import 'package:http/http.dart' as http;

class BookApiManager {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<http.Response> getBookDataFromApi(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$query'));

    return response;
  }

  List<dynamic> getBookTitles(String bookDataBody) {
    final bookData = json.decode(bookDataBody);

    return bookData["items"]
        .map((book) => book['volumeInfo']['title'])
        .toList();
  }
}

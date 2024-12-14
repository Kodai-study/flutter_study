import 'dart:convert';

import 'package:first_flutter/model/book_search_response.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_book_searcher.g.dart';

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

@RestApi(baseUrl: 'https://www.googleapis.com/books/v1/')
abstract class BookApiClient {
  factory BookApiClient(Dio dio, {String baseUrl}) = _BookApiClient;

  @GET('/volumes')
  Future<BookSearchResponse> getBookDataFromApi(@Query('q') String query);
}


import 'package:first_flutter/model/book_search_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_book_searcher.g.dart';

class BookApiManager {
  final BookApiClient bookApiClient;

  BookApiManager(this.bookApiClient);

  Future<List<String?>> getBoolTitles(String query) async {
    final bookSearchResult = await bookApiClient.getBookDataFromApi(query);

    return bookSearchResult.items
        .where((bookData) => bookData.volumeInfo?.title != "noName")
        .map((bookData) => bookData.volumeInfo?.title)
        .toList();
  }
}

@RestApi(baseUrl: 'https://www.googleapis.com/books/v1/')
abstract class BookApiClient {
  factory BookApiClient(Dio dio, {String baseUrl}) = _BookApiClient;

  @GET('/volumes')
  Future<BookSearchResponse> getBookDataFromApi(@Query('q') String query);
}

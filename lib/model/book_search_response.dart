import 'package:freezed_annotation/freezed_annotation.dart';

import 'book_search_data.dart';

part 'book_search_response.freezed.dart';

part 'book_search_response.g.dart';

@freezed
class BookSearchResponse with _$BookSearchResponse {
  factory BookSearchResponse({
    @Default(0) int totalItems,
    @Default(<BookSearchData>[]) List<BookSearchData> items,
  }) = _BookSearchResponse;

  factory BookSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$BookSearchResponseFromJson(json);
}

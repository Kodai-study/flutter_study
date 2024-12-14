import 'package:first_flutter/model/book_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_search_data.freezed.dart';

part 'book_search_data.g.dart';

@freezed
class BookSearchData with _$BookSearchData {
  const factory BookSearchData({
    @Default("no_id") String id,
    @Default("no_link") @JsonKey(name: "selfLink") String dataLink,
    BookData? volumeInfo,
  }) = _BookSearchData;

  factory BookSearchData.fromJson(Map<String, dynamic> json) =>
      _$BookSearchDataFromJson(json);

}

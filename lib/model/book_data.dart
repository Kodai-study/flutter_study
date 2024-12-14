import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_data.freezed.dart';

part 'book_data.g.dart';

@freezed
class BookData with _$BookData {
  factory BookData({
    @Default("noName") String title,
    @Default("noPublisher") String publisher,
  }) = _BookData;

  factory BookData.fromJson(Map<String, dynamic> json) =>
      _$BookDataFromJson(json);
}

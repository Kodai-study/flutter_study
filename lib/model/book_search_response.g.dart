// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookSearchResponseImpl _$$BookSearchResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BookSearchResponseImpl(
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => BookSearchData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BookSearchData>[],
    );

Map<String, dynamic> _$$BookSearchResponseImplToJson(
        _$BookSearchResponseImpl instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

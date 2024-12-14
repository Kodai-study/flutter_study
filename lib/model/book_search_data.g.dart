// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_search_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookSearchDataImpl _$$BookSearchDataImplFromJson(Map<String, dynamic> json) =>
    _$BookSearchDataImpl(
      id: json['id'] as String? ?? "no_id",
      dataLink: json['selfLink'] as String? ?? "no_link",
      volumeInfo: json['volumeInfo'] == null
          ? null
          : BookData.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BookSearchDataImplToJson(
        _$BookSearchDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selfLink': instance.dataLink,
      'volumeInfo': instance.volumeInfo,
    };

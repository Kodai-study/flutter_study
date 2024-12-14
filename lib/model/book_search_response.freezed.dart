// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookSearchResponse _$BookSearchResponseFromJson(Map<String, dynamic> json) {
  return _BookSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$BookSearchResponse {
  int get totalItems => throw _privateConstructorUsedError;
  List<BookSearchData> get items => throw _privateConstructorUsedError;

  /// Serializes this BookSearchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookSearchResponseCopyWith<BookSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSearchResponseCopyWith<$Res> {
  factory $BookSearchResponseCopyWith(
          BookSearchResponse value, $Res Function(BookSearchResponse) then) =
      _$BookSearchResponseCopyWithImpl<$Res, BookSearchResponse>;
  @useResult
  $Res call({int totalItems, List<BookSearchData> items});
}

/// @nodoc
class _$BookSearchResponseCopyWithImpl<$Res, $Val extends BookSearchResponse>
    implements $BookSearchResponseCopyWith<$Res> {
  _$BookSearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookSearchData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookSearchResponseImplCopyWith<$Res>
    implements $BookSearchResponseCopyWith<$Res> {
  factory _$$BookSearchResponseImplCopyWith(_$BookSearchResponseImpl value,
          $Res Function(_$BookSearchResponseImpl) then) =
      __$$BookSearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalItems, List<BookSearchData> items});
}

/// @nodoc
class __$$BookSearchResponseImplCopyWithImpl<$Res>
    extends _$BookSearchResponseCopyWithImpl<$Res, _$BookSearchResponseImpl>
    implements _$$BookSearchResponseImplCopyWith<$Res> {
  __$$BookSearchResponseImplCopyWithImpl(_$BookSearchResponseImpl _value,
      $Res Function(_$BookSearchResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_$BookSearchResponseImpl(
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<BookSearchData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookSearchResponseImpl implements _BookSearchResponse {
  _$BookSearchResponseImpl(
      {this.totalItems = 0,
      final List<BookSearchData> items = const <BookSearchData>[]})
      : _items = items;

  factory _$BookSearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookSearchResponseImplFromJson(json);

  @override
  @JsonKey()
  final int totalItems;
  final List<BookSearchData> _items;
  @override
  @JsonKey()
  List<BookSearchData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'BookSearchResponse(totalItems: $totalItems, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSearchResponseImpl &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalItems, const DeepCollectionEquality().hash(_items));

  /// Create a copy of BookSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSearchResponseImplCopyWith<_$BookSearchResponseImpl> get copyWith =>
      __$$BookSearchResponseImplCopyWithImpl<_$BookSearchResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookSearchResponseImplToJson(
      this,
    );
  }
}

abstract class _BookSearchResponse implements BookSearchResponse {
  factory _BookSearchResponse(
      {final int totalItems,
      final List<BookSearchData> items}) = _$BookSearchResponseImpl;

  factory _BookSearchResponse.fromJson(Map<String, dynamic> json) =
      _$BookSearchResponseImpl.fromJson;

  @override
  int get totalItems;
  @override
  List<BookSearchData> get items;

  /// Create a copy of BookSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSearchResponseImplCopyWith<_$BookSearchResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

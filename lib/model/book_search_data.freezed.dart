// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_search_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookSearchData _$BookSearchDataFromJson(Map<String, dynamic> json) {
  return _BookSearchData.fromJson(json);
}

/// @nodoc
mixin _$BookSearchData {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "selfLink")
  String get dataLink => throw _privateConstructorUsedError;
  BookData? get volumeInfo => throw _privateConstructorUsedError;

  /// Serializes this BookSearchData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookSearchData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookSearchDataCopyWith<BookSearchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSearchDataCopyWith<$Res> {
  factory $BookSearchDataCopyWith(
          BookSearchData value, $Res Function(BookSearchData) then) =
      _$BookSearchDataCopyWithImpl<$Res, BookSearchData>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "selfLink") String dataLink,
      BookData? volumeInfo});

  $BookDataCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class _$BookSearchDataCopyWithImpl<$Res, $Val extends BookSearchData>
    implements $BookSearchDataCopyWith<$Res> {
  _$BookSearchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookSearchData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dataLink = null,
    Object? volumeInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dataLink: null == dataLink
          ? _value.dataLink
          : dataLink // ignore: cast_nullable_to_non_nullable
              as String,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as BookData?,
    ) as $Val);
  }

  /// Create a copy of BookSearchData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookDataCopyWith<$Res>? get volumeInfo {
    if (_value.volumeInfo == null) {
      return null;
    }

    return $BookDataCopyWith<$Res>(_value.volumeInfo!, (value) {
      return _then(_value.copyWith(volumeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookSearchDataImplCopyWith<$Res>
    implements $BookSearchDataCopyWith<$Res> {
  factory _$$BookSearchDataImplCopyWith(_$BookSearchDataImpl value,
          $Res Function(_$BookSearchDataImpl) then) =
      __$$BookSearchDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "selfLink") String dataLink,
      BookData? volumeInfo});

  @override
  $BookDataCopyWith<$Res>? get volumeInfo;
}

/// @nodoc
class __$$BookSearchDataImplCopyWithImpl<$Res>
    extends _$BookSearchDataCopyWithImpl<$Res, _$BookSearchDataImpl>
    implements _$$BookSearchDataImplCopyWith<$Res> {
  __$$BookSearchDataImplCopyWithImpl(
      _$BookSearchDataImpl _value, $Res Function(_$BookSearchDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookSearchData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dataLink = null,
    Object? volumeInfo = freezed,
  }) {
    return _then(_$BookSearchDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dataLink: null == dataLink
          ? _value.dataLink
          : dataLink // ignore: cast_nullable_to_non_nullable
              as String,
      volumeInfo: freezed == volumeInfo
          ? _value.volumeInfo
          : volumeInfo // ignore: cast_nullable_to_non_nullable
              as BookData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookSearchDataImpl implements _BookSearchData {
  const _$BookSearchDataImpl(
      {this.id = "no_id",
      @JsonKey(name: "selfLink") this.dataLink = "no_link",
      this.volumeInfo});

  factory _$BookSearchDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookSearchDataImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: "selfLink")
  final String dataLink;
  @override
  final BookData? volumeInfo;

  @override
  String toString() {
    return 'BookSearchData(id: $id, dataLink: $dataLink, volumeInfo: $volumeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookSearchDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dataLink, dataLink) ||
                other.dataLink == dataLink) &&
            (identical(other.volumeInfo, volumeInfo) ||
                other.volumeInfo == volumeInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, dataLink, volumeInfo);

  /// Create a copy of BookSearchData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookSearchDataImplCopyWith<_$BookSearchDataImpl> get copyWith =>
      __$$BookSearchDataImplCopyWithImpl<_$BookSearchDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookSearchDataImplToJson(
      this,
    );
  }
}

abstract class _BookSearchData implements BookSearchData {
  const factory _BookSearchData(
      {final String id,
      @JsonKey(name: "selfLink") final String dataLink,
      final BookData? volumeInfo}) = _$BookSearchDataImpl;

  factory _BookSearchData.fromJson(Map<String, dynamic> json) =
      _$BookSearchDataImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "selfLink")
  String get dataLink;
  @override
  BookData? get volumeInfo;

  /// Create a copy of BookSearchData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookSearchDataImplCopyWith<_$BookSearchDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

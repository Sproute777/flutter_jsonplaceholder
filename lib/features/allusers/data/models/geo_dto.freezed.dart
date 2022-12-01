// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoDto _$GeoDtoFromJson(Map<String, dynamic> json) {
  return _GeoDto.fromJson(json);
}

/// @nodoc
mixin _$GeoDto {
  String get lat => throw _privateConstructorUsedError;
  String get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoDtoCopyWith<GeoDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoDtoCopyWith<$Res> {
  factory $GeoDtoCopyWith(GeoDto value, $Res Function(GeoDto) then) =
      _$GeoDtoCopyWithImpl<$Res, GeoDto>;
  @useResult
  $Res call({String lat, String lng});
}

/// @nodoc
class _$GeoDtoCopyWithImpl<$Res, $Val extends GeoDto>
    implements $GeoDtoCopyWith<$Res> {
  _$GeoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoDtoCopyWith<$Res> implements $GeoDtoCopyWith<$Res> {
  factory _$$_GeoDtoCopyWith(_$_GeoDto value, $Res Function(_$_GeoDto) then) =
      __$$_GeoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lat, String lng});
}

/// @nodoc
class __$$_GeoDtoCopyWithImpl<$Res>
    extends _$GeoDtoCopyWithImpl<$Res, _$_GeoDto>
    implements _$$_GeoDtoCopyWith<$Res> {
  __$$_GeoDtoCopyWithImpl(_$_GeoDto _value, $Res Function(_$_GeoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_GeoDto(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoDto implements _GeoDto {
  _$_GeoDto({required this.lat, required this.lng});

  factory _$_GeoDto.fromJson(Map<String, dynamic> json) =>
      _$$_GeoDtoFromJson(json);

  @override
  final String lat;
  @override
  final String lng;

  @override
  String toString() {
    return 'GeoDto(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoDto &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoDtoCopyWith<_$_GeoDto> get copyWith =>
      __$$_GeoDtoCopyWithImpl<_$_GeoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoDtoToJson(
      this,
    );
  }
}

abstract class _GeoDto implements GeoDto {
  factory _GeoDto({required final String lat, required final String lng}) =
      _$_GeoDto;

  factory _GeoDto.fromJson(Map<String, dynamic> json) = _$_GeoDto.fromJson;

  @override
  String get lat;
  @override
  String get lng;
  @override
  @JsonKey(ignore: true)
  _$$_GeoDtoCopyWith<_$_GeoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

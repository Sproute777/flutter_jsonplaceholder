// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UsersDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  AddressDto get address => throw _privateConstructorUsedError;
  CompanyDto get company => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String username,
      String email,
      String phone,
      String website,
      AddressDto address,
      CompanyDto company});

  $AddressDtoCopyWith<$Res> get address;
  $CompanyDtoCopyWith<$Res> get company;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? phone = null,
    Object? website = null,
    Object? address = null,
    Object? company = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDto,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressDtoCopyWith<$Res> get address {
    return $AddressDtoCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyDtoCopyWith<$Res> get company {
    return $CompanyDtoCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UsersDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$_UsersDtoCopyWith(
          _$_UsersDto value, $Res Function(_$_UsersDto) then) =
      __$$_UsersDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String username,
      String email,
      String phone,
      String website,
      AddressDto address,
      CompanyDto company});

  @override
  $AddressDtoCopyWith<$Res> get address;
  @override
  $CompanyDtoCopyWith<$Res> get company;
}

/// @nodoc
class __$$_UsersDtoCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$_UsersDto>
    implements _$$_UsersDtoCopyWith<$Res> {
  __$$_UsersDtoCopyWithImpl(
      _$_UsersDto _value, $Res Function(_$_UsersDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? phone = null,
    Object? website = null,
    Object? address = null,
    Object? company = null,
  }) {
    return _then(_$_UsersDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressDto,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as CompanyDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersDto implements _UsersDto {
  _$_UsersDto(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.address,
      required this.company});

  factory _$_UsersDto.fromJson(Map<String, dynamic> json) =>
      _$$_UsersDtoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String website;
  @override
  final AddressDto address;
  @override
  final CompanyDto company;

  @override
  String toString() {
    return 'UserDto(id: $id, name: $name, username: $username, email: $email, phone: $phone, website: $website, address: $address, company: $company)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersDtoCopyWith<_$_UsersDto> get copyWith =>
      __$$_UsersDtoCopyWithImpl<_$_UsersDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersDtoToJson(
      this,
    );
  }
}

abstract class _UsersDto implements UserDto {
  factory _UsersDto(
      {required final int id,
      required final String name,
      required final String username,
      required final String email,
      required final String phone,
      required final String website,
      required final AddressDto address,
      required final CompanyDto company}) = _$_UsersDto;

  factory _UsersDto.fromJson(Map<String, dynamic> json) = _$_UsersDto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get username;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get website;
  @override
  AddressDto get address;
  @override
  CompanyDto get company;
  @override
  @JsonKey(ignore: true)
  _$$_UsersDtoCopyWith<_$_UsersDto> get copyWith =>
      throw _privateConstructorUsedError;
}

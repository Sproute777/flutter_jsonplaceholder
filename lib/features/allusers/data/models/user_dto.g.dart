// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UsersDto _$$_UsersDtoFromJson(Map<String, dynamic> json) => _$_UsersDto(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
      address: AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      company: CompanyDto.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UsersDtoToJson(_$_UsersDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
      'company': instance.company,
    };

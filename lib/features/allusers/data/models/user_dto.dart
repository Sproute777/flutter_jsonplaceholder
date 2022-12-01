import 'package:freezed_annotation/freezed_annotation.dart';

import 'address_dto.dart';
import 'company_dto.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@unfreezed
class UserDto with _$UserDto {
  factory UserDto({
    required final int id,
    required final String name,
    required final String username,
    required final String email,
    required final String phone,
    required final String website,
    required final AddressDto address,
    required final CompanyDto company,
  }) = _UsersDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  // T? nullOrFromJson<T extends>(dynamic json){
  //  if( json == null) return null;
  //  final fromJson = T.fromJson(json)

  // }

}

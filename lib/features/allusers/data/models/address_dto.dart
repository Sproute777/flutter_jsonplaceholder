import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo_dto.dart';
part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

@freezed
class AddressDto with _$AddressDto {
  factory AddressDto({
    required final String street,
    required final String suite,
    required final String city,
    required final String zipcode,
    required final GeoDto geo,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  // bool get isEmpty =>
  //     street == null &&
  //     suit == null &&
  //     city == null &&
  //     zipcode == null &&
  //     geo == null;
}

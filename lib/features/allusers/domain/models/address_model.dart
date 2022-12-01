import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/address_dto.dart';
import 'geo_model.dart';
part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    required final String street,
    required final String suite,
    required final String city,
    required final String zipcode,
    required final GeoModel geo,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  factory AddressModel.fromDto(AddressDto dto) => AddressModel(
      street: dto.street,
      suite: dto.suite,
      city: dto.city,
      zipcode: dto.zipcode,
      geo: GeoModel.fromDto(dto.geo));
}

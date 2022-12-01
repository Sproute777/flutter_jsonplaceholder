import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/user_dto.dart';
import 'address_model.dart';
import 'company_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel(
      {required final int id,
      required final String name,
      required final String username,
      required final String email,
      required final String phone,
      required final String website,
      required final AddressModel address,
      required final CompanyModel company}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromDto(UserDto dto) => UserModel(
      id: dto.id,
      name: dto.name,
      username: dto.username,
      email: dto.email,
      phone: dto.phone,
      website: dto.website,
      address: AddressModel.fromDto(dto.address),
      company: CompanyModel.fromDto(dto.company));
}

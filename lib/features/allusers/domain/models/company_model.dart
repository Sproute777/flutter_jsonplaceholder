import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/company_dto.dart';
part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class CompanyModel with _$CompanyModel {
  factory CompanyModel({
    required final String name,
    required final String catchPhrase,
    required final String bs,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  factory CompanyModel.fromDto(CompanyDto dto) =>
      CompanyModel(name: dto.name, catchPhrase: dto.catchPhrase, bs: dto.bs);
}

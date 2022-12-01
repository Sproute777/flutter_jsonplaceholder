import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_dto.freezed.dart';
part 'company_dto.g.dart';

@freezed
class CompanyDto with _$CompanyDto {
  factory CompanyDto({
    required final String name,
    required final String catchPhrase,
    required final String bs,
  }) = _CompanyDto;

  factory CompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDtoFromJson(json);
}

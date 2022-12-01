import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/geo_dto.dart';
part 'geo_model.freezed.dart';
part 'geo_model.g.dart';

@freezed
class GeoModel with _$GeoModel {
  factory GeoModel({
    required double lat,
    required double lng,
  }) = _GeoModel;

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  factory GeoModel.fromDto(GeoDto dto) =>
      GeoModel(lat: double.parse(dto.lat), lng: double.parse(dto.lng));
}

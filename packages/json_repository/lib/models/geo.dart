import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'geo.g.dart';

@JsonSerializable()
class Geo extends Equatable {
  @JsonKey(fromJson: double.parse)
  final double lat;
  @JsonKey(fromJson: double.parse)
  final double lng;
  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
}

import 'package:json_annotation/json_annotation.dart';
part 'photo_dto.g.dart';

@JsonSerializable(createToJson: false)
class PhotoDto {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoDto({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}

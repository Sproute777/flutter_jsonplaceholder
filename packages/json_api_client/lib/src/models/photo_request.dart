import 'package:json_annotation/json_annotation.dart';

part 'photo_request.g.dart';

@JsonSerializable(createFactory: false)
class PhotoRequest {
  @JsonKey(
    name: '_start',
    includeIfNull: false,
  )
  final int? startIndex;

  @JsonKey(
    name: '_limit',
    includeIfNull: false,
  )
  final int? limit;

  @JsonKey(
    includeIfNull: false,
  )
  final int? albumId;

  @JsonKey(
    name: '_sort',
    includeIfNull: false,
  )
  final String? sort;

  @JsonKey(
    name: '_order',
    includeIfNull: false,
  )
  final String? order;

  PhotoRequest({
    this.startIndex,
    this.limit,
    this.albumId,
    this.sort,
    this.order,
  });

  Map<String, dynamic> toJson() => _$PhotoRequestToJson(this);
}

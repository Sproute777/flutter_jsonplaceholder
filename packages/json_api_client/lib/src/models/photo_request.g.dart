// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$PhotoRequestToJson(PhotoRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_start', instance.startIndex);
  writeNotNull('_limit', instance.limit);
  writeNotNull('albumId', instance.albumId);
  writeNotNull('_sort', instance.sort);
  writeNotNull('_order', instance.order);
  return val;
}

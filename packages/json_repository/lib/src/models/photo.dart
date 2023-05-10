import 'package:database_client/database_client.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:equatable/equatable.dart';
import 'package:json_api_client/json_api_client.dart';

class Photo extends Equatable {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromDto(PhotoDto dto) {
    return Photo(
        id: dto.id,
        albumId: dto.albumId,
        title: dto.title,
        url: dto.url,
        thumbnailUrl: dto.thumbnailUrl);
  }

  /// using in [drift] , save class to local storage
  PhotoCompanion toPhotoCompanion(int albumId) => PhotoCompanion(
        album: Value(albumId),
        id: Value(this.id),
        title: Value(this.title),
      );

  /// using in [drift] , convert entry to user class
  factory Photo.fromEntry(PhotoEntry entry) {
    return Photo(
      id: entry.id,
      albumId: entry.album ?? -1,
      title: entry.title ?? 'empty',
      url: entry.url,
      thumbnailUrl: entry.thumbnailUrl,
    );
  }

  @override
  List<Object?> get props => [
        id,
        albumId,
        title,
      ];
}

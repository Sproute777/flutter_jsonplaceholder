import 'package:database_client/database_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:equatable/equatable.dart';

part 'photo.g.dart';

@JsonSerializable()
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

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

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

// {
// "albumId": 1,
// "id": 1,
// "title": "accusamus beatae ad facilis cum similique qui sunt",
// "url": "https://via.placeholder.com/600/92c952",
// "thumbnailUrl": "https://via.placeholder.com/150/92c952"
// },

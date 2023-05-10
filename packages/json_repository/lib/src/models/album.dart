import 'package:database_client/database_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:equatable/equatable.dart';

part 'album.g.dart';

@JsonSerializable()
class Album extends Equatable {
  final int id;
  final int userId;
  final String title;

  Album({
    required this.id,
    required this.userId,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  /// using in [drift] , save class to local storage
  AlbumCompanion toAlbumCompanion(int userId) => AlbumCompanion(
        user: Value(userId),
        id: Value(this.id),
        title: Value(this.title),
      );

  /// using in [drift] , convert entry to user class
  factory Album.fromEntry(AlbumEntry entry) {
    return Album(
      id: entry.id,
      userId: entry.user ?? -1,
      title: entry.title,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
      ];
}

// {
// "userId": 1,
// "id": 1,
// "title": "quidem molestiae enim"
// },

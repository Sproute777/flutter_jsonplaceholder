import 'dart:async';

import 'package:drift/drift.dart';
import '../../database_client.dart';
import '../tables/album_table.dart';
import '../tables/photo_table.dart';

part 'album_dao.g.dart';

@DriftAccessor(tables: const <Type>[Album, Photo])
class AlbumDao extends DatabaseAccessor<DatabaseClient> with _$AlbumDaoMixin {
  final DatabaseClient database;
  AlbumDao(this.database) : super(database);

  Future<void> getAlbum() async => select(album).get();
  Future<void> getPhoto() async => select(photo).get();
}

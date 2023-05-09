import 'dart:async';

import 'package:drift/drift.dart';
import '../../database_client.dart';
import '../tables/album_table.dart';

part 'album_dao.g.dart';

@DriftAccessor(tables: const <Type>[Albums])
class AlbumsDao extends DatabaseAccessor<DatabaseClient> with _$AlbumsDaoMixin {
  final DatabaseClient database;
  AlbumsDao(this.database) : super(database);

  Future<void> todo() async => select(albums).get();
}

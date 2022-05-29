import 'dart:async';

import 'package:drift/drift.dart';
import '../local_datasource.dart';
import '../tables/album_table.dart';

part 'album_dao.g.dart';

@DriftAccessor(tables: const <Type>[Albums])
class AlbumsDao extends DatabaseAccessor<AppDatabase> with _$AlbumsDaoMixin {
  final AppDatabase database;
  AlbumsDao(this.database) : super(database);

  Future<void> todo() async => select(albums).get();
}

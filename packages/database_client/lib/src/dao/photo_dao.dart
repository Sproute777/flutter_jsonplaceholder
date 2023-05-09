import 'dart:async';

import 'package:drift/drift.dart';
import '../../database_client.dart';
import '../tables/photo_table.dart';

part 'photo_dao.g.dart';

@DriftAccessor(tables: const <Type>[Photos])
class PhotosDao extends DatabaseAccessor<DatabaseClient> with _$PhotosDaoMixin {
  final DatabaseClient database;
  PhotosDao(this.database) : super(database);

  Future<void> todo() async => select(photos).get();
}

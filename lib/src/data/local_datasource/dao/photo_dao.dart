import 'dart:async';

import 'package:drift/drift.dart';
import '../local_datasource.dart';
import '../tables/photo_table.dart';

part 'photo_dao.g.dart';

@DriftAccessor(tables: const <Type>[Photos])
class PhotosDao extends DatabaseAccessor<AppDatabase> with _$PhotosDaoMixin {
  final AppDatabase database;
  PhotosDao(this.database) : super(database);

  Future<void> todo() async => select(photos).get();
}

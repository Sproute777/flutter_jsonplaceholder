import 'dart:async';

import 'package:drift/drift.dart';
import '../local_datasource.dart';
import '../tables/post_table.dart';

part 'post_dao.g.dart';

@DriftAccessor(tables: const <Type>[Posts])
class PostsDao extends DatabaseAccessor<AppDatabase> with _$PostsDaoMixin {
  final AppDatabase database;
  PostsDao(this.database) : super(database);

  Future<void> todo() async => select(posts).get();
}

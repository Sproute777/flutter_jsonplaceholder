import 'dart:async';

import 'package:drift/drift.dart';
import '../../database_client.dart';
import '../tables/post_table.dart';

part 'post_dao.g.dart';

@DriftAccessor(tables: const <Type>[Posts])
class PostsDao extends DatabaseAccessor<DatabaseClient> with _$PostsDaoMixin {
  final DatabaseClient database;
  PostsDao(this.database) : super(database);

  Future<void> todo() async => select(posts).get();
}

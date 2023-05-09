import 'dart:async';

import 'package:drift/drift.dart';
import '../../database_client.dart';
import '../tables/comment_table.dart';

part 'comment_dao.g.dart';

@DriftAccessor(tables: const <Type>[Comments])
class CommentsDao extends DatabaseAccessor<DatabaseClient>
    with _$CommentsDaoMixin {
  final DatabaseClient database;
  CommentsDao(this.database) : super(database);

  Future<void> todo() async => select(comments).get();
}

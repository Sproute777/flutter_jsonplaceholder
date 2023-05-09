import 'dart:async';

import 'package:drift/drift.dart';
import '../../database_client.dart';
import '../tables/todo_table.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: const <Type>[Todos])
class TodosDao extends DatabaseAccessor<DatabaseClient> with _$TodosDaoMixin {
  final DatabaseClient database;
  TodosDao(this.database) : super(database);

  Future<void> todo() async => select(todos).get();
}

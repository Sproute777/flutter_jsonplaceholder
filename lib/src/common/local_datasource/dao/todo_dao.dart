import 'dart:async';

import 'package:drift/drift.dart';
import '../local_datasource.dart';
import '../tables/todo_table.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: const <Type>[Todos])
class TodosDao extends DatabaseAccessor<AppDatabase> with _$TodosDaoMixin {
  final AppDatabase database;
  TodosDao(this.database) : super(database);

  Future<void> todo() async => select(todos).get();
}

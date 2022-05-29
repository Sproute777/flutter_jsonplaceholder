import 'package:drift/drift.dart';

@DataClassName('Album')
class Albums extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer()();
  TextColumn get title => text()();

  @override
  Set<Column> get primaryKey => {id};
}

import 'package:database_client/src/tables/user_table.dart';
import 'package:drift/drift.dart';

@DataClassName('AlbumEntry')
class Album extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();

  IntColumn get user => integer().nullable().references(User, #id)();
}

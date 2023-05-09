import 'package:drift/drift.dart';

import 'user_table.dart';

@DataClassName('CompanyEntry')
class Company extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get catchPhrase => text().nullable()();
  TextColumn get bs => text().nullable()();

  IntColumn get user => integer().nullable().references(User, #id)();
}

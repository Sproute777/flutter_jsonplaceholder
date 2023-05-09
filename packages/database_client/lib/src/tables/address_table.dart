import 'package:database_client/src/tables/user_table.dart';
import 'package:drift/drift.dart';

@DataClassName('AddressEntry')
class Address extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get street => text().nullable()();
  TextColumn get suite => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get zipcode => text().nullable()();

  IntColumn get user => integer().nullable().references(User, #id)();

  // RealColumn get lat => real().nullable()();
  // RealColumn get lng => real().nullable()();
}

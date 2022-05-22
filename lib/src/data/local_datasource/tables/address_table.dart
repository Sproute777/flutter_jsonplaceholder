import 'package:drift/drift.dart';

@DataClassName('Address')
class Addresses extends Table {
  IntColumn get userId => integer()();
  TextColumn get street => text().nullable()();
  TextColumn get suite => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get zipcode => text().nullable()();

  TextColumn get lat => text().nullable()();
  TextColumn get lng => text().nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}

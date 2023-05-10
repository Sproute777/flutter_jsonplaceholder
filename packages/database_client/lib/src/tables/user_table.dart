import 'package:drift/drift.dart';

@DataClassName('UserEntry')
class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text()();
  TextColumn get name => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get website => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
}

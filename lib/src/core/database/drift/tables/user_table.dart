import 'package:drift/drift.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer()();
  TextColumn get username => text()();
  TextColumn get name => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  // @JsonKey('other_name')
  TextColumn get website => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

import 'package:drift/drift.dart';

@DataClassName('Company')
class Companies extends Table {
  IntColumn get userId => integer()();
  TextColumn get name => text().nullable()();
  TextColumn get catchPhrase => text().nullable()();
  TextColumn get bs => text().nullable()();

  @override
  Set<Column> get primaryKey => {userId};
}

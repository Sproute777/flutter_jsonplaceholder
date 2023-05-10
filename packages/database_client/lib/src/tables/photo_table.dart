import 'package:drift/drift.dart';

import '../../database_client.dart';
import 'album_table.dart';

@DataClassName('PhotoEntry')
class Photo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
  TextColumn get url => text()();
  TextColumn get thumbnailUrl => text()();
  BlobColumn get cachedImage => blob().nullable()();

  IntColumn get album => integer().nullable().references(Album, #id)();
}

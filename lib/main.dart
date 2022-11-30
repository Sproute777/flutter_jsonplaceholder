import 'package:flutter/material.dart';
import 'bootstrap.dart';
import 'src/app/database/drift/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase database = AppDatabase();

  bootstrap(database: database);
}

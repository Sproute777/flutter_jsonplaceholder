import 'package:flutter/material.dart';
import 'bootstrap.dart';
import 'app/database/drift/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase database = AppDatabase();

  bootstrap(database: database);
}

import 'package:flutter/material.dart';
import 'bootstrap.dart';
import 'src/common/database/drift/drift.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase database = AppDatabase();

  bootstrap(database: database);
}

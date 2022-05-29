import 'package:flutter/material.dart';
import 'bootstrap.dart';
import 'src/common/local_datasource/local_datasource.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase database = AppDatabase();

  bootstrap(database: database);
}

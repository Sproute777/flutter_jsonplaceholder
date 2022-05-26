import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/src/features/photos_infinity/view/photo_infinity_page.dart';
import 'package:flutter_jsonplaceholder/src/features/profile/view/profile_page.dart';

import 'bootstrap.dart';

import 'src/data/local_datasource/local_datasource.dart';
import 'src/data/models/models.dart';
import 'src/features/allusers/view/allusers_page.dart';
import 'src/features/profile/view/profile_tabs_bar.dart';
// import 'src/pages/allusers/view/allusers_page.dart';
// import 'src/pages/profile_2/view/profile_page.dart';

Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final AppDatabase database = AppDatabase();
//   final UsersDao todosDao = UsersDao(database);
//   bootstrap(todosApi: todosDao);

  runApp(MaterialApp(
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse}),
      home: const AllusersPage()));
}

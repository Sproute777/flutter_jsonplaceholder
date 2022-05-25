import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder/src/pages/photos_infinity/view/photo_infinity_page.dart';

import 'bootstrap.dart';

import 'src/data/local_datasource/local_datasource.dart';
import 'src/pages/allusers/view/allusers_page.dart';
import 'src/pages/profile/view/profile_page.dart';

Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final AppDatabase database = AppDatabase();
//   final UsersDao todosDao = UsersDao(database);
//   bootstrap(todosApi: todosDao);

  runApp(MaterialApp(
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse}),
      home: const AllusersPage()));
  // home: ProfilePage(
  //     user: User(
  //         id: 4,
  //         name: 'Some name Alex',
  //         username: 'other username Example',
  //         email: 'example@mail.ru',
  //         phone: '84405903940',
  //         website: 'www.website.com'),
  //     address: Address(
  //         userId: 4,
  //         street: 'street',
  //         suite: 'suite',
  //         city: 'city',
  //         zipcode: '948540',
  //         lat: '456',
  //         lng: '455'),
  //     company: Company(
  //         userId: 4,
  //         name: 'compnay name',
  //         catchPhrase: 'catchPhrase',
  //         bs: 'bs'))
  //         )
  // );
}

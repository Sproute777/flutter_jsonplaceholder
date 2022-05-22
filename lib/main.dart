// import 'dart:ui';

import 'package:flutter/material.dart';

import 'bootstrap.dart';

import 'src/data/local_datasource/local_datasource.dart';
// import 'src/pages/home/view/home_page.dart';
// import 'src/pages/profite/view/profite_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppDatabase database = AppDatabase();
  final UsersDao todosDao = UsersDao(database);
  final user1 = User(
      id: 4,
      name: 'Some name Alex',
      username: 'other username Example',
      email: 'example@mail.ru',
      phone: '84405903940',
      website: 'www.website.com');
  // final map = user1.toJson();
  // print('user is map ${map.runtimeType} ${map.toString()}');

  bootstrap(todosApi: todosDao);
  // runApp(MaterialApp(
  //     scrollBehavior: MaterialScrollBehavior()
  //         .copyWith(dragDevices: {PointerDeviceKind.mouse}),
  //     home: ProfilePage(
  //         user: User(
  //             id: 4,
  //             name: 'Some name Alex',
  //             username: 'other username Example',
  //             email: 'example@mail.ru',
  //             phone: '84405903940',
  //             website: 'www.website.com'),
  //         address: Address(
  //             userId: 4,
  //             street: 'street',
  //             suite: 'suite',
  //             city: 'city',
  //             zipcode: '948540',
  //             lat: '456',
  //             lng: '455'),
  //         company: Company(
  //             userId: 4,
  //             name: 'compnay name',
  //             catchPhrase: 'catchPhrase',
  //             bs: 'bs'))));
}

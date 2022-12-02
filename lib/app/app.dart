import 'package:flutter/material.dart';
import 'dart:ui';
import 'route/router.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);
  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  late final appRouter = AppRouter.createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }
}

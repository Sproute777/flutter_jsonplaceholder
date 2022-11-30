import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/database/drift/drift.dart';
import 'app/route/router.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key, required this.database}) : super(key: key);

  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: database,
      child: const _AppView(),
    );
  }
}

class _AppView extends StatefulWidget {
  const _AppView({Key? key}) : super(key: key);
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
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

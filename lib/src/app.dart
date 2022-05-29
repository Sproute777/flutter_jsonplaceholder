import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/database/drift/drift.dart';

import 'core/route/app_routes.dart';

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

class _AppView extends StatelessWidget {
  const _AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse}),
      routeInformationParser: appRouter().routeInformationParser,
      routerDelegate: appRouter().routerDelegate,
    );
  }
}

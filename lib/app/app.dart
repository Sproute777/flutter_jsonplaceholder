import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_repository/json_repository.dart';
import 'dart:ui';
import '../navigator/app_go_router.dart';

class App extends StatelessWidget {
  final JsonRepository _jsonRepository;
  const App({Key? key, required JsonRepository jsonRepository})
      : _jsonRepository = jsonRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    print('two');
    return RepositoryProvider<JsonRepository>.value(
        value: _jsonRepository, child: const _AppView());
  }
}

class _AppView extends StatefulWidget {
  const _AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  late final appRouter = AppGoRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('three');
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }
}

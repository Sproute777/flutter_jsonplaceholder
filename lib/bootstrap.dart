import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'src/app.dart';
import 'src/data/local_datasource/local_datasource.dart';
import 'package:flutter/widgets.dart';

import 'src/data/todos_repository.dart';

void bootstrap({required UsersDao todosApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          AppView(todosRepository: todosRepository),
        ),
        // blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

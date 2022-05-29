import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';

import 'src/app.dart';
import 'src/common/local_datasource/local_datasource.dart';
import 'src/common/todos_repository.dart';

void bootstrap({required AppDatabase database}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // final todosRepository = TodosRepository(todosApi: todosApi);

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          AppView(database: database),
        ),
        // blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

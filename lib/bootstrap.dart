import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';

import 'src/app.dart';
import 'src/core/database/drift/drift.dart';

void bootstrap({required AppDatabase database}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

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

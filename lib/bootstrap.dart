import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'src/core/utils/app_loging.dart';

import 'src/app.dart';
import 'src/core/database/drift/drift.dart';

void bootstrap({required AppDatabase database}) {
  setLogging();
  FlutterError.onError = (details) {
    developer.log(details.exceptionAsString(), stackTrace: details.stack);
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
    (error, stackTrace) =>
        developer.log(error.toString(), stackTrace: stackTrace),
  );
}

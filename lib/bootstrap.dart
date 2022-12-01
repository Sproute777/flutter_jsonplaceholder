import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';

import 'app.dart';
import 'app/database/drift/app_database.dart';

void bootstrap({required AppDatabase database}) {
  FlutterError.onError = (details) {
    developer.log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () async {
      runApp(
        AppView(database: database),
        // blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) =>
        developer.log(error.toString(), stackTrace: stackTrace),
  );
}

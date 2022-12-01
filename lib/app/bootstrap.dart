import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:developer' as developer;
// import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'app.dart';
import 'database/drift/app_database.dart';

import 'package:get_it/get_it.dart';

import 'bootstrap.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void bootstrap({required AppDatabase database}) {
  FlutterError.onError = (details) {
    developer.log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () async {
      /*await*/ $initGetIt(
        GetIt.instance,
      );
      runApp(
        AppView(database: database),
        // blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) =>
        developer.log(error.toString(), stackTrace: stackTrace),
  );
}

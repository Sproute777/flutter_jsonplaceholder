import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:injectable/injectable.dart';

import 'app.dart';

import 'package:get_it/get_it.dart';

import 'bootstrap.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void bootstrap() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    developer.log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () async {
      /*await*/ $initGetIt(
        GetIt.instance,
      );
      runApp(
        const AppView(),
        // blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) =>
        developer.log(error.toString(), stackTrace: stackTrace),
  );
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'routes/routes.dart';

class AppGoRouter extends GoRouter {
  AppGoRouter()
      : super(
          routes: $appRoutes,
          initialLocation: const SplashRoute().location,
          errorBuilder: const Page404Route().build,
          redirect: (context, goState) {
            debugPrint(' ${goState.location} ${goState.pageKey}');
          },
        ) {
    // subscription = _appBloc.stream.listen((state) {
    //   if (state.status == AppStatus.authenticated) {
    //     super.go(const HomeRoute().location);
    //   }
    // });
  }

  // late StreamSubscription subscription;

  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }
}

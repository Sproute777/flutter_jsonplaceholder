import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/database/drift/drift.dart';
import 'core/models/models.dart';
import 'core/widgets/profile_tabs_bar.dart';
import 'features/allusers/view/allusers_page.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key, required this.database}) : super(key: key);

  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: database,
      child: _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  _AppView({Key? key}) : super(key: key);
  final ValueKey<String> _scaffoldKey = const ValueKey<String>('App scaffold');

  late final GoRouter appRouter = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const AllusersPage(),
      ),
      GoRoute(
        path: '/profile/:kind(user|albums|posts)',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final Map<String, Object> params =
              state.extra! as Map<String, Object>;
          final ProfileUser profileUser = params['profileUser']! as ProfileUser;
          return FadeTransitionPage(
              key: _scaffoldKey,
              child: ProfileTabBar(state.params['kind']!, user: profileUser));
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse}),
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
    );
  }
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}

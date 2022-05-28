import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/models/models.dart';
import 'common/route/app_routes.dart';
import 'common/widgets/profile_tabs_bar.dart';
import 'data/todos_repository.dart';
import 'features/allusers/view/allusers_page.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key, required this.todosRepository}) : super(key: key);

  final TodosRepository todosRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todosRepository,
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
      // GoRoute(
      //     path: '/tab-bar',
      //     builder: (BuildContext context, GoRouterState state) {
      //       final Map<String, Object> params =
      //           state.extra! as Map<String, Object>;
      //       final ProfileUser profileUser =
      //           params['profileUser']! as ProfileUser;
      //       return ProfileTabBar(user: profileUser);
      //     }),
      //          GoRoute(
      //   path: '/profile',
      //   redirect: (_) => '/books/popular',
      // ),
      // GoRoute(
      //   path: '/profile',
      //   redirect: (GoRouterState state) {

      //     return '/profile/user/${state.params['userId']}';
      //   },
      // ),
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

        // routes: <GoRoute>[
        //   GoRoute(
        //     path: ':userId',
        //     builder: (BuildContext context, GoRouterState state) {
        //       final String bookId = state.params['bookId']!;
        //       final Book? selectedBook = libraryInstance.allBooks
        //           .firstWhereOrNull((Book b) => b.id.toString() == bookId);

        //       return BookDetailsScreen(book: selectedBook);
        //     },
        //   ),
        // ],
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
      // home: const AllusersPage(),
    );
  }
}

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
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

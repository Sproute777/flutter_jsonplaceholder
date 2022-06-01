import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/allusers/view/allusers_page.dart';
import '../models/models.dart';
import '../widgets/profile_tabs_bar.dart';

GoRouter appRouter() => GoRouter(
      routerNeglect: true,

      initialLocation: '/',
      // errorPageBuilder: (ctx, state) => MaterialPage(child: AllusersPage()),
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const AllusersPage(),
        ),
        GoRoute(
          path: '/profile/:kind(user|albums|posts)',
          builder: (BuildContext context, GoRouterState state) {
            final Map<String, Object> params =
                state.extra! as Map<String, Object>;
            final ProfileUser profileUser =
                params['profileUser']! as ProfileUser;
            return ProfileTabBar(state.params['kind']!, user: profileUser);
          },
        ),
      ],
    );

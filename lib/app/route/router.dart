import 'package:go_router/go_router.dart';

import 'routes/app_routes.dart';

abstract class AppRouter {

  static GoRouter createRouter() => GoRouter(
      routerNeglect: true,
      initialLocation: '/',
      // errorPageBuilder: (ctx, state) => MaterialPage(child: AllusersPage()),
      routes: $appRoutes);
}

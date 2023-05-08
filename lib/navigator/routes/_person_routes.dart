part of 'routes.dart';

@TypedShellRoute<PersonTabsRoutes>(routes: <TypedGoRoute>[
  TypedGoRoute<PersonInfoRoute>(path: '/person/:userId/info'),
  TypedGoRoute<PostsRoute>(path: '/person/:userId/posts'),
  TypedGoRoute<AlbumRoute>(path: '/person/:userId/album')
])
class PersonTabsRoutes extends ShellRouteData {
  const PersonTabsRoutes();

  @override
  Page<void> pageBuilder(
          BuildContext context, GoRouterState state, Widget navigator) =>
      NoTransitionPage(child: ProfileTabsPage(child: navigator));
}

class PersonInfoRoute extends GoRouteData {
  PersonInfoRoute(this.userId);
  final String userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: PersonInfoPage());
}

class PostsRoute extends GoRouteData {
  PostsRoute(this.userId);
  final String userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(child: PostsPage(userId: userId));
}

class AlbumRoute extends GoRouteData {
  AlbumRoute(this.userId);
  final String userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(child: AlbumPage(userId: userId));
}

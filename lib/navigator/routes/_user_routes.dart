part of 'routes.dart';

@TypedShellRoute<UserTabsRoutes>(routes: <TypedGoRoute>[
  TypedGoRoute<UserInfoRoute>(path: '/user/:userId/info'),
  TypedGoRoute<PostsRoute>(path: '/user/:userId/posts'),
  TypedGoRoute<AlbumRoute>(path: '/user/:userId/album')
])
class UserTabsRoutes extends ShellRouteData {
  const UserTabsRoutes();

  @override
  Page<void> pageBuilder(
          BuildContext context, GoRouterState state, Widget navigator) =>
      NoTransitionPage(child: ProfileTabsPage(child: navigator));
}

class UserInfoRoute extends GoRouteData {
  UserInfoRoute(this.userId);
  final int userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: PersonInfoPage(userId: userId));
}

class PostsRoute extends GoRouteData {
  PostsRoute(this.userId);
  final int userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(child: PostsPage(userId: userId));
}

class AlbumRoute extends GoRouteData {
  AlbumRoute(this.userId);
  final int userId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(child: AlbumPage(userId: userId));
}

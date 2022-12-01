part of 'app_routes.dart';

@TypedGoRoute<AllusersRoute>(path: '/',routes: <TypedGoRoute>[
TypedGoRoute<UserRoute>(path: '/pofile/user'),
TypedGoRoute<PostsRoute>(path: '/profile/posts'),
TypedGoRoute<AlbumsRoute>(path: '/profile/albums')
] )
class AllusersRoute extends GoRouteData {
  const AllusersRoute();

  @override
  Widget build(BuildContext context) => const AllusersPage();
}

// AllusersPage()

// @TypedGoRoute<UserRoute>(path: '/pofile/user')
class UserRoute extends GoRouteData {
  UserRoute({this.$extra});
  final ProfileUser? $extra;

  @override
  Page<void> buildPageWithState(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(child: ProfileTabBar('user', user: $extra!));
}

class PostsRoute extends GoRouteData {
  PostsRoute({this.$extra});
  final ProfileUser? $extra;

  @override
  Page<void> buildPageWithState(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(child: ProfileTabBar('posts', user: $extra!));
  // @override
  // Widget build(BuildContext context) => ProfileTabBar('posts', user: $extra);
}

class AlbumsRoute extends GoRouteData {
  AlbumsRoute({this.$extra});
  final ProfileUser? $extra;

  @override
  Page<void> buildPageWithState(BuildContext context, GoRouterState state) =>
      MaterialPage<Object>(child: ProfileTabBar('albums', user: $extra!));
  // @override
  // Widget build(BuildContext context) => ProfileTabBar('albums', user: $extra);
}

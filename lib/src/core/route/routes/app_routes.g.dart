// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $userRoute,
      $albumsRoute,
      $postsRoute,
      $allusersRoute,
    ];

GoRoute get $userRoute => GoRouteData.$route(
      path: '/pofile/user',
      factory: $UserRouteExtension._fromState,
    );

extension $UserRouteExtension on UserRoute {
  static UserRoute _fromState(GoRouterState state) => UserRoute(
        $extra: state.extra as ProfileUser?,
      );

  String get location => GoRouteData.$location(
        '/pofile/user',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $albumsRoute => GoRouteData.$route(
      path: '/profile/albums',
      factory: $AlbumsRouteExtension._fromState,
    );

extension $AlbumsRouteExtension on AlbumsRoute {
  static AlbumsRoute _fromState(GoRouterState state) => AlbumsRoute(
        $extra: state.extra as ProfileUser?,
      );

  String get location => GoRouteData.$location(
        '/profile/albums',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $postsRoute => GoRouteData.$route(
      path: '/profile/posts',
      factory: $PostsRouteExtension._fromState,
    );

extension $PostsRouteExtension on PostsRoute {
  static PostsRoute _fromState(GoRouterState state) => PostsRoute(
        $extra: state.extra as ProfileUser?,
      );

  String get location => GoRouteData.$location(
        '/profile/posts',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $allusersRoute => GoRouteData.$route(
      path: '/',
      factory: $AllusersRouteExtension._fromState,
    );

extension $AllusersRouteExtension on AllusersRoute {
  static AllusersRoute _fromState(GoRouterState state) => const AllusersRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

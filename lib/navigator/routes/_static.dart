part of 'routes.dart';

@TypedGoRoute<SplashRoute>(
  path: '/',
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}

@TypedGoRoute<Page404Route>(
  path: '/page-404',
)
class Page404Route extends GoRouteData {
  const Page404Route();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotFoundPage();
}

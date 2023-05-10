part of 'routes.dart';

@TypedGoRoute<Page404Route>(
  path: '/page-404',
)
class Page404Route extends GoRouteData {
  const Page404Route();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotFoundPage();
}

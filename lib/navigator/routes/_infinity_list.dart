part of 'routes.dart';

@TypedGoRoute<InfinityListRoute>(
  path: '/infinity-list',
)
class InfinityListRoute extends GoRouteData {
  const InfinityListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InfinityListPage();
}

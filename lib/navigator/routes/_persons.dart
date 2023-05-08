part of 'routes.dart';

@TypedGoRoute<CatalogUsersRoute>(path: '/catalog-users')
class CatalogUsersRoute extends GoRouteData {
  const CatalogUsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CatalogUsersPage();
}

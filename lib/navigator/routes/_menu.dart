part of 'routes.dart';

@TypedGoRoute<MenuRoute>(
  path: '/',
)
class MenuRoute extends GoRouteData {
  const MenuRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MenuPage();
}

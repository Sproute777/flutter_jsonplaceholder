part of 'app_routes.dart';

@TypedGoRoute<AllusersRoute>(path: '/')
class AllusersRoute extends GoRouteData {
  const AllusersRoute();

  @override
  Widget build(BuildContext context) => const AllusersPage();
}

// AllusersPage()
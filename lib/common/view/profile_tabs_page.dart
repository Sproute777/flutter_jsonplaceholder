import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonplaceholder/features/allusers/data/datasources/allusers_datasources.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
// import '../../../../app/database/drift/database_client.dart';
// import '../../../../app/database/drift/dao/user_dao.dart';
// import '../../../../app/route/routes/app_routes.dart';
// import '../../cubit/allusers_cubit.dart';
// import '../../data/allusers_api_client.dart';
// import '../../data/allusers_repository.dart';
// import '../../domain/repositories/allusers_repository.dart';
import '../../features/allusers/domain/repositories/allusers_repository.dart';
import '../../features/allusers/presentation/bloc/allusers_bloc.dart';
import '../widgets/profile_adaptive_scaffold.dart';

class ProfileTabsPage extends StatefulWidget {
  final Widget child;

  const ProfileTabsPage({Key? key, required this.child}) : super(key: key);

  @override
  State<ProfileTabsPage> createState() => _ProfileTabsPageState();
}

class _ProfileTabsPageState extends State<ProfileTabsPage> {
  // final routes = [
  int getCurrentIndex(BuildContext context) {
    // final String location = GoRouter.of(context).location;
    // if (location == const PointsListRoute().location) {
    //   return 0;
    // } else if (location == const RecordingsRoute().location) {
    //   return 1;
    // } else if (location == const DevicesRoute().location) {
    //   return 2;
    // } else if (location == const SettingsMenuRoute().location) {
    //   return 3;
    // }
    return 0;
  }

  void navigateByIndex(int index, BuildContext context) {
    // switch (index) {
    //   case 0:
    //     const PointsListRoute().go(context);
    //     break;
    //   case 1:
    //     const RecordingsRoute().go(context);
    //     break;
    //   case 2:
    //     const DevicesRoute().go(context);
    //     break;
    //   case 3:
    //     const SettingsMenuRoute().go(context);
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileAdaptiveScaffold(
        body: (_) => widget.child,
        onSelectedIndexChange: (int index) {
          navigateByIndex(index, context);
        },
        selectedIndex: getCurrentIndex(context),
      ),
    );
  }
}

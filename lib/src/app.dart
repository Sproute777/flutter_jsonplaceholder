import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'common/l10n/generated/l10n.dart';
// import 'common/theme/theme.dart';
import 'common/app/bloc/app_bloc.dart';
import 'data/todos_repository.dart';
import 'common/bloc_observer/home.dart';

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       // watch internet connection for us
//       create: (context) =>
//           AppBloc(Connectivity())..add(AppConnectivitySubscriptionRequested()),
//       child: AppView(),
//     );
//   }
// }

// class AppView extends StatelessWidget {
//   const AppView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class AppView extends StatelessWidget {
  const AppView({Key? key, required this.todosRepository}) : super(key: key);

  final TodosRepository todosRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todosRepository,
      child: _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

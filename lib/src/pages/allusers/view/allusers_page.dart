import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonplaceholder/src/data/remote_datasource/jsonplaceholder_api_client.dart';

import '../cubit/allusers_cubit.dart';

class AllusersPage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (_) => AllusersPage());
  const AllusersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AllusersCubit(JsonplaceholderApiClient()),
        child: _AllusersView());
  }
}

class _AllusersView extends StatelessWidget {
  const _AllusersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllusersCubit, AllusersState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Text('list view item');
              }));
        },
      ),
    );
  }
}

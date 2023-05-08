import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_bloc_ui/json_bloc_ui.dart';
import 'package:json_repository/json_repository.dart';

import '../bloc/catalog_users_bloc.dart';

class CatalogUsersPage extends StatelessWidget {
  const CatalogUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatalogUsersBloc(
          jsonRepository: RepositoryProvider.of<JsonRepository>(context),
          retryPolicy: const NetworkRetryPolicy())
        ..add(const LoadCatalogUsersRequest()),
      child: const _CatalogUsersView(),
    );
  }
}

class _CatalogUsersView extends StatelessWidget {
  const _CatalogUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Catalog users'),
      ),
      body: BlocBuilder<CatalogUsersBloc, CatalogUsersState>(
        builder: (context, state) {
          switch (state.status) {
            case PersonsStatus.init:
            case PersonsStatus.loading:
              return const Center(child: Text('loading'));
            case PersonsStatus.loaded:
              return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.users[index].name),
                      subtitle: Text(state.users[index].username),
                      trailing: const Icon(Icons.keyboard_arrow_down),
                      onTap: () {},
                    );
                  });
            case PersonsStatus.failure:
              return const Center(child: Text('failure'));
          }
        },
      ),
    );
  }
}

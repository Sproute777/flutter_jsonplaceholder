import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonplaceholder/navigator/routes/routes.dart';
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
        actions: [
          TextButton(
            onPressed: () => _fetchRemoteUsers(context),
            child: const Text('Fetch remote',
                style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () => _loadLocalUsers(context),
            child: const Text(
              'Load local',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 32),
        ],
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
                      subtitle: Column(
                        children: [
                          Text(state.users[index].username),
                          Text(state.users[index].address?.city ?? 'empty'),
                          Text(state.users[index].company?.name ?? 'empty'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () => _deleteUser(
                                      context, state.users[index].id),
                                  child: const Icon(Icons.delete)),
                              ElevatedButton(
                                  onPressed: () =>
                                      UserInfoRoute(state.users[index].id)
                                          .go(context),
                                  child: const Icon(Icons.person)),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            case PersonsStatus.failure:
              return const Center(child: Text('failure'));
          }
        },
      ),
    );
  }

  void _deleteUser(BuildContext context, int userId) {
    context.read<CatalogUsersBloc>().add(DeleteLocalUserRequest(userId));
  }

  void _loadLocalUsers(BuildContext context) {
    context.read<CatalogUsersBloc>().add(const LoadLocalCatalogUsersRequest());
  }

  void _fetchRemoteUsers(BuildContext context) {
    context.read<CatalogUsersBloc>().add(const LoadCatalogUsersRequest());
  }
}

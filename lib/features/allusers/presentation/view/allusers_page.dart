import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonplaceholder/core/http/app_api_service.dart';
import 'package:flutter_jsonplaceholder/features/allusers/data/datasources/allusers_datasources.dart';
import 'package:get_it/get_it.dart';
// import '../../../../app/database/drift/app_database.dart';
// import '../../../../app/database/drift/dao/user_dao.dart';
// import '../../../../app/route/routes/app_routes.dart';
// import '../../cubit/allusers_cubit.dart';
// import '../../data/allusers_api_client.dart';
// import '../../data/allusers_repository.dart';
// import '../../domain/repositories/allusers_repository.dart';
import '../../domain/repositories/allusers_repository.dart';
import '../bloc/allusers_bloc.dart';

class AllusersPage extends StatelessWidget {
  const AllusersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AllusersBloc(
              AllusersRepositoryImpl(GetIt.I.get()
                  // ),
                  // ),
                  ),
            )..add(const AllusersEvent.read()),
        child: const _AllusersView());
  }
}

class _AllusersView extends StatelessWidget {
  const _AllusersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleText = Theme.of(context).textTheme.titleLarge;
    final supbtileText = Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // context.read<AllusersBloc>().fetchUsers();
            },
          ),
        )
      ]),
      body: BlocBuilder<AllusersBloc, AllusersState>(builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: CircularProgressIndicator()),
          loaded: (users) => ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return InkWell(
                  highlightColor: Colors.green[100],
                  splashColor: Colors.green[200],
                  onTap: () {
                    // AlbumsRoute($extra: users[index]).go(context);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Expanded(
                            child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/bordeaux-mastif.jpg'),
                        )),
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                users[index].name,
                                style: titleText,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(users[index].username, style: supbtileText),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              }),
          failure: () => const Center(child: Text('error')),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonplaceholder/src/data/remote_datasource/jsonplaceholder_api_client.dart';

import '../cubit/allusers_cubit.dart';

class AllusersPage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (_) => const AllusersPage());
  const AllusersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AllusersCubit(JsonplaceholderApiClient())..fetchUsers(),
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
              context.read<AllusersCubit>().fetchUsers();
            },
          ),
        )
      ]),
      body:
          BlocBuilder<AllusersCubit, AllusersState>(builder: (context, state) {
        switch (state.runtimeType) {
          case AllusersLoading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case AllusersFailure:
            return Center(child: Text(state.error ?? ''));

          case AllusersSuccess:
            return ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                    ),
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                                state.users[index].user.name ?? '',
                                style: titleText,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(state.users[index].user.username,
                                  style: supbtileText),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                }));

          default:
            return const Text('no data');
        }
      }),
    );
  }
}

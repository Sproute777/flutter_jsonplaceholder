import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/remote_datasource/jsonplaceholder_api_client.dart';
import '../cubit/posts_cubit.dart';

class PostsPage extends StatelessWidget {
  final int userId;
  const PostsPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostsCubit(JsonplaceholderApiClient(), userId: userId)..fetchPosts(),
      child: const _PageView(),
    );
  }
}

class _PageView extends StatelessWidget {
  const _PageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostsStatus.error:
              return const Center(child: Text('failed to fetch posts'));
            case PostsStatus.success:
              if (state.posts.isEmpty) {
                return const Center(child: Text('no photos'));
              }
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.blue[800]!,
                            width: 1.0,
                            style: BorderStyle.solid),
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue[50]!,
                              Colors.blue[100]!,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    alignment: Alignment.center,
                    // height: 60,
                    child: ExpansionTile(
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      title: Text(state.posts[index].title),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(state.posts[index].body),
                        )
                      ],
                    ),
                  );
                },
              );

            case PostsStatus.loading:
              return const Center(child: CircularProgressIndicator());

            default:
              return const Center(
                child: Text('--------'),
              );
          }
        },
      ),
    );
  }
}

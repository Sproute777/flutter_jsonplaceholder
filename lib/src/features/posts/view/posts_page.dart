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
              return Container();
            // return ListView.builder(
            //   padding: const EdgeInsets.all(32),
            //   itemCount: state.hasReachedMax
            //       ? state.photos.length
            //       : state.photos.length + 3,
            //   controller: _scrollController,
            //   itemBuilder: (context, index) => index >= state.photos.length
            //       ? const BottomLoader()
            //       : PhotoItem(
            //           photo: state.photos[index],
            //           onTap: () => setState(() =>
            //               _expandedIndices.contains(index)
            //                   ? _expandedIndices.remove(index)
            //                   : _expandedIndices.add(index)),
            //         ),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     mainAxisSpacing: 16.0,
            //     crossAxisSpacing: 16.0,
            //   ),
            // );

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

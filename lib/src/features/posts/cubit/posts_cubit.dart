import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/models/models.dart';
import '../data/posts_api_client.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsApiClient _apiClient;
  final int userId;

  PostsCubit(PostsApiClient apiClient, {required this.userId})
      : _apiClient = apiClient,
        super(const PostsState.initial());

  Future<void> fetchPosts() async {
    emit(const PostsState.loading());

    try {
      final posts = await _apiClient.fetchPosts();
      emit(PostsState.success(posts));
    } catch (e) {
      emit(const PostsState.error());
    }
  }
}

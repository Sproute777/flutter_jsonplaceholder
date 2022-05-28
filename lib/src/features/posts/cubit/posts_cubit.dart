import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/remote_datasource/jsonplaceholder_api_client.dart';
import '../../../common/models/models.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final JsonplaceholderApiClient _apiClient;
  final int userId;

  PostsCubit(JsonplaceholderApiClient apiClient, {required this.userId})
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

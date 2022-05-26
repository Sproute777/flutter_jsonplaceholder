import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jsonplaceholder/src/data/remote_datasource/jsonplaceholder_api_client.dart';

import '../../../data/models/models.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final JsonplaceholderApiClient _apiClient;
  AlbumCubit(JsonplaceholderApiClient apiClient)
      : _apiClient = apiClient,
        super(const AlbumState.initial());

  Future<void> fetchAlbums(int userId) async {
    emit(const AlbumState.loading());
    try {
      final albums = await _apiClient.fetchAlbums(userId);
      emit(AlbumState.success(albums));
    } catch (e) {
      emit(const AlbumState.error());
    }
  }
}

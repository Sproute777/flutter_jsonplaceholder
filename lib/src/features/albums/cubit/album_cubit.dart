import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../common/models/models.dart';
import '../data/albums_api_client.dart';

part 'album_state.dart';

class AlbumsCubit extends Cubit<AlbumState> {
  final AlbumsApiClient _apiClient;
  AlbumsCubit(AlbumsApiClient apiClient)
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

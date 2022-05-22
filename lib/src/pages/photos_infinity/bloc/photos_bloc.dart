import 'package:bloc/bloc.dart';
import '../../../data/remote_datasource/jsonplaceholder_api_client.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../data/models/models.dart';

part 'photos_event.dart';
part 'photos_state.dart';

const throttleDuration = Duration(milliseconds: 200);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  JsonplaceholderApiClient _apiClient;
  PhotosBloc(JsonplaceholderApiClient apiClient)
      : _apiClient = apiClient,
        super(PhotosState()) {
    on<PhotosFetched>(_onPhotosFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onPhotosFetched(
    PhotosFetched event,
    Emitter<PhotosState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PhotosStatus.initial) {
        final photos = await _apiClient.fetchPhotos(startIndex: 0, limit: 20);

        return emit(state.copyWith(
          status: PhotosStatus.success,
          photos: photos,
          hasReachedMax: false,
        ));
      }
      final photos =
          await _apiClient.fetchPhotos(startIndex: state.photos.length);
      photos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PhotosStatus.success,
                photos: List.of(state.photos)..addAll(photos),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PhotosStatus.failure));
    }
  }
}

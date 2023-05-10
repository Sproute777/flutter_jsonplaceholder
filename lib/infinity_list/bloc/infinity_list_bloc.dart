import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_repository/json_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'infinity_list_event.dart';

part 'infinity_list_state.dart';

const _photoLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class InfinityListBloc extends Bloc<InfinityListEvent, InfinityListState> {
  final JsonRepository _jsonRepository;

  InfinityListBloc(
    JsonRepository jsonRepository,
  )   : _jsonRepository = jsonRepository,
        super(const InfinityListState()) {
    on<FetchInfinityListRequest>(
      _onFetchInfinityListRequest,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onFetchInfinityListRequest(
      FetchInfinityListRequest event, Emitter<InfinityListState> emit) async {
    if (state.hasReachedMax) return;
    emit(state.copyWith(status: InfinityListStatus.loading));
    try {
      if (state.status == InfinityListStatus.init) {
        final photos = await _jsonRepository.fetchPhotos(
            startIndex: 0, limit: _photoLimit);
        return emit(
          state.copyWith(
            status: InfinityListStatus.loaded,
            photos: photos,
            hasReachedMax: false,
          ),
        );
      }
      emit(state.copyWith(status: InfinityListStatus.loading));
      final photos = await _jsonRepository.fetchPhotos(
          startIndex: state.photos.length, limit: _photoLimit);
      photos.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: InfinityListStatus.loaded,
                photos: List.of(state.photos)..addAll(photos),
                hasReachedMax: false,
              ),
            );
    } catch (error, stackTrace) {
      emit(state.copyWith(status: InfinityListStatus.failure));
    }
  }
}

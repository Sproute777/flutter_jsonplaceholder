part of 'infinity_list_bloc.dart';

enum InfinityListStatus { init, loading, loaded, failure }

class InfinityListState extends Equatable {
  final List<Photo> photos;
  final InfinityListStatus status;
  final bool hasReachedMax;

  const InfinityListState({
    this.photos = const <Photo>[],
    this.status = InfinityListStatus.init,
    this.hasReachedMax = false,
  });

  @override
  List<Object> get props => [
        photos,
        status,
        hasReachedMax,
      ];

  InfinityListState copyWith({
    List<Photo>? photos,
    InfinityListStatus? status,
    bool? hasReachedMax,
  }) {
    return InfinityListState(
      photos: photos ?? this.photos,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

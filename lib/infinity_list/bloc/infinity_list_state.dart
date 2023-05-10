part of 'infinity_list_bloc.dart';

enum InfinityListStatus {init,loading,loaded,failure}

class InfinityListState extends Equatable {
 final List<Photo> photos;
 class InfinityListState({
   this.photos = const <Photo>[],
   this.status = InfinityListStatus.init,
 });

  @override
  List<Object> get props => [];
}

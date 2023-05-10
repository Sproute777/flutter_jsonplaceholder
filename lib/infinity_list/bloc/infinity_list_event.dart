part of 'infinity_list_bloc.dart';

abstract class InfinityListEvent extends Equatable {
  const InfinityListEvent();
}

class FetchInfinityListRequest extends InfinityListEvent {
  const FetchInfinityListRequest();

  @override
  List<Object?> get props => [];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'infinity_list_event.dart';
part 'infinity_list_state.dart';

class InfinityListBloc extends Bloc<InfinityListEvent, InfinityListState> {
  InfinityListBloc() : super(InfinityListState()) {
    on<InfinityListEvent>((event, emit) {});
    on<FetchInfinityListRequest>(_onFetchInfinityListRequest);
  }

  Future<void> _onFetchInfinityListRequest(
      FetchInfinityListRequest event, Emitter<InfinityListState> emit) async {
    // emit()
  }
}

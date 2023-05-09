import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ininity_list_event.dart';
part 'ininity_list_state.dart';

class IninityListBloc extends Bloc<IninityListEvent, IninityListState> {
  IninityListBloc() : super(IninityListInitial()) {
    on<IninityListEvent>((event, emit) {});
  }
}

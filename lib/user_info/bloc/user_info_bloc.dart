import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_repository/json_repository.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final JsonRepository _jsonRepository;

  UserInfoBloc(JsonRepository jsonRepository)
      : _jsonRepository = jsonRepository,
        super(const UserInfoState()) {
    on<FetchSingleUserRequest>(_onFetchUserRequest);
  }

  Future<void> _onFetchUserRequest(
      FetchSingleUserRequest event, Emitter<UserInfoState> emit) async {
    emit(state.copyWith(status: UserInfoStatus.loading));
    try {
      final user = await _jsonRepository.fetchSingleUser(event.userId);
      emit(state.copyWith(status: UserInfoStatus.loaded, user: user));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: UserInfoStatus.failure));
      addError(error);
    }
  }
}

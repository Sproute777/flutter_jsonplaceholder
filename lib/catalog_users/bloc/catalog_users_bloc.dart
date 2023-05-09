import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_bloc_ui/json_bloc_ui.dart';
import 'package:json_repository/json_repository.dart';
import 'package:json_repository/models/user.dart';

part 'catalog_users_event.dart';

part 'catalog_users_state.dart';

class CatalogUsersBloc extends Bloc<CatalogUsersEvent, CatalogUsersState> {
  final JsonRepository _jsonRepository;
  final NetworkRetryPolicy _retryPolicy;

  CatalogUsersBloc(
      {required JsonRepository jsonRepository, retryPolicy: NetworkRetryPolicy})
      : _jsonRepository = jsonRepository,
        _retryPolicy = retryPolicy,
        super(const CatalogUsersState()) {
    on<LoadCatalogUsersRequest>(_onLoadCatalogUsersRequest);
    on<LoadLocalCatalogUsersRequest>(_onLoadLocalCatalogUsersRequest);
    on<DeleteLocalUserRequest>(_onDeleteLocalUserRequest);
  }

  Future<void> _onLoadCatalogUsersRequest(
      LoadCatalogUsersRequest event, Emitter<CatalogUsersState> emit) async {
    try {
      emit(state.copyWith(status: PersonsStatus.loading));
      await Future.delayed(const Duration(seconds: 1));
      final result = await _jsonRepository.fetchUsers();
      emit(CatalogUsersState(users: result, status: PersonsStatus.loaded));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: PersonsStatus.failure));

      if (event.retry < _retryPolicy.maxRetryCount) {
        final nextRetry = event.retry + 1;
        await Future<void>.delayed(
          _retryPolicy.getIntervalForRetry(nextRetry),
        );
        add(LoadCatalogUsersRequest(retry: nextRetry));
      }
    }
  }

  Future<void> _onLoadLocalCatalogUsersRequest(
      LoadLocalCatalogUsersRequest event,
      Emitter<CatalogUsersState> emit) async {
    try {
      emit(state.copyWith(status: PersonsStatus.loading));
      await Future.delayed(const Duration(seconds: 1));
      final result = await _jsonRepository
          .fetchLocalUsers()
          .timeout(const Duration(seconds: 5));
      emit(CatalogUsersState(users: result, status: PersonsStatus.loaded));
    } catch (error) {
      emit(state.copyWith(status: PersonsStatus.failure));
      addError(error);
    }
  }

  Future<void> _onDeleteLocalUserRequest(
      DeleteLocalUserRequest event, Emitter<CatalogUsersState> emit) async {
    try {
      emit(state.copyWith(status: PersonsStatus.loading));
      await Future.delayed(const Duration(seconds: 1));
      await _jsonRepository
          .deleteLocalUser(event.userId)
          .timeout(const Duration(seconds: 2));

      emit(CatalogUsersState(
          users: List.of(state.users)..removeWhere((u) => u.id == event.userId),
          status: PersonsStatus.loaded));
    } catch (error) {
      emit(state.copyWith(status: PersonsStatus.failure));
      addError(error);
    }
  }
}

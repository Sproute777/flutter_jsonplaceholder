import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:database_client/database_client.dart' as d;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
  }

  Future<void> _onLoadCatalogUsersRequest(
      LoadCatalogUsersRequest event, Emitter<CatalogUsersState> emit) async {
    try {
      emit(state.copyWith(status: PersonsStatus.loading));
      final result = await _jsonRepository.fetchUsers();
      emit(CatalogUsersState(users: result, status: PersonsStatus.loaded));
    } catch (error) {
      emit(state.copyWith(status: PersonsStatus.failure));
      addError(error);

      if (event.retry < _retryPolicy.maxRetryCount) {
        final nextRetry = event.retry + 1;
        await Future<void>.delayed(
          _retryPolicy.getIntervalForRetry(nextRetry),
        );
        add(LoadCatalogUsersRequest(retry: nextRetry));
      }
    }
  }
}

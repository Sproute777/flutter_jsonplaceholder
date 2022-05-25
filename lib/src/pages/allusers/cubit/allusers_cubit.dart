import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_jsonplaceholder/src/data/remote_datasource/jsonplaceholder_api_client.dart';

import '../../../data/models/models.dart';

part 'allusers_state.dart';

class AllusersCubit extends Cubit<AllusersState> {
  final JsonplaceholderApiClient _apiClient;
  AllusersCubit(JsonplaceholderApiClient apiClient)
      : _apiClient = apiClient,
        super(AllusersInitial());

  Future<void> fetchUsers() async {
    try {
      emit(AllusersLoading());
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final profileUsers = await _apiClient.fetchUsers();
      emit(AllusersSuccess(profileUsers));
    } catch (e) {
      if (e is HttpException) {
        emit(const AllusersFailure("something went wrong"));
      }
      if (e is JsonDeserializationException) {
        emit(const AllusersFailure('json falure'));
      } else if (e is HttpRequestFailure) {
        emit(AllusersFailure('http status code ${e.statusCode.toString()}'));
      } else {
        emit(const AllusersFailure('unsupported failure'));
      }
    }
  }
}

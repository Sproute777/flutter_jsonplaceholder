import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/models.dart';
import '../../../core/utils/http_errors.dart';
import '../data/allusers_api_client.dart';
import '../data/allusers_repository.dart';

part 'allusers_state.dart';

class AllusersCubit extends Cubit<AllusersState> {
  final AllusersApiClient _apiClient;
  final AllusersRepository _repository;
  AllusersCubit(AllusersApiClient apiClient, AllusersRepository repository)
      : _apiClient = apiClient,
        _repository = repository,
        super(AllusersInitial());

  Future<void> fetchUsers() async {
    try {
      emit(AllusersLoading());
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final profileUsers = await _apiClient.fetchUsers();
      emit(AllusersSuccess(profileUsers));
    } catch (e) {
      // on Exception catch(e) или on Object
      if (e is HttpException || e is JsonDeserializationException) {
        emit(const AllusersFailure("something went wrong"));
      } else if (e is HttpRequestFailure) {
        emit(AllusersFailure('http status code ${e.statusCode.toString()}'));
      } else {
        emit(const AllusersFailure('unsupported failure'));
      }
    }
  }
}

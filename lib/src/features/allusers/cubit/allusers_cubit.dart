import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/models/models.dart';
import '../../../common/utils/http_errors.dart';
import '../data/allusers_api_client.dart';

part 'allusers_state.dart';

class AllusersCubit extends Cubit<AllusersState> {
  final AllusersApiClient _apiClient;
  AllusersCubit(AllusersApiClient apiClient)
      : _apiClient = apiClient,
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

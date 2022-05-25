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
}

// import 'package:injectable/injectable.dart';

import '../../../../core/http/app_api_service.dart';
import '../models/user_dto.dart';

// @lazySingleton
class AllusersRemoteDatasources {
  const AllusersRemoteDatasources({required AppApiService apiService})
      : _apiService = apiService;
  final AppApiService _apiService;

  Future<List<UserDto>> fetchUsers() async {
    var r = await _apiService.getUsers();
    var jsonR = await _apiService.getUsersJson();
    print(jsonR);
    return r;
  }

  // Future<List<GameTypeDto>> fetchGamesTypes(
  //     {String? fromTime, String? toTime, int? gameType}) async {
  //   final json = await _apiService.getTypes(GameTypeQueries());
  //   return _parseGamesTypes(json);
  // }

}

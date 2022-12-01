import 'package:dio/dio.dart';
import 'package:flutter_jsonplaceholder/const/endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

// import '../../const/endpoints.dart';
import '../../const/http_config.dart';
import '../../features/allusers/data/models/user_dto.dart';

part 'app_api_service.g.dart';

// ignore: unnecessary_string_interpolations
@RestApi(baseUrl: '${HttpConfig.baseUrl}')
@injectable
abstract class AppApiService {
  @factoryMethod
  factory AppApiService(Dio dio) = _AppApiService;

  // /// получить история сыгранных игр
  @GET(Endpoints.users)
  Future<List<UserDto>> getUsers(
      // @Queries() ReportsQueriesParam? params,
      );

  @GET(Endpoints.users)
  Future<String> getUsersJson(
      // @Queries() ReportsQueriesParam? params,
      );
  // /// получить одну сыгранную игру
  // @GET('/{id}')
  // Future<String> getReport({
  //   @Path() required int id,
  //   @Queries() ReportsSingleQueriesParam? params,
  // });
}

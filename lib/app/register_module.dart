import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/constant.dart';
import '../const/http_config.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  @Named('BaseUrl')
  String get baseUrl => HttpConfig.baseUrl;

  @Named('ContentType')
  String get contentType => kContentType;

  @preResolve
  @lazySingleton
  Future<Dio> dio(
    @Named('BaseUrl') String url,
    @Named('ContentType') String contentType,
  ) async {
    // final email = await GetIt.I.get<SecureStorage>().getEmail();
    //log('\u001b[34mTOKEN: $token');
    // log('\u001b[34mEMAIL: $email');

    // final interceptors = [
    // AuthInterceptor(),
    // LoggingInterceptor(),
    // ];

    return Dio(
      BaseOptions(
        baseUrl: url,
        contentType: contentType,
      ),
    );
    // ..interceptors.addAll(interceptors);
  }
}

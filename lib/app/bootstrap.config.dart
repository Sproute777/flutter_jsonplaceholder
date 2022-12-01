// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_jsonplaceholder/core/http/app_api_service.dart' as _i5;
import 'package:flutter_jsonplaceholder/features/allusers/data/datasources/allusers_datasources.dart'
    as _i6;
import 'package:flutter_jsonplaceholder/features/allusers/domain/repositories/allusers_repository.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'register_module.dart' as _i8;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<String>(
    () => registerModule.contentType,
    instanceName: 'ContentType',
  );
  await gh.lazySingletonAsync<_i4.Dio>(
    () => registerModule.dio(
      gh<String>(instanceName: 'BaseUrl'),
      gh<String>(instanceName: 'ContentType'),
    ),
    preResolve: true,
  );
  gh.factory<_i5.AppApiService>(() => _i5.AppApiService(gh<_i4.Dio>()));
  gh.factory<_i6.AllusersRemoteDatasources>(
      () => _i6.AllusersRemoteDatasources(apiService: gh<_i5.AppApiService>()));
  gh.factory<_i7.AllusersRepository>(
      () => _i7.AllusersRepositoryImpl(gh<_i6.AllusersRemoteDatasources>()));
  return getIt;
}

class _$RegisterModule extends _i8.RegisterModule {}

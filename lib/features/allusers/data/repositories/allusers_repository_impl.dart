import 'package:flutter_jsonplaceholder/features/allusers/data/datasources/allusers_datasources.dart';

import '../../domain/models/user_model.dart';
import '../../domain/repositories/allusers_repository.dart';

class AllusersRepositoryImpl implements AllusersRepository {
  final AllusersRemoteDatasources _allusersRemoteDatasources;
  AllusersRepositoryImpl(AllusersRemoteDatasources allusersRemoteDatasources)
      : _allusersRemoteDatasources = allusersRemoteDatasources;

  @override
  Future<List<UserModel>> fetchUsers() async {
    final usersDto = await _allusersRemoteDatasources.fetchUsers();
    return usersDto.map((dto) => UserModel.fromDto(dto)).toList();
  }
}

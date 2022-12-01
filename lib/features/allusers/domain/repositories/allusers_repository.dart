import 'package:injectable/injectable.dart';

import '../../data/datasources/allusers_datasources.dart';
import '../models/user_model.dart';

abstract class AllusersRepository {
  Future<List<UserModel>> fetchUsers();
}

@Injectable(as: AllusersRepository)
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

import '../models/user_model.dart';

abstract class AllusersRepository {
  Future<List<UserModel>> fetchUsers();
}

part of 'json_repository.dart';

class JsonStorage {
  final DatabaseClient _databaseClient;

  JsonStorage(DatabaseClient databaseClient) : _databaseClient = databaseClient;

  Future<void> saveUsers(List<User> users) {
    final userCompanion = users.map((user) => user.toUsersCompanion()).toList();
    final addressCompanion = users
        .where((u) => u.address != null)
        .map((user) => user.address!.toAddressesCompanion(user.id))
        .toList();
    final companyCompanion = users
        .where((u) => u.company != null)
        .map((user) => user.company!.toCompanyCompanion(user.id))
        .toList();
    return _databaseClient.userDao
        .saveUsers(userCompanion, addressCompanion, companyCompanion);
  }

  Future<List<UserEntry>> fetchUserEntries() {
    return _databaseClient.userDao.fetchUsers();
  }

  Future<List<AddressEntry>> fetchAddressEntries() {
    return _databaseClient.userDao.fetchAddresses();
  }

  Future<List<UserFullEntry>> fetchUserFullEntries() {
    return _databaseClient.userDao.fetchUserFullEntries();
  }

  Future<void> deleteUser(int userId) {
    return _databaseClient.userDao.deleteUser(userId);
  }
}

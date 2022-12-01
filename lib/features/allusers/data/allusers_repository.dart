// import '../../../app/database/drift/app_database.dart';
// import '../../../app/database/drift/dao/user_dao.dart';

// class AllusersRepository {
//   const AllusersRepository(UsersDao usersDao) : _usersDao = usersDao;
//   final UsersDao _usersDao;

//   Future<void> saveUser(UsersCompanion user) async => _usersDao.saveUser(user);

//   Future<void> deleteUser(int id) async => _usersDao.deleteUser(id);

//   Future<void> saveUsers(List<UsersCompanion> listUsers) async {
//     _usersDao.saveUsers(listUsers);
//   }

//   Future<List<Address>> fetchAddresses() async => _usersDao.fetchAddresses();
//   Future<List<Company>> fetchCompanies() async => _usersDao.fetchCompanies();

//   Future<void> saveAddress(AddressesCompanion address) async =>
//       await _usersDao.saveAddress(address);

//   Future<void> saveCompany(CompaniesCompanion company) async =>
//       await _usersDao.saveCompany(company);

//   Future<void> clearUsers() async => await _usersDao.clearUsers();

//   Future<void> saveUserFromMap(List<Map<String, dynamic>> listMap) async =>
//       _usersDao.saveUsersFromMap(listMap);

//   Future<List<User>> fetchUsers() async => _usersDao.fetchUsers();
// }

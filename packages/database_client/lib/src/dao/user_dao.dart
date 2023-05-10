import 'dart:async';

import 'package:drift/drift.dart';
import '../../database_client.dart';
import '../tables/tables.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [User, Address, Company])
class UserDao extends DatabaseAccessor<DatabaseClient> with _$UserDaoMixin {
  final DatabaseClient database;

  UserDao(this.database) : super(database);

  // -------------------------------------------------------------------------//
  Future<void> clearUsers() async {
    return transaction(() async {
      await delete(user).go();
      await delete(address).go();
      await delete(company).go();
    });
  }

  Future<void> saveUser(UserCompanion userCompanion) async {
    await into(user).insert(userCompanion, mode: InsertMode.replace);
  }

// ----------------------------------------------------------------------------//
  Future<void> deleteUser(int id) async {
    return transaction(() async {
      await (address.update()..where((address) => address.user.equals(id)))
          .write(AddressCompanion(user: Value(null)));

      await (company.update()..where((address) => company.user.equals(id)))
          .write(CompanyCompanion(user: Value(null)));
      await user.deleteWhere((u) => u.id.equals(id));
    });
  }

// ----------------------------------------------------------------------------//
  Future<void> saveUsers(
    List<UserCompanion> listUsers,
    List<AddressCompanion> listAddresses,
    List<CompanyCompanion> listCompanies,
  ) async {
    await batch((batch) {
      batch.insertAll(user, listUsers);
      batch.insertAll(address, listAddresses);
      batch.insertAll(company, listCompanies);
    });
  }

// ----------------------------------------------------------------------------//

  // Future<void> saveUsersFromMap(List<Map<String, dynamic>> listMap) async {
  //   final listUsers = listMap.map((e) => UserEntry.fromJson(e));
  //   batch(
  //     (b) => Future.forEach(
  //       listUsers,
  //       (UserEntry u) => b.insert(
  //           user,
  //           UserCompanion.insert(
  //             id: Value(u.id),
  //             name: Value(u.name),
  //             username: u.username,
  //             email: Value(u.email),
  //             phone: Value(u.phone),
  //             website: Value(u.website),
  //           ),
  //           mode: InsertMode.replace),
  //     ),
  //   );
  // }

  // -------------------------------------------------------------------------//

  Future<void> saveAddress(AddressCompanion addressCompanion) async {
    await into(address).insert(addressCompanion, mode: InsertMode.replace);
  }

  Future<List<AddressEntry>> fetchAddresses() async =>
      await select(address).get();

  // -------------------------------------------------------------------------//

  Future<void> saveCompany(CompanyCompanion companyCompanion) async {
    await into(company).insert(companyCompanion, mode: InsertMode.replace);
  }

  Future<List<CompanyEntry>> fetchCompanies() async =>
      await select(company).get();

// ---------------------------------------------------------------------------//
  Future<List<UserEntry>> fetchUsers() async {
    return await select(user).get();
  }

  // ---------------------------------------------------------------------------//

  Future<List<UserFullEntry>> fetchUserFullEntries() async {
    final query = await select(user).join([
      leftOuterJoin(address, address.user.equalsExp(user.id)),
      leftOuterJoin(company, company.user.equalsExp(user.id)),
    ]).get();

    return query.map((row) {
      return UserFullEntry(
        userEntry: row.readTable(user),
        addressEntry: row.readTableOrNull(address),
        companyEntry: row.readTableOrNull(company),
      );
    }).toList();
  }
// ---------------------------------------------------------------------------//
}

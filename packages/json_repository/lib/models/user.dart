import 'package:database_client/database_client.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_repository/models/address.dart';

import 'company.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: false)
class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address? address;
  final Company? company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    this.address,
    this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// using in [drift] , save class to local storage
  UserCompanion toUsersCompanion() {
    return UserCompanion(
        id: Value(this.id),
        name: Value(this.name),
        username: Value(this.username),
        email: Value(this.email),
        phone: Value(this.phone),
        website: Value(this.website),
        createdAt: Value(DateTime.now()));
  }

  /// using in [drift] , convert entry to user class
  factory User.fromEntry(UserEntry entry, AddressEntry? addressEntry,
          CompanyEntry? companyEntry) =>
      User(
        id: entry.id,
        name: entry.name ?? 'empty',
        username: entry.username,
        email: entry.email ?? 'empty',
        phone: entry.phone ?? 'empty',
        website: entry.website ?? 'empty',
        address: addressEntry != null ? Address.fromEntry(addressEntry) : null,
        company: companyEntry != null ? Company.fromEntry(companyEntry) : null,
      );

  @override
  List<Object?> get props => [id, name, username, email, phone, website];
}

// {
// "id": 1,
// "name": "Leanne Graham",
// "username": "Bret",
// "email": "Sincere@april.biz",
// "address": {
// "street": "Kulas Light",
// "suite": "Apt. 556",
// "city": "Gwenborough",
// "zipcode": "92998-3874",
// "geo": {
// "lat": "-37.3159",
// "lng": "81.1496"
// }
// },
// "phone": "1-770-736-8031 x56442",
// "website": "hildegard.org",
// "company": {
// "name": "Romaguera-Crona",
// "catchPhrase": "Multi-layered client-server neural-net",
// "bs": "harness real-time e-markets"
// }
// },

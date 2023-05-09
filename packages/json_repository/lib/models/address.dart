import 'package:database_client/database_client.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:equatable/equatable.dart';

import 'geo.dart';
part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo? geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// using in [drift] , save class to local storage
  AddressCompanion toAddressesCompanion(int userId) => AddressCompanion(
        user: Value(userId),
        street: Value(this.street),
        city: Value(this.city),
        suite: Value(this.city),
        zipcode: Value(this.zipcode),
        // lat: geo?.lat == null ? Value.absent() : Value(geo!.lat),
        // lng: geo?.lng == null ? Value.absent() : Value(geo!.lng),
      );

  /// using in [drift] , convert entry to user class
  factory Address.fromEntry(AddressEntry entry) {
    // final geo = (entry.lat != null && entry.lng != null)
    //     ? Geo(lat: entry.lat!, lng: entry.lng!)
    //     : null;
    return Address(
      street: entry.street ?? 'empty',
      suite: entry.suite ?? 'empty',
      city: entry.city ?? 'empty',
      zipcode: entry.zipcode ?? 'empty',
      // geo: geo,
    );
  }

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}

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

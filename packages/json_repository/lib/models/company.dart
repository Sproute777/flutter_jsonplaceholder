import 'package:database_client/database_client.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company extends Equatable {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  /// using in [drift] , save class to local storage
  CompanyCompanion toCompanyCompanion(int userId) => CompanyCompanion(
        user: Value(userId),
        name: Value(this.name),
        catchPhrase: Value(this.catchPhrase),
        bs: Value(this.bs),
      );

  /// using in [drift] , convert entry to user class
  factory Company.fromEntry(CompanyEntry entry) {
    return Company(
      name: entry.name ?? 'empty',
      catchPhrase: entry.catchPhrase ?? 'empty',
      bs: entry.bs ?? 'empty',
      // geo: geo,
    );
  }

  @override
  List<Object?> get props => [
        name,
        catchPhrase,
        bs,
      ];
}

// "name": "Romaguera-Crona",
// "catchPhrase": "Multi-layered client-server neural-net",
// "bs": "harness real-time e-markets"

import 'package:database_client/database_client.dart'
    show UserEntry, AddressEntry, CompanyEntry;

class UserFullEntry {
  UserFullEntry({
    required this.userEntry,
    this.addressEntry,
    this.companyEntry,
  });

  final UserEntry userEntry;
  final AddressEntry? addressEntry;
  final CompanyEntry? companyEntry;
}

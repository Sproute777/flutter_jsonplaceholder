// import 'package:equatable/equatable.dart';
//
// import 'models.dart';
//
// class ProfileUser extends Equatable {
//   final User user;
//   final Address? address;
//   final Company? company;
//   const ProfileUser({
//     required this.user,
//     this.address,
//     this.company,
//   });
//
//   ProfileUser copyWith(
//           {User? user,
//           Address? Function()? address,
//           Company? Function()? company}) =>
//       ProfileUser(
//           user: user ?? this.user,
//           address: address != null ? address() : this.address,
//           company: company != null ? company() : this.company);
//
//   @override
//   List<Object?> get props => [user, address, company];
// }

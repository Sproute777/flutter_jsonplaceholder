part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({this.user, this.address, this.company});
  final User? user;
  final Address? address;
  final Company? company;

  @override
  List<Object?> get props => [user, address, company];
}

class ProfileInitial extends ProfileState {}

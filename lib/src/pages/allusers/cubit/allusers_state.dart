part of 'allusers_cubit.dart';

abstract class AllusersState extends Equatable {
  const AllusersState({this.users = const <ProfileUser>[]});
  final List<ProfileUser> users;

  @override
  List<Object> get props => [users];
}

class AllusersInitial extends AllusersState {}

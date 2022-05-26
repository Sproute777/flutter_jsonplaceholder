part of 'allusers_cubit.dart';

abstract class AllusersState extends Equatable {
  const AllusersState({this.users = const <ProfileUser>[], this.error});
  final String? error;
  final List<ProfileUser> users;

  @override
  List<Object?> get props => [users, error];
}

class AllusersLoading extends AllusersState {}

class AllusersInitial extends AllusersState {}

class AllusersFailure extends AllusersState {
  const AllusersFailure(this.message) : super(error: message);
  final String message;
}

class AllusersSuccess extends AllusersState {
  const AllusersSuccess(this.profileUsers) : super(users: profileUsers);
  final List<ProfileUser> profileUsers;
}

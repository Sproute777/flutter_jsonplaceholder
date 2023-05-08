part of 'catalog_users_bloc.dart';

enum PersonsStatus { init, loading, loaded, failure }

class CatalogUsersState extends Equatable {
  final List<User> users;
  final PersonsStatus status;

  const CatalogUsersState({
    this.users = const <User>[],
    this.status = PersonsStatus.init,
  });

  @override
  List<Object> get props => [users, status];

  CatalogUsersState copyWith({
    List<User>? users,
    PersonsStatus? status,
  }) {
    return CatalogUsersState(
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }
}

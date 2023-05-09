part of 'user_info_bloc.dart';

enum UserInfoStatus { init, loading, loaded, failure }

class UserInfoState extends Equatable {
  final User? user;
  final int userId;
  final UserInfoStatus status;

  const UserInfoState({
    this.status = UserInfoStatus.init,
    this.user,
    this.userId = -1,
  });

  @override
  List<Object?> get props => [user];

  UserInfoState copyWith({
    User? user,
    UserInfoStatus? status,
    int? userId,
  }) {
    return UserInfoState(
      user: user ?? this.user,
      userId: userId ?? this.userId,
      status: status ?? this.status,
    );
  }
}

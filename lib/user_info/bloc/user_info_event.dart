part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();
}

class FetchSingleUserRequest extends UserInfoEvent {
  const FetchSingleUserRequest(this.userId);
  final int userId;
  @override
  List<Object?> get props => [userId];
}

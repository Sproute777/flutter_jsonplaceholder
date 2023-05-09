part of 'catalog_users_bloc.dart';

abstract class CatalogUsersEvent extends Equatable {
  const CatalogUsersEvent();
}

class LoadCatalogUsersRequest extends CatalogUsersEvent {
  const LoadCatalogUsersRequest({this.retry = 0});

  final int retry;

  @override
  List<Object> get props => [retry];
}

class LoadLocalCatalogUsersRequest extends CatalogUsersEvent {
  const LoadLocalCatalogUsersRequest();

  @override
  List<Object> get props => [];
}

class DeleteLocalUserRequest extends CatalogUsersEvent {
  const DeleteLocalUserRequest(this.userId);
  final int userId;

  @override
  List<Object> get props => [userId];
}

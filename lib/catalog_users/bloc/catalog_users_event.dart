part of 'catalog_users_bloc.dart';

abstract class CatalogUsersEvent extends Equatable {
  const CatalogUsersEvent();

  @override
  List<Object> get props => [];
}

class LoadCatalogUsersRequest extends CatalogUsersEvent {
  const LoadCatalogUsersRequest({this.retry = 0});

  final int retry;

  @override
  List<Object> get props => [retry];
}

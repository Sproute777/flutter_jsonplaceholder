part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({this.connectivityResult = ConnectivityResult.none});

  final ConnectivityResult connectivityResult;

  AppState copyWith({
    ConnectivityResult? connectivityResult,
  }) {
    return AppState(
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }

  @override
  List<Object> get props => [connectivityResult];
}

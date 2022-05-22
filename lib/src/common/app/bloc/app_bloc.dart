import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(Connectivity connectivity)
      : _connectivity = connectivity,
        super(AppState()) {
    on<AppConnectivitySubscriptionRequested>(_onSubscriptionRequested);
  }

  final Connectivity _connectivity;

  Future<void> _onSubscriptionRequested(
    AppConnectivitySubscriptionRequested event,
    Emitter<AppState> emit,
  ) async {
    await emit.forEach<ConnectivityResult>(
      _connectivity.onConnectivityChanged,
      onData: (connectivityResult) => state.copyWith(
        connectivityResult: connectivityResult,
      ),
    );
  }
}

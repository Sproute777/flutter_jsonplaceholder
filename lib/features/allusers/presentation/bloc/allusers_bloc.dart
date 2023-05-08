// import 'package:bloc/bloc.dart';
// import 'package:bloc_concurrency/bloc_concurrency.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import '../../domain/models/user_model.dart';
// import '../../domain/repositories/allusers_repository.dart';
//
// part 'allusers_bloc.freezed.dart';
//
// @freezed
// class AllusersEvent with _$AllusersEvent {
//   const AllusersEvent._();
//
//   const factory AllusersEvent.read() = ReadAllusersEvent;
// }
//
// @freezed
// class AllusersState with _$AllusersState {
//   const AllusersState._();
//
//   const factory AllusersState.initial() = InitialAllusersState;
//
//   const factory AllusersState.loading() = LoadingAllusersState;
//
//   const factory AllusersState.loaded(List<UserModel> result) =
//       LoadedAllusersState;
//
//   const factory AllusersState.failure() = FailureAllusersState;
// }
//
// class AllusersBloc extends Bloc<AllusersEvent, AllusersState> {
//   final AllusersRepository _allusersRepository;
//   AllusersBloc(AllusersRepository allusersRepository)
//       : _allusersRepository = allusersRepository,
//         super(const InitialAllusersState()) {
//     on<AllusersEvent>(
//         (event, emit) => event.map<Future<void>>(
//               read: (event) => _read(event, emit),
//             ),
//         transformer: sequential());
//   }
//
//   Future<void> _read(
//       ReadAllusersEvent event, Emitter<AllusersState> emit) async {
//     emit(const AllusersState.loading());
//
//     try {
//       final users = await _allusersRepository.fetchUsers();
//       emit(AllusersState.loaded(users));
//     } catch (_) {
//       emit(const AllusersState.failure());
//       rethrow;
//     }
//   }
// }

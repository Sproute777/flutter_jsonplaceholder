import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit() : super(AlbumInitial());
}

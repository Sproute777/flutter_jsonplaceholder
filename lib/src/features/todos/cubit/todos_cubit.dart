import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/models/models.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(const TodosState());
}

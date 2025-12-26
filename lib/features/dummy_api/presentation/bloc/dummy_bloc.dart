import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/task.dart';
import 'package:demo_app_three/features/dummy_api/domain/usecase/get_data_usecase.dart';
import 'package:demo_app_three/features/dummy_api/domain/usecase/get_tasks.dart';
import 'package:demo_app_three/features/dummy_api/usecase.dart';
import 'package:meta/meta.dart';

part 'dummy_event.dart';
part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  final GetDataUseCase _getDataUseCase;
  final GetTasksUseCase _getTasksUseCase;

  DummyBloc({
    required GetDataUseCase getDataUseCase,
    required GetTasksUseCase getTasksUseCase,
  }) : _getDataUseCase = getDataUseCase,
       _getTasksUseCase = getTasksUseCase,
       super(DummyInitial()) {
    on<GetAllPostsEvent>(_getAllPostsEvent);
    on<GetAllTasksEvent>(_getAllTasksEvent);
  }

  Future<void> _getAllPostsEvent(
    GetAllPostsEvent event,
    Emitter<DummyState> emit,
  ) async {
    emit(LoadingState());

    final users = await _getDataUseCase.call(NoParams());

    if (users.isEmpty) {
      emit(ErrorState());
    } else {
      emit(SuccessState(users: users));
    }
  }

  FutureOr<void> _getAllTasksEvent(
    GetAllTasksEvent event,
    Emitter<DummyState> emit,
  ) async {
    emit(LoadingState());

    final tasks = await _getTasksUseCase.call(NoParams());

    if (tasks.isEmpty) {
      emit(ErrorState());
    } else {
      emit(TasksSuccessState(tasks: tasks));
    }
  }
}

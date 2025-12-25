import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';
import 'package:demo_app_three/features/dummy_api/domain/usecase/get_data_usecase.dart';
import 'package:demo_app_three/features/dummy_api/usecase.dart';
import 'package:meta/meta.dart';

part 'dummy_event.dart';

part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  final GetDataUseCase _getDataUseCase;

  DummyBloc({required GetDataUseCase getDataUseCase})
    : _getDataUseCase = getDataUseCase,
      super(DummyInitial()) {
    on<GetAllPostsEvent>(_getAllPostsEvent);
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
}

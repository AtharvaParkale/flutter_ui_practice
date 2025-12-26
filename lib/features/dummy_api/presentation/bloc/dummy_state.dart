part of 'dummy_bloc.dart';

@immutable
sealed class DummyState {}

final class DummyInitial extends DummyState {}

class SuccessState implements DummyState {
  final List<User> users;

  SuccessState({required this.users});
}

class LoadingState implements DummyState {}

class ErrorState implements DummyState {}

class TasksSuccessState implements DummyState {
  final List<Task> tasks;

  TasksSuccessState({required this.tasks});
}

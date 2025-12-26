part of 'dummy_bloc.dart';

@immutable
sealed class DummyEvent {}

class GetAllPostsEvent implements DummyEvent {}

class GetAllTasksEvent implements DummyEvent {}

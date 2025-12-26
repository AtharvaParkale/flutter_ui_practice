import 'sub_task.dart';

class Task {
  final String title;
  final int id;
  final List<SubTask> subTasks;

  Task({required this.title, required this.id, required this.subTasks});
}

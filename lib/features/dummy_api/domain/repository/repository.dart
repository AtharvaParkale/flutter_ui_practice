import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/task.dart';

abstract class Repository {
  Future<List<User>> getData();

  Future<List<Task>> getTasks();
}

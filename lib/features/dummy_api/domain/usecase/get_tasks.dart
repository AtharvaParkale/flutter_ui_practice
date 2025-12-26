import 'package:demo_app_three/features/dummy_api/domain/entities/task.dart';
import 'package:demo_app_three/features/dummy_api/domain/repository/repository.dart';
import 'package:demo_app_three/features/dummy_api/usecase.dart';

class GetTasksUseCase implements UseCase<List<Task>, NoParams> {
  final Repository repository;

  GetTasksUseCase(this.repository);

  @override
  Future<List<Task>> call(NoParams params) async {
    return await repository.getTasks();
  }
}

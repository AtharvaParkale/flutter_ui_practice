import 'package:demo_app_three/features/dummy_api/data/datasources/remote_datasource.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/task.dart';
import 'package:demo_app_three/features/dummy_api/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource datasource;

  RepositoryImpl(this.datasource);

  @override
  Future<List<User>> getData() async {
    final response = await datasource.getData();
    return response.map((elem) => elem as User).toList();
  }

  @override
  Future<List<Task>> getTasks() async {
    final response = await datasource.getTasks();
    return response.map((e) => e as Task).toList();
  }
}

import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';
import 'package:demo_app_three/features/dummy_api/domain/repository/repository.dart';
import 'package:demo_app_three/features/dummy_api/usecase.dart';

class GetDataUseCase implements UseCase<List<User>, NoParams> {
  final Repository repository;

  GetDataUseCase(this.repository);

  @override
  Future<List<User>> call(NoParams params) async {
    return await repository.getData();
  }
}

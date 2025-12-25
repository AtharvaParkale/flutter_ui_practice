import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';

abstract class Repository {
  Future<List<User>> getData();
}

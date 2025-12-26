import 'package:demo_app_three/features/dummy_api/domain/entities/sub_task.dart';

class SubTaskModel extends SubTask {
  SubTaskModel({required super.description, required super.id});

  factory SubTaskModel.fromJson(Map<String, dynamic> json) {
    return SubTaskModel(description: json["description"], id: json["id"]);
  }
}

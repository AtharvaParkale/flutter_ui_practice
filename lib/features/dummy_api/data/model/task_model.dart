import 'package:demo_app_three/features/dummy_api/data/model/sub_task_model.dart';
import 'package:demo_app_three/features/dummy_api/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({required super.title, required super.id, required super.subTasks});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subTasks": subTasks
          .map((e) => (e as SubTaskModel).toJson())
          .toList(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json["title"] ?? "",
      id: json["id"] ?? 0,
      subTasks: (json["subTasks"] as List)
          .map((e) => SubTaskModel.fromJson(e))
          .toList(),
    );
  }
}

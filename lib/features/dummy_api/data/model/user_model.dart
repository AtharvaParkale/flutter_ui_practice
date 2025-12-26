import 'package:demo_app_three/features/dummy_api/domain/entities/person.dart';

class UserModel extends User {
  UserModel({required super.id, required super.title, required super.body});

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "body": body};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      body: json["body"] ?? "",
    );
  }
}

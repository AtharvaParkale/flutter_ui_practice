import 'dart:convert';

import 'package:demo_app_three/features/dummy_api/data/model/task_model.dart';
import 'package:demo_app_three/features/dummy_api/data/model/user_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteDataSource {
  Future<List<UserModel>> getData();

  Future<List<TaskModel>> getTasks();
}

class RemoteDatasourceImpl implements RemoteDataSource {
  @override
  Future<List<UserModel>> getData() async {
    try {
      final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      final response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );

      // response => Json

      final decoded = jsonDecode(response.body);

      // Reponse List<Map<String, dynamic>>
      return decoded
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e, s) {
      print("Error: ${e}");
      print("Stack: ${s}");
      return [];
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final String response = await rootBundle.loadString(
        "assets/data/tasks.json",
      );

      final List<dynamic> decodedData = jsonDecode(response);

      return decodedData.map((e) => TaskModel.fromJson(e)).toList();
    } catch (e, st) {
      print("Error: $e");
      print("Stack: $st");
      return [];
    }
  }

  Future<void> saveUsers(List<UserModel> users) async {
    final prefs = await SharedPreferences.getInstance();

    final userModelList = users.map((user) => user.toJson()).toList();

    final String usersJson = jsonEncode(userModelList);

    await prefs.setString('users_list', usersJson);
  }

  Future<List<UserModel>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();

    final String? usersJson = prefs.getString('users_list');

    if (usersJson == null) return [];

    final List decoded = jsonDecode(usersJson);

    return decoded
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

// Http -> Json Response -> Json Decode -> decoded.map((elem)=> TaskModel.fromJson(elem as Map<String, dynamic>)).toList()

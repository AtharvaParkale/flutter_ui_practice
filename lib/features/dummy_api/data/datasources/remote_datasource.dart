import 'dart:convert';

import 'package:demo_app_three/features/dummy_api/data/model/user_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<UserModel>> getData();
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

      final List decoded = jsonDecode(response.body);
      return decoded.map((json) => UserModel.fromJson(json)).toList();
    } catch (e, s) {
      print("Error: ${e}");
      print("Stack: ${s}");
      return [];
    }
  }
}

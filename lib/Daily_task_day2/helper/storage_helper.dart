import 'dart:convert';

import 'package:placement_task/Daily_task_day2/controller.dart';
import 'package:http/http.dart'as http;
class AuthServices {
  AuthServices._();
  static AuthServices authServices = AuthServices._();

  Future<void> login(String username,String password)
  async {
    final url = Uri.parse('${ApiConstants.baseUrl} ${ApiConstants.loginEndpoint}');

    final response = await http.post(
      url,
      body:  json.encode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      return userData;
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }
}

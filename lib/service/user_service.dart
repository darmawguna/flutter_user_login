import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_user_login/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://localhost:8000';

  static Future<UserDTO> login(LoginData data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      body: {'email': data.name, 'password': data.password},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final token = jsonData['token'];
      var userData = jsonData['data'];
      userData['token'] = token;
      
      return UserDTO.fromJson(userData);
    } else {
      // Jika status code bukan 200, tangani kesalahan
      throw Exception('Failed to login');
    }
  }
}

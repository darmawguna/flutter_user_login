import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_user_login/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000';

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

      // Save token and user type to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setInt('userType', userData['type']);

      return UserDTO.fromJson(userData);
    } else {
      // Handle non-200 status code
      throw Exception('Failed to login');
    }
  }
}

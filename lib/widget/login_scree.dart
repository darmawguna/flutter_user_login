import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_user_login/model/user_model.dart';
import 'package:flutter_user_login/screens/home.dart';
import 'package:flutter_user_login/service/user_service.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  Duration get loginTime => const Duration(milliseconds: 2250);
  Future<String?> _authUser(BuildContext context, LoginData data) async {
    try {
      final UserDTO user = await ApiService.login(data);
      // tambahkan shared preference untuk menyimpan login
      if (user.type == 1) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Home(userType: 'admin')),
        );
      } else if (user.type == 0) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home(userType: 'user')),
        );
      } else {
        // Login gagal
        return 'Login failed';
      }
    } catch (e) {
      // Tangani kesalahan
      print(e);
      return 'An error occurred: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Login',
      onLogin: (data) => _authUser(context, data),
      onSignup: (_) => Future.delayed(loginTime),
      onSubmitAnimationCompleted: () {},
      onRecoverPassword: (String) {},
    );
  }
}

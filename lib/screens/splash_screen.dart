

import 'package:flutter/material.dart';
import 'package:flutter_user_login/screens/home.dart';
import 'package:flutter_user_login/widget/login_scree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int? userType = prefs.getInt('userType');

    if (token != null && userType != null) {
      // Navigate to Homepage based on userType
      if (userType == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(userType: 'admin')),
        );
      } else if (userType == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(userType: 'user')),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

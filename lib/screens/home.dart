import 'package:flutter/material.dart';
import 'package:flutter_user_login/widget/dynamic_drawer.dart';

class Home extends StatelessWidget {
  final String userType;

  const Home({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      drawer: DynamicDrawer(userType: userType),
      body: Center(
        child: Text('Welcome to the homepage! UserType: $userType'),
      ),
    );
  }
}

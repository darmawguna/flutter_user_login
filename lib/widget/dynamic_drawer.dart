import 'package:flutter/material.dart';
import 'package:flutter_user_login/widget/login_scree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DynamicDrawer extends StatelessWidget {
  final String userType;

  DynamicDrawer({super.key, required this.userType});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userType');
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('User Name'),
            accountEmail: Text('user@example.com'),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              // Navigate to profile screen
            },
          ),
          if (userType == 'admin')
            ListTile(
              title: const Text('Admin Feature'),
              onTap: () {
                // Navigate to admin feature screen
              },
            ),
          ListTile(
            title: const Text('Logout'),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}

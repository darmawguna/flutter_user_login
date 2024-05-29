import 'package:flutter/material.dart';
import 'package:flutter_user_login/widget/adminpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Welcome'),
      ),
      drawer: DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          // Admin or User specific drawer items
          if (isAdmin(context))
            ListTile(
              title: const Text('Admin Page'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminPage()),
                );
              },
            ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Implement logout logic here
            },
          ),
        ],
      ),
    );
  }

  bool isAdmin(BuildContext context) {
    // Check user type here, for example using a global variable or user object
    // For demonstration purposes, we'll assume the user is an admin if the user type is 1
    // Otherwise, assume the user is a regular user
    int userType = 1;
    return userType == 1;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialapp/pages/homePage.dart';
import 'package:socialapp/pages/loginPage.dart';
import 'package:socialapp/services/permission.dart';

class Forward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: PermissionServices().statusFollower,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasData) {
          User activeUser = snapshot.data;
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}

// to check if user is signed in or not
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:login/loginscreen.dart';

import 'homepage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}

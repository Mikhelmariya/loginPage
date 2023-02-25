import 'package:flutter/material.dart';
import 'package:login/loginscreen.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Login Page")),
          backgroundColor: Colors.teal,
        ),
        body: LoginScreen(),
      ),
    );
  }
}

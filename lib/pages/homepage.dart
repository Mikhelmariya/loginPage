import 'package:auth/auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:login/loginscreen.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  void signout() {
    FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              signout();
            },
            icon: Icon(Icons.logout))
      ]),
      body: Container(
        child: Center(
            child: Text(
          "Welcome " + user!.email!,
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }
}

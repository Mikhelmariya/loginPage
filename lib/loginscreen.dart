import 'package:auth/auth.dart';
import 'package:flutter/material.dart';

TextEditingController emailcontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool _Isloading = false;

class _LoginScreenState extends State<LoginScreen> {
  signIn(String emailcontroller, String passwordcontroller) async {
    showDialog(
        context: context,
        builder: ((context) {
          return Center(child: CircularProgressIndicator());
        }));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller, password: passwordcontroller);
    } catch (Exception) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Invalid username or password"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
        child: Column(
          children: [
            Text(
              "LOGIFY",
              style: TextStyle(fontSize: 40, color: Colors.teal.shade900),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              // keyboardType: TextInputType.emailAddress,
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: "Enter email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              // keyboardType: TextInputType.visiblePassword,
              controller: passwordcontroller,
              obscureText: true, //to be seen like dots
              decoration: InputDecoration(
                  labelText: "Enter password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.w300),
                    )),
              ],
            ),
            Container(
              height: 40,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    _Isloading = true;
                  });
                  signIn(emailcontroller.text, passwordcontroller.text);
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 25, letterSpacing: 3, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    Colors.teal.shade100,
                    Colors.teal.shade900,
                    Colors.tealAccent
                  ])),
            ),
            SizedBox(
              height: 40,
              child: Divider(
                height: 3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ? "),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Register Account",
                    style: TextStyle(color: Colors.teal.shade900),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

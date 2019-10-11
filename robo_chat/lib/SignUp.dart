import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  static const String id = "SIGNUP";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Hero(
            tag: 'icon',
            child: Image.asset(
              'assets/icon128.png',
              width: 120,
              height: 120,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (text) {
                email = text;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                border: const OutlineInputBorder(),
              ),
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: TextField(
              autocorrect: false,
              obscureText: true,
              onChanged: (text) {
                password = text;
              },
              decoration: InputDecoration(
                hintText: "Enter Your Password...",
                border: const OutlineInputBorder(),
              ),
            ),
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
          SizedBox(
            height: 40.0,
          ),
          CustomButton(
            text: "Sign Up",
            callback: () {
              _SignUpUser(email: email, password: password);
            },
          )
        ],
      ),
    );
  }

  Future<FirebaseUser> _SignUpUser({String email, String password}) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ));
    Navigator.of(context).pushNamed(LogIn.id);
    return user;
  }
}

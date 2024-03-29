import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_chat/Home.dart';
import 'main.dart';

class LogIn extends StatefulWidget {
  static const String id = "LOGIN";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogInState();
  }
}

class _LogInState extends State<LogIn> {
  String email = '';
  String password = '';

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
            text: "Log In",
            callback: () {
              loginUser(email: email, password: password);
            },
          )
        ],
      ),
    );
  }

  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // since something changed, let's notify the listeners...
      Navigator.of(context).pushNamed(Home.id);

      return result;
    } catch (e) {
      // throw the Firebase AuthException that we caught

      throw new AuthException(e.code, e.message);

    }
  }
}

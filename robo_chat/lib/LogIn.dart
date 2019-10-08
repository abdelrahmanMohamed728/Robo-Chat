import 'package:flutter/material.dart';
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
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) {},
            decoration: InputDecoration(
              hintText: 'Enter your Email',
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            autocorrect: false,
            obscureText: true,
            onChanged: (text) {},
            decoration: InputDecoration(
              hintText: "Enter Your Password...",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          CustomButton(
            text: "Log In",
            callback: () {},
          )
        ],
      ),
    );
  }
}

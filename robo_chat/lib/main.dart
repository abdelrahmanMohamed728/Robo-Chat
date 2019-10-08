import 'package:flutter/material.dart';
import 'LogIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        LogIn.id :(context)=>LogIn(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String id = "HOMESCREEN";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              child: Image.asset(
                'assets/icon512.png',
                width: 100,
                height: 100,
              ),
              tag: "icon",
            ),
            Container(
                child: Text('Robo Chat',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
          ],
        ),
        SizedBox(
          height: 50.0,
        ),
        CustomButton(
          text: "Register",
          callback: () {},
        ),
        CustomButton(
          text: "Log In",
          callback: () {
            Navigator.of(context).pushNamed(LogIn.id);
          },
        ),
      ],
    ));
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white70,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(text),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_chat/Chats.dart';
import 'LogIn.dart';
import 'CircualrImage.dart';
import 'Search.dart';
import 'main.dart';

class Home extends StatefulWidget {
  static const String id = "HOME";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  String Email = '';

  @override
  Widget build(BuildContext context) {
    someMethod();

    // TODO: implement build
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.person_pin)),
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.search)),
              ],
            ),
            title: Text('Home'),
          ),
          body: TabBarView(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    child: CircleImage(),
                    margin: EdgeInsets.only(top: 60),
                  ),
                  Container(
                    child: Text(
                      Email,
                      style: TextStyle(fontSize: 30),
                    ),
                    margin: EdgeInsets.only(top: 20),
                  )
                ],
              ),
              Chats(),
              Search(),
            ],
          ),
        ),
      ),
    );
  }

  someMethod() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      Email = user.email;
    });
  }
}

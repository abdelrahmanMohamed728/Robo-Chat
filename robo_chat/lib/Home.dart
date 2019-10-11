import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'CircualrImage.dart';
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
                Tab(icon: Icon(Icons.settings)),
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
                    child: Text(Email),
                    margin: EdgeInsets.only(top: 20),
                  )
                ],
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }

  someMethod() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Email = user.email;
  }
}

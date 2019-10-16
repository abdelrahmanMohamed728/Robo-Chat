import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:robo_chat/SearchUser.dart';
import 'LogIn.dart';
import 'CircualrImage.dart';
import 'main.dart';

class Chats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatsState();
  }
}

class _ChatsState extends State<Chats> {
  final Reference = FirebaseDatabase.instance.reference();
  String curEmail = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> users = [];
  List<String> users2 = [];
  @override
  void initState() {
    getUser();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                'Recent Chats',
                style: TextStyle(fontSize: 20),
              ),
            ),
            margin: EdgeInsets.only(top: 20),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(itemCount: users2.length,itemBuilder: (context, i) {
              return ListTile(
                leading: Icon(Icons.person), title: Text(users2[i]),);
            }),
          )
        ],
      ),
    );
  }
  getUser() async {
    FirebaseUser user = await _auth.currentUser();
    curEmail = user.email;
    DatabaseReference dp = Reference.child('Messages');
    dp
      ..orderByChild('created_at').once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, value) {
          setState(() {
            String from = value['From'];
            String to = value['To'];
            if (from == curEmail) {
              users.add(to);
            }
            if (to == curEmail) {
              users.add(from);
            }
            users2 = users.toSet().toList();
          });
        });
      });
    //

  }
}

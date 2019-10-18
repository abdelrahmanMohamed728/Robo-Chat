import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:robo_chat/SearchUser.dart';
import 'ChatScreen.dart';
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
      body: Container(
        child: Column(
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
            Expanded(
              child: Container(
                height: 100,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: ListView.builder(
                    itemCount: users2.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 35.0,
                                backgroundImage: NetworkImage(
                                    'https://www.woolha.com/media/2019/06/buneary.jpg'),
                              ),
                              Container(
                                child: Text(
                                  users2[i],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 20),
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                user: User(email: users2[i], id: 'a'),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }

  tapMethod() {}

  getUser() async {
    FirebaseUser user = await _auth.currentUser();
    curEmail = user.email;
    DatabaseReference dp = Reference.child('Messages');
    dp
      ..orderByChild('date').once().then((DataSnapshot snapshot) {
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

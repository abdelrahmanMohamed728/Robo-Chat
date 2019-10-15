import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_chat/ChatScreen.dart';
import 'LogIn.dart';
import 'CircualrImage.dart';
import 'SearchUser.dart';
import 'main.dart';
import 'package:firebase_database/firebase_database.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchState();
  }
}

String searchText = '';
final Reference = FirebaseDatabase.instance.reference();
List<User> users = [];

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for a User by Email",
                  prefixIcon: Icon(Icons.search),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (text) {
                  users = [];
                  DatabaseReference dp = Reference.child('Users');
                  dp.once().then((DataSnapshot snapshot) {
                    Map<dynamic, dynamic> values = snapshot.value;
                    values.forEach((key, value) {
                      setState(() {
                        String email = value['Email'];
                        if (email.contains(text))
                          users.add(User(email: email, id: key.toString()));
                      });
                    });
                  });
                },
              ),
              margin: EdgeInsets.only(top: 10),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(users[i].email),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(
                                   user: users[i],
                                ),
                          ),);
                      },
                    );
                  }),
            )
          ],
        ));
  }
}

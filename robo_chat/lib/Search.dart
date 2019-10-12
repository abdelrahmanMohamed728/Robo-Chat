import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'CircualrImage.dart';
import 'main.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchState();
  }
}

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
              hintText: "Search for a User...",
              prefixIcon: Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
          ),
          margin: EdgeInsets.only(top: 10),
        ),
        SizedBox(
          width: 300,height: 320,child: ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Person ' + (i + 1).toString()),
                );
              }),
        )
      ],
    ));
  }
}

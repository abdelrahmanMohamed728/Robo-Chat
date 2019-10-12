import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, i) {
            return Card(
                child: Container(
              child: Row(
                children: <Widget>[
                  Image.network(
                    'https://www.woolha.com/media/2019/06/buneary.jpg',
                    width: 80,
                    height: 100,
                  ),
                  Text(
                    'Friend ' + (i + 1).toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('11:11 PM')
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              margin: EdgeInsets.only(top: 20),
              height: 70,
              width: 300,
            ));
          }),
    );
  }
}

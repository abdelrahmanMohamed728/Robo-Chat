import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:robo_chat/Recent.dart';
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

  Future<File> imageFile;

  @override
  Widget build(BuildContext context) {
    someMethod();

    // TODO: implement build
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
                title: Text('Home')
              ),
              body: TabBarView(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 60),
                        height: 150,
                        width: 150,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(
                                    'https://www.woolha.com/media/2019/06/buneary.jpg'))),
                        child: InkWell(
                          onTap: () {
                            pickImageFromGallery(ImageSource.gallery);
                          },
                        ),
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
        ));
  }

  someMethod() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      Email = user.email;
    });
  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LogIn.dart';
import 'main.dart';
class CircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 300.0;

    return Center(
      child: new Container(
          width: 150,
          height: 150,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      "https://www.woolha.com/media/2019/06/buneary.jpg")
              )
          )
      ),
    );
  }

}
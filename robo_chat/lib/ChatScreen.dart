import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:robo_chat/Message.dart';
import 'LogIn.dart';
import 'CircualrImage.dart';
import 'SearchUser.dart';
import 'main.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatScreen extends StatefulWidget {
  static const String id = "CHAT";
  final User user;

  const ChatScreen({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatScreenState(user);
  }
}

class _ChatScreenState extends State<ChatScreen> {
  User user;
  String message = '';
  final Reference = FirebaseDatabase.instance.reference();

  String curEmail = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> widgets = [];

  _ChatScreenState(this.user);

  TextEditingController _c;

  @override
  void initState() {
    getUser();
    _c = new TextEditingController();
    DatabaseReference dp = Reference.child('Messages');
    dp
      ..orderByChild('created_at').once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, value) {
          setState(() {
            String from = value['From'];
            String to = value['To'];
            String msg = value['Message'];
            String eUser = user.email;
            if (from == curEmail && eUser == to) {
              widgets.add(Message(
                from: from,
                text: msg,
                me: true,
              ));
              print(msg);
            }
            if (from == eUser && curEmail == to) {
              widgets.add(Message(
                from: from,
                text: msg,
                me: false,
              ));
            }
          });
        });
      });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(user.email),
          leading: Icon(Icons.chat),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widgets.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    return widgets[i];
                  }),
              height: 380,
            ),
            Expanded(
              child: Align(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          message = text;
                        },
                        controller: _c,
                        decoration: InputDecoration(
                          hintText: 'Send Message',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            Reference.reference()
                                .child('Messages')
                                .push()
                                .set(<String, String>{
                              'From': curEmail,
                              'To': user.email,
                              "Message": message
                            });
                          });
                          update();
                          _c.text = ' ';
                        },
                        backgroundColor: Colors.green,
                        child: Icon(Icons.send),
                      ),
                      margin: EdgeInsets.only(left: 5),
                    )
                  ],
                ),
                alignment: FractionalOffset.bottomCenter,
              ),

            )
          ],
        ));
  }

  getUser() async {
    FirebaseUser user = await _auth.currentUser();
    curEmail = user.email;
  }

  update() {
    widgets = [];
    DatabaseReference dp = Reference.child('Messages');
    dp.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        setState(() {
          String from = value['From'];
          String to = value['To'];
          String msg = value['Message'];
          String eUser = user.email;
          if (from == curEmail && eUser == to) {
            widgets.add(Message(
              from: from,
              text: msg,
              me: true,
            ));

            print(msg);
          }
          if (from == eUser && curEmail == to) {
            widgets.add(Message(
              from: from,
              text: msg,
              me: false,
            ));
          }
        });
      });
    });
  }
}

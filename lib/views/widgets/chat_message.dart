import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/model/note.dart';
import 'package:talawa/model/user.dart';

const String _name = "Anonymous";

class ChatMessage extends StatelessWidget {
  final Note note;

// constructor to get text from textfield
  ChatMessage({this.note});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Consumer<UserController>(
          builder: (context, controller, child) {
            return FutureBuilder<User>(
              future: controller.getUser(note.senderId),
              builder: (_context, snapshot) {
                if (snapshot.hasData) {
                  User user = snapshot.data;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: new CircleAvatar(
                          child: Text(
                            user.firstName.substring(0, 1),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(user.firstName + ' ' + user.lastName,
                              style: Theme.of(context).textTheme.subhead),
                          new Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: new Text(note.message),
                          )
                        ],
                      )
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            );
          },
        ));
  }
}

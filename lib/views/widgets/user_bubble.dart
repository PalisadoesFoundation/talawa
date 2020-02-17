import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class UserBubble extends StatelessWidget {
  
  final String user;

  UserBubble({this.user});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, UIData.contactPage);
        },
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          child:
              Text(user, style: TextStyle(color: Colors.white, fontSize: 18.0)),
        ));
  }
}

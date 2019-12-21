import 'package:flutter/material.dart';
import 'package:flutter_quito/utils/uidata.dart';

class UserBubble extends StatelessWidget {
  @override
  final String user;

  UserBubble({this.user});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, UIData.contactPage);
      },
      child: CircleAvatar(
      backgroundColor: Colors.blue,
      child: Text(user, style: TextStyle(color: Colors.white, fontSize: 18.0)),)
    );
  }
}

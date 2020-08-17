import 'package:flutter/material.dart';

import '../../utils/uidata.dart';

class MemberDetail extends StatefulWidget {
  Map member;
  MemberDetail({Key key, @required this.member}) : super(key: key);

  @override
  _MemberDetailState createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 80,
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white54,
              ),
              backgroundColor: UIData.secondaryColor,
            ),
          ),
          ListTile(
            leading: Text('User Name'),
          ),
          ListTile(
            leading: Text('User email'),
          ),
          ListTile(
            leading: Text('User Organizations'),
          ),
          ListTile(
            leading: Text('User Privilages'),
          ),
        ],
      )),
    );
  }
}

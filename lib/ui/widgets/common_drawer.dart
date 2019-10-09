import 'package:flutter/material.dart';
import 'package:flutter_quito/ui/widgets/about_tile.dart';
import 'package:flutter_quito/utils/uidata.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Admin",
            ),
            accountEmail: Text(
              "admin@admin.com",
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage(UIData.profileImage),
            ),
          ),
          new ListTile(
            title: Text(
              "Profile",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          new ListTile(
            title: Text(
              "Chats",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.chat,
              color: Colors.green,
            ),
          ),
          new ListTile(
            title: Text(
              "Members",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.people,
              color: Colors.red,
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
          ),
          Divider(),
          MyAboutTile()
        ],
      ),
    );
  }
}

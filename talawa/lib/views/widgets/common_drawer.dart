import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/views/widgets/about_tile.dart';
import 'package:talawa/utils/uidata.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<AuthController>(
      builder: (context, controller, child) {
        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                controller.currentUser.firstName +
                    " " +
                    controller.currentUser.lastName,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
              accountEmail: Text(
                controller.currentUser.email,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage(UIData.talawaLogoDark),
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
            Divider(),
            new ListTile(
              title: Text(
                "Responsibilities",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
              ),
              leading: Icon(
                Icons.chat,
                color: Colors.green,
              ),
            ),
            Divider(),
            new ListTile(
              title: InkWell(
                child: Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
                onTap: (){
                  controller.logout(context);
                },
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.brown,
              ),
            ),
            Divider(),
            MyAboutTile()
          ],
        );
      },
    ));
  }
}

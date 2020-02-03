import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/views/widgets/about_tile.dart';
import 'package:talawa/utils/uidata.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer2<AuthController, UserController>(
        builder: (context, authController, userController, child) {
      return FutureBuilder(
        future: userController.getUser(authController.currentUserId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data;
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    accountName: Text(
                      user.firstName +
                          " " +
                          user.lastName,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18.0),
                    ),
                    accountEmail: Text(
                      user.email,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18.0),
                    ),
                    currentAccountPicture: new InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            user.firstName.substring(0, 1),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(UIData.contactPage,
                              arguments: authController.currentUserId);
                        })),
                new ListTile(
                  title: Text(
                    "Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.person,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(UIData.contactPage,
                        arguments: authController.currentUserId);
                  },
                ),
                Divider(),
                new ListTile(
                  title: Text(
                    "Responsibilities",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.chat,
                  ),
                ),
                Divider(),
                new ListTile(
                  title: Text(
                    "Logout",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                  ),
                  onTap: () {
                    authController.logout(context);
                  },
                ),
                Divider(),
                MyAboutTile()
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      );
    }));
  }
}

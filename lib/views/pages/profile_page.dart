import 'package:flutter/material.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/about_tile.dart';

class ProfilePage extends StatefulWidget {
  
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GraphAPI _api = GraphAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Profile'),
            backgroundColor: Color(0xffF3F6FF),
            elevation: 0.0,
            brightness: Brightness.light),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Column(children: <Widget>[
              ListView(
                children: ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.0),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                        title: Text(
                          'Switch Organization',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.0),
                        ),
                        leading: Icon(
                          Icons.compare_arrows,
                          color: Colors.blueAccent,
                        ),
                        onTap: () {
                            Navigator.of(context).pushNamed(
                              UIData.switchOrgPage,
                            );
                        }
                        ),
                    ListTile(
                        title: Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.exit_to_app,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Confirmation"),
                                    content: Text(
                                        "Are you sure you want to logout?"),
                                    actions: [
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          _api.logout(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                    ),
                    ListTile(
                      title: Text('About Talawa'),
                    ),
                    MyAboutTile(),

                  ],
                ).toList(),
              )
            ])));
  }
}

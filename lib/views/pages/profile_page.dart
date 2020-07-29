import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:talawa/views/widgets/about_tile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Queries _query = Queries();
  GraphAPI _api = GraphAPI();
  Preferences preferences = Preferences();

  String userID;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    final id = await preferences.getUserId();
    setState(() {
      userID = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Query(
          options: QueryOptions(
              documentNode: gql(_query.fetchUserInfo),
              variables: {'id': userID}),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              print(result.exception);
              return Center(
                child: Text(
                  result.exception.toString(),
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }
            List userDetails = result.data['users'];

            return Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Colors.blue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      
                            
                                ListTile(
                                  title: Text("Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white)),
                                  trailing: CircleAvatar(
                                    radius: 42,
                                    backgroundColor: Colors.black,
                                    child: CircleAvatar(
                                      radius: 45.0,
                                      backgroundColor: Colors.lightBlue,
                                      child: Text(
                                          userDetails[0]['firstName']
                                                  .toString()
                                                  .substring(0, 1)
                                                  .toUpperCase() +
                                              userDetails[0]['lastName']
                                                  .toString()
                                                  .substring(0, 1)
                                                  .toUpperCase(),
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text(
                                      userDetails[0]['firstName'].toString() +
                                          " " +
                                          userDetails[0]['lastName'].toString(),
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white)),
                                ),
                                const SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Text("Current Organization: ",
                                      style: TextStyle(
                                          fontSize: 16.0, color: Colors.white)),
                                ),
                             
                         
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: ListView(
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
                            }),
                        ListTile(
                          title: Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.blueAccent,
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
                        MyAboutTile(),
                      ],
                    ).toList(),
                  ),
                )
              ],
            );
          }),
    );
  }
}

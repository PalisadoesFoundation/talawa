
import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/views/widgets/about_tile.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

class CommonDrawer extends StatefulWidget {
  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
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
    return Drawer(
        child: Query(
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

              return ListView.builder(
                  itemCount: userDetails.length,
                  itemBuilder: (context, index) {
                    final user = userDetails[index];

                    return Column(
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                            decoration: BoxDecoration(color: Colors.white),
                            accountName: Text(
                              user['firstName'].toString() +
                                  " " +
                                  user['lastName'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18.0),
                            ),
                            accountEmail: Text(
                              user['email'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18.0),
                            ),
                            currentAccountPicture: new InkWell(
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    user['firstName']
                                            .toString()
                                            .substring(0, 1)
                                            .toUpperCase() +
                                        user['lastName']
                                            .toString()
                                            .substring(0, 1)
                                            .toUpperCase(),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    UIData.contactPage,
                                  );
                                })),
                        new ListTile(
                          title: Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.person,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              UIData.profilePage,
                            );
                  
                          },
                        ),
                        Divider(),
                        //testing purposes
                        new ListTile(
                          title: Text(
                            "Switch Org",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          leading: Icon(
                            Icons.chat,
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              UIData.switchOrgPage,
                            );
                          },
                        ),
                        Divider(),
                        new ListTile(
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
                        Divider(),
                        MyAboutTile(),
                      ],
                    );
                  });
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/views/pages/join_organization.dart';

import 'package:talawa/views/widgets/about_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'create_organization.dart';
import 'switch_org_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Queries _query = Queries();
  GraphAPI _api = GraphAPI();
  Preferences preferences = Preferences();
  List userDetails = [];
  String userID;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    final id = await preferences.getUserId();
    setState(() {
      userID = id;
    });
    fetchUserDetails();
  }

  Future fetchUserDetails() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.hasException) {
      print(result.exception);
      showError(result.exception.toString());
    } else if (!result.hasException) {
      setState(() {
        userDetails = result.data['users'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: userDetails.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Column(
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
                                  style: TextStyle(color: Colors.white)),
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
                              style: TextStyle(fontSize: 18.0),
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
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: Icon(
                                Icons.compare_arrows,
                                color: Colors.blueAccent,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SwitchOrganization(),
                                );
                              }),
                          ListTile(
                              title: Text(
                                'Join New Organization',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: Icon(
                                Icons.business,
                                color: Colors.blueAccent,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: JoinOrganization(),
                                );
                              }),
                          ListTile(
                              title: Text(
                                'Create New Organization',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: Icon(
                                Icons.add_circle,
                                color: Colors.blueAccent,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: CreateOrganization(),
                                );
                              }),
                          ListTile(
                            title: Text(
                              "Logout",
                              style: TextStyle(fontSize: 18.0),
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
              ));
  }

  Widget showError(String msg) {
    return Center(
      child: Text(
        msg,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

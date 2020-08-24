import 'package:flutter/material.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/views/pages/organization/join_organization.dart';

import 'package:talawa/views/widgets/about_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:talawa/views/pages/organization/organization_settings.dart';
import 'switch_org_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Queries _query = Queries();
  GraphAPI _api = GraphAPI();
  Preferences preferences = Preferences();
  List userDetails = [];
  String userID;
  String currentOrgId;
  List allJoinedOrgId = [];
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  String orgName = "";

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  getCurrentOrgId() async {
    final orgId = await preferences.getCurrentOrgId();
    setState(() {
      currentOrgId = orgId;
    });
  }

  extractId(List orgIdList) {
    List lst = [];
    for (int index = 0; index < allJoinedOrgId.length; index++) {
      lst.add([orgIdList[index]['_id'], orgIdList[index]['name']]);
      if (orgIdList[index]['_id'] == currentOrgId) {
        setState(() {
          orgName = orgIdList[index]['name'];
        });
      }
    }
  }

  Future fetchUserDetails() async {
    final String userID = await preferences.getUserId();
    getCurrentOrgId();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      setState(() {
        userDetails = result.data['users'];
        allJoinedOrgId = result.data['users'][0]['joinedOrganizations'];
        extractId(allJoinedOrgId);
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
                      color: UIData.primaryColor,
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
                            trailing: userDetails[0]['image'] != null
                                ? CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        displayImgRoute +
                                            userDetails[0]['image']))
                                : CircleAvatar(
                                    radius: 45.0,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                        userDetails[0]['firstName']
                                                .toString()
                                                .substring(0, 1)
                                                .toUpperCase() +
                                            userDetails[0]['lastName']
                                                .toString()
                                                .substring(0, 1)
                                                .toUpperCase(),
                                        style: TextStyle(
                                          color: UIData.primaryColor,
                                        )),
                                  )),
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
                          child: Text("Current Organization: " + orgName,
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
                              'Update Profile',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            leading: Icon(
                              Icons.person,
                              color: UIData.secondaryColor,
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
                                color: UIData.secondaryColor,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: SwitchOrganization(),
                                );
                              }),
                          ListTile(
                              title: Text(
                                'Join or Create New Organization',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: Icon(
                                Icons.business,
                                color: UIData.secondaryColor,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: JoinOrganization(),
                                );
                              }),
                          ListTile(
                              title: Text(
                                'Organization Settings',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: Icon(
                                Icons.settings,
                                color: UIData.secondaryColor,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: OrganizationSettings(),
                                );
                              }),
                          ListTile(
                            title: Text(
                              "Logout",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            leading: Icon(
                              Icons.exit_to_app,
                              color: UIData.secondaryColor,
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

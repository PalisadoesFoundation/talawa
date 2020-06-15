import 'package:flutter/material.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/views/widgets/about_tile.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CommonDrawer extends StatelessWidget {
  Queries navDrawerQuery = Queries();
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
            return Query(
              options: QueryOptions(
                documentNode: gql(navDrawerQuery.fetchNavDrawerUserInfo),
                variables: {
                  "id": authController.getUser()
                }
              ),
              builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
              final userDetails = result.data['users'];
                if (result.loading) {
                  return CircularProgressIndicator();
                } else {
                return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.white),
                      accountName: Text(
                        userDetails['firstName'] + userDetails['lastName'],
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.0),
                      ),
                      accountEmail: Text(
                        userDetails['email'],
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.0),
                      ),
                      currentAccountPicture: new InkWell(
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              userDetails['firstName'].substring(0) + userDetails['lastName'].substring(0),
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
              }});
          
        }
      
}
  

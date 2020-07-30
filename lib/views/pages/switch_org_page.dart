import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/nav_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SwitchOrganization extends StatefulWidget {
  @override
  _SwitchOrganizationState createState() => _SwitchOrganizationState();
}

class _SwitchOrganizationState extends State<SwitchOrganization> {
  Queries _query = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  String userID;
  int radioValue = -1;
  Preferences preferences = Preferences();
  bool selected = false;
  static String itemIndex;

  @override
  void initState() {
    super.initState();
    fToast = FToast(context);
    getUser();
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
        appBar: AppBar(
         
            title: const Text('Switch Organization'),
            elevation: 0.0,
            brightness: Brightness.light),
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
              List userOrgDetails = result.data['users']['joinedOrganizations'];

              return ListView.builder(
                  itemCount: userOrgDetails.length,
                  itemBuilder: (context, index) {
                    final userOrg = userOrgDetails[index];

                    return ListTile(
                      onTap: () {
                        setState(() {
                          userOrg[index].selected = !userOrg[index].selected;
                          itemIndex = userOrg['_id'].toString();
                          print(userOrg[index].selected.toString());
                        });
                      },
                      selected: userOrg[index].selected,
                      leading: CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Colors.lightBlue,
                        child: Text(
                            userOrg['name']
                                .toString()
                                .substring(0, 1)
                                .toUpperCase(),
                            style: TextStyle(color: Colors.white)),
                      ),
                      title: Text(userOrg['name'].toString()),
                      subtitle: Text(userOrg['description'].toString()),
                      trailing: (userOrg[index].selected)
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                    );
                  });
            }));
  }
}

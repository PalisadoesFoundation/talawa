import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/accept_requests_page.dart';
import 'profile_page.dart';
import 'update_organization.dart';

class OrganizationSettings extends StatefulWidget {
  @override
  _OrganizationSettingsState createState() => _OrganizationSettingsState();
}

class _OrganizationSettingsState extends State<OrganizationSettings> {
  Preferences preferences = Preferences();

  Queries _query = Queries();
  GraphAPI _graphAPI = GraphAPI();

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;

  @override
  void initState() {
    super.initState();
        fToast = FToast(context);

    }


  Future removeOrg() async {

    final String orgId = await preferences.getCurrentOrgId();
    List remaindingOrg = [];
    String newOrgId;
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.mutate(
        MutationOptions(documentNode: gql(_query.removeOrg(orgId))));
    String e =
        "Access Token has expired. Please refresh session.: Undefined location";
    if (result.hasException && result.exception.toString().substring(16) == e) {
      _graphAPI.getNewToken();
      return removeOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != e) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      _successToast('Successfully Removed');
        setState(() {
          remaindingOrg = result.data['removeOrganization']['joinedOrganizations'];
         if (remaindingOrg.isEmpty) {
           newOrgId = null;
         } else if(remaindingOrg.isNotEmpty) {
            newOrgId = result.data['removeOrganization']['joinedOrganizations'][0]['_id'];

         }
 
       });
     
      _graphAPI.setNewOrg(context, newOrgId);
       Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => new ProfilePage()));
    }
  }

  Future leaveOrg() async {

   List remaindingOrg = [];
    String newOrgId;
    final String orgId = await preferences.getCurrentOrgId();

    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client.mutate(
        MutationOptions(documentNode: gql(_query.leaveOrg(orgId))));
    String e =
        "Access Token has expired. Please refresh session.: Undefined location";
    if (result.hasException && result.exception.toString().substring(16) == e) {
      _graphAPI.getNewToken();
      return leaveOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != e) {
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
        setState(() {
         remaindingOrg = result.data['leaveOrganization']['joinedOrganizations'];
         if (remaindingOrg.isEmpty) {
           newOrgId = null;
         } else if(remaindingOrg.isNotEmpty) {
            newOrgId = result.data['leaveOrganization']['joinedOrganizations'][0]['_id'];

         }
 
       });
      // print(result.data['leaveOrganization']['joinedOrganizations'][0]['_id']);
      _graphAPI.setNewOrg(context, newOrgId);
            _successToast('You are no longer apart of this organization');
         Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => new ProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Organization Settings'),
        ),
        body: Container(
          child: Column(children: <Widget>[
            
            ListTile(
                title: Text(
                  'Update This Organization',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.update,
                  color: UIData.secondaryColor,
                ),
                onTap: () {
                  pushNewScreen(
                    context,
                    withNavBar: false,
                    screen: UpdateOrganization(),
                  );
                }),
                  ListTile(
                title: Text(
                  'Accept Organization Requests',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.group_add,
                  color: UIData.secondaryColor,
                ),
                onTap: () {
                  pushNewScreen(
                    context,
                    withNavBar: false,
                    screen: AcceptRequestsPage(),
                  );
                }),
            ListTile(
                title: Text(
                  'Leave This Organization',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  color: UIData.secondaryColor,
                ),
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text(
                              "Are you sure you want to leave this organization?"),
                          actions: [
                            FlatButton(
                              child: Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("Yes"),
                              onPressed: () async {
                                leaveOrg();
                              },
                            )
                          ],
                        );
                      });
                }),
                 ListTile(
                title: Text(
                  'Remove This Organization',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.delete,
                  color: UIData.secondaryColor,
                ),
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text(
                              "Are you sure you want to remove this organization?"),
                          actions: [
                            FlatButton(
                              child: Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("Yes"),
                              onPressed: () async {
                                removeOrg();
                              },
                            )
                          ],
                        );
                      });
                }),
          ]),
        ));
  }
    _successToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  _exceptionToast(String msg) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}

//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//pages are called here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/organization/accept_requests_page.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/pages/organization/organization_members.dart';
import 'package:talawa/views/widgets/alert_dialog_box.dart';
import 'package:talawa/views/widgets/toast_tile.dart';
import 'update_organization.dart';

class OrganizationSettings extends StatefulWidget {
  final bool public;
  final bool creator;
  final List organization;
  OrganizationSettings({this.public, this.creator, this.organization});
  @override
  _OrganizationSettingsState createState() => _OrganizationSettingsState();
}

class _OrganizationSettingsState extends State<OrganizationSettings> {
  Preferences _preferences = Preferences();
  Queries _query = Queries();
  AuthController _authController = AuthController();
  OrgController _orgController = OrgController();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  bool processing = false;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Future leaveOrg() async {
    setState(() {
      processing = true;
    });
    List remaindingOrg = [];
    String newOrgId;
    String newOrgName;
    GraphQLClient _client = graphQLConfiguration.authClient();
    QueryResult result = await _client.mutate(MutationOptions(
        documentNode: gql(_query.leaveOrg(widget.organization[0]['_id']))));
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return leaveOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      setState(() {
        processing = false;
      });
      _exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      //set org at the top of the list as the new current org
      setState(() {
        remaindingOrg = result.data['leaveOrganization']['joinedOrganizations'];
        if (remaindingOrg.isEmpty) {
          newOrgId = null;
        } else if (remaindingOrg.isNotEmpty) {
          setState(() {
            newOrgId = result.data['leaveOrganization']['joinedOrganizations']
                [0]['_id'];
            newOrgName = result.data['leaveOrganization']['joinedOrganizations']
                [0]['name'];
          });
        }
        processing = false;
      });

      _orgController.setNewOrg(context, newOrgId, newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgName(newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgId(newOrgId);
      _successToast('You are no longer apart of this organization');
      pushNewScreen(
        context,
        screen: ProfilePage(),
      );
    }
  }

  Future removeOrg() async {
    setState(() {
      processing = true;
    });
    //this is called the organization has to be removed
    final String orgId = await _preferences.getCurrentOrgId();
    List remaindingOrg = [];
    String newOrgId;
    String newOrgName;
    GraphQLClient _client = graphQLConfiguration.authClient();

    QueryResult result = await _client
        .mutate(MutationOptions(documentNode: gql(_query.removeOrg(orgId))));

    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return removeOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      Navigator.of(context).pop();
      setState(() {
        processing = false;
      });
      //_exceptionToast(result.exception.toString().substring(16));
    } else if (!result.hasException && !result.loading) {
      _successToast('Successfully Removed Organization');
      setState(() {
        remaindingOrg =
            result.data['removeOrganization']['joinedOrganizations'];
        if (remaindingOrg.isEmpty) {
          newOrgId = null;
        } else if (remaindingOrg.isNotEmpty) {
          newOrgId = result.data['removeOrganization']['joinedOrganizations'][0]
              ['_id'];
          newOrgName = result.data['removeOrganization']['joinedOrganizations']
              [0]['name'];
        }
        processing = false;
      });

      _orgController.setNewOrg(context, newOrgId, newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgName(newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgId(newOrgId);
      Navigator.of(context).pop();
      pushNewScreen(
        context,
        screen: ProfilePage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Organization Settings',
              style: TextStyle(color: Colors.white)),
        ),
        body: Stack(
          children: [
            processing
                ? Container(
                    color: Colors.transparent.withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox(),
            Container(
              child: Column(children: <Widget>[
                ListTile(
                  key:Key('Update Organization'),
                    title: Text(
                      'Update Organization',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    leading: Icon(
                      Icons.update,
                      color: UIData.secondaryColor,
                    ),
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: UpdateOrganization(
                            description: widget.organization[0]['description'],
                            name: widget.organization[0]['name'],
                            isPublic:
                                widget.organization[0]['isPublic'] ? 0 : 1,
                            isVisible: widget.organization[0]
                                        ['visibleInSearch'] ==
                                    null
                                ? -1
                                : widget.organization[0][0]['visibleInSearch']
                                    ? 0
                                    : 1),
                      );
                    }),
                Divider(),
                widget.public
                    ? SizedBox()
                    : ListTile(
                    key:Key('Accept MemberShip Requests'),
                        title: Text(
                          'Accept MemberShip Requests',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        subtitle: Text(
                          'For Private Organizations',
                        ),
                        leading: Icon(
                          Icons.group_add,
                          color: UIData.secondaryColor,
                        ),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: AcceptRequestsPage(),
                          );
                        }),
                widget.public ? SizedBox() : Divider(),
                ListTile(
                    key:Key('Member(s)'),
                    title: Text(
                      'Member(s)',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    leading: Icon(
                      Icons.person,
                      color: UIData.secondaryColor,
                    ),
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: OrganizationMembers(),
                      );
                    }),
                Divider(),
                widget.creator
                    ? ListTile(
                    key:Key('Remove This Organization'),
                        title: Text(
                          'Remove This Organization',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        leading: Icon(
                          Icons.delete,
                          color: UIData.secondaryColor,
                        ),
                        onTap: () async {
                          if (!widget.creator) {
                            _exceptionToast(
                                'Creator can only remove organization');
                          }
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertBox(
                                  message:
                                      "Are you sure you want to remove this organization?",
                                  function: removeOrg,
                                );
                              });
                        })
                    : ListTile(
                    key:Key('Leave Organization'),
                    title: Text(
                          'Leave Organization',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: UIData.secondaryColor,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertBox(
                                  message:
                                      "Are you sure you want to leave this organization?",
                                  function: leaveOrg,
                                );
                              });
                        }),
              ]),
            ),
          ],
        ));
  }

  _successToast(String msg) {
    fToast.showToast(
      child: ToastTile(msg: msg, success: true),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }

  _exceptionToast(String msg) {
    fToast.showToast(
      child: ToastTile(msg: msg, success: false),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 3),
    );
  }
}

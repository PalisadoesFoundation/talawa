//flutter packages are called here
import 'package:flutter/material.dart';

//pages are called here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/organization/accept_requests_page.dart';
import 'package:talawa/views/pages/organization/profile_page.dart';
import 'package:talawa/views/pages/organization/organization_members.dart';
import 'package:talawa/views/widgets/alert_dialog_box.dart';
import 'update_organization.dart';

class OrganizationSettings extends StatefulWidget {
  const OrganizationSettings({this.public, this.creator, this.organization});

  final bool public;
  final bool creator;
  final List organization;
  @override
  _OrganizationSettingsState createState() => _OrganizationSettingsState();
}

class _OrganizationSettingsState extends State<OrganizationSettings> {
  final Preferences _preferences = Preferences();
  final Queries _query = Queries();
  final AuthController _authController = AuthController();
  final OrgController _orgController = OrgController();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  bool processing = false;

  Future leaveOrg() async {
    setState(() {
      processing = true;
    });
    List remaindingOrg = [];
    String newOrgId;
    String newOrgName;
    final GraphQLClient _client = graphQLConfiguration.authClient();
    final QueryResult result = await _client.mutate(MutationOptions(
        documentNode:
            gql(_query.leaveOrg(widget.organization[0]['_id'].toString()))));
    if (result.hasException &&
        result.exception.toString().substring(16) == accessTokenException) {
      _authController.getNewToken();
      return leaveOrg();
    } else if (result.hasException &&
        result.exception.toString().substring(16) != accessTokenException) {
      setState(() {
        processing = false;
      });
      CustomToast.exceptionToast(msg: result.exception.toString());
    } else if (!result.hasException && !result.loading) {
      //set org at the top of the list as the new current org
      setState(() {
        remaindingOrg =
            result.data['leaveOrganization']['joinedOrganizations'] as List;
        if (remaindingOrg.isEmpty) {
          newOrgId = null;
        } else if (remaindingOrg.isNotEmpty) {
          setState(() {
            newOrgId = result.data['leaveOrganization']['joinedOrganizations']
                    [0]['_id']
                .toString();
            newOrgName = result.data['leaveOrganization']['joinedOrganizations']
                    [0]['name']
                .toString();
          });
        }
        processing = false;
      });

      _orgController.setNewOrg(context, newOrgId, newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgName(newOrgName);
      Provider.of<Preferences>(context, listen: false)
          .saveCurrentOrgId(newOrgId);
      CustomToast.sucessToast(
          msg: 'You are no longer apart of this organization');
      pushNewScreen(
        context,
        screen: const ProfilePage(),
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
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client
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
      CustomToast.sucessToast(msg: 'Successfully Removed Organization');
      setState(() {
        remaindingOrg =
            result.data['removeOrganization']['joinedOrganizations'] as List;
        if (remaindingOrg.isEmpty) {
          newOrgId = null;
        } else if (remaindingOrg.isNotEmpty) {
          newOrgId = result.data['removeOrganization']['joinedOrganizations'][0]
                  ['_id']
              .toString();
          newOrgName = result.data['removeOrganization']['joinedOrganizations']
                  [0]['name']
              .toString();
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
        screen: const ProfilePage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Organization Settings',
              style: const TextStyle(color: Colors.white)),
        ),
        body: Stack(
          children: [
            processing
                ? Container(
                    color: Colors.transparent.withOpacity(0.3),
                    child: const Center(
                      child: const CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox(),
            Container(
              child: Column(children: <Widget>[
                ListTile(
                    key: const Key('Update Organization'),
                    title: const Text(
                      'Update Organization',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    leading: const Icon(
                      Icons.update,
                      color: UIData.secondaryColor,
                    ),
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: UpdateOrganization(
                            description: widget.organization[0]['description']
                                .toString(),
                            name: widget.organization[0]['name'].toString(),
                            isPublic:
                                (widget.organization[0]['isPublic'] as bool)
                                    ? 0
                                    : 1,
                            isVisible: widget.organization[0]
                                        ['visibleInSearch'] ==
                                    null
                                ? -1
                                : (widget.organization[0][0]['visibleInSearch']
                                        as bool)
                                    ? 0
                                    : 1),
                      );
                    }),
                const Divider(),
                widget.public
                    ? const SizedBox()
                    : ListTile(
                        key: const Key('Accept MemberShip Requests'),
                        title: const Text(
                          'Accept MemberShip Requests',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        subtitle: const Text(
                          'For Private Organizations',
                        ),
                        leading: const Icon(
                          Icons.group_add,
                          color: UIData.secondaryColor,
                        ),
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: AcceptRequestsPage(),
                          );
                        }),
                widget.public ? const SizedBox() : const Divider(),
                ListTile(
                    key: const Key('Member(s)'),
                    title: const Text(
                      'Member(s)',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    leading: const Icon(
                      Icons.person,
                      color: UIData.secondaryColor,
                    ),
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: OrganizationMembers(),
                      );
                    }),
                const Divider(),
                widget.creator
                    ? ListTile(
                        key: const Key('Remove This Organization'),
                        title: const Text(
                          'Remove This Organization',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        leading: const Icon(
                          Icons.delete,
                          color: UIData.secondaryColor,
                        ),
                        onTap: () async {
                          if (!widget.creator) {
                            CustomToast.exceptionToast(
                                msg: 'Creator can only remove organization');
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
                        key: const Key('Leave Organization'),
                        title: const Text(
                          'Leave Organization',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        leading: const Icon(
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
}

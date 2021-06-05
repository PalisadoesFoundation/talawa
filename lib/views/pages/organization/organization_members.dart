//flutter imported packages
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

//pages are imported here
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/custom_toast.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/globals.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/alert_dialog_box.dart';

class OrganizationMembers extends StatefulWidget {
  @override
  _OrganizationMembersState createState() => _OrganizationMembersState();
}

class _OrganizationMembersState extends State<OrganizationMembers>
    with SingleTickerProviderStateMixin {
  final Preferences _preferences = Preferences();
  AnimationController _controller;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final AuthController _authController = AuthController();
  List membersList = [];
  List adminsList = [];
  List selectedMembers = [];
  bool forward = false;
  bool processing = false;
  String userId;
  final Queries _query = Queries();
  String creatorId;

  //giving initial states to every variable
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    viewMembers();
  }

  //method to show the members of the organization
  Future viewMembers() async {
    final String orgId = await _preferences.getCurrentOrgId();
    final GraphQLClient _client = graphQLConfiguration.authClient();

    final QueryResult result = await _client.query(
      QueryOptions(documentNode: gql(_query.fetchOrgById(orgId))),
    );
    if (result.hasException) {
      debugPrint(result.exception.toString());
      CustomToast.exceptionToast(msg: result.exception.toString());
    } else {
      final memberData = result.data['organizations'][0];
      memberData['admins'].forEach((admin) => adminsList.add(admin['_id']));
      setState(() {
        creatorId = memberData['creator']['_id'].toString();
        membersList = memberData['members'] as List;
      });
      if (membersList.length == 1) {
        CustomToast.exceptionToast(
          msg: AppLocalizations.of(context).translate('You are alone here.'),
        );
      }
    }
  }

  //method called when a member has to be removed by the admin
  Future removeMembers() async {
    setState(() {
      processing = true;
    });
    final GraphQLClient _client = graphQLConfiguration.authClient();
    final String orgId = await _preferences.getCurrentOrgId();

    final QueryResult result = await _client.query(
      QueryOptions(
          documentNode: gql(_query.removeMember(orgId, selectedMembers))),
    );

    if (!result.hasException) {
      selectedMembers = [];
      setState(() {
        processing = false;
      });
      CustomToast.sucessToast(
          msg: AppLocalizations.of(context)
              .translate('Member(s) removed successfully'));
      viewMembers();
      return;
    }

    final String exceptionString = result.exception.toString().substring(16);
    if (exceptionString == accessTokenException) {
      _authController.getNewToken();
      return removeMembers();
    } else {
      debugPrint(exceptionString);
      CustomToast.exceptionToast(msg: result.exception.toString());
      setState(() {
        processing = false;
      });
    }
  }

  Future addAdmin() async {
    setState(() {
      processing = true;
    });

    if (adminsList.contains(selectedMembers[0])) {
      CustomToast.exceptionToast(
          msg: AppLocalizations.of(context).translate('Already an admin'));
      return;
    }

    final GraphQLClient _client = graphQLConfiguration.authClient();
    final String orgId = await _preferences.getCurrentOrgId();
    final QueryResult result = await _client.query(
      QueryOptions(
          documentNode:
              gql(_query.addAdmin(orgId, selectedMembers[0].toString()))),
    );
    final String exceptionString = result.exception.toString().substring(16);

    if (!result.hasException) {
      selectedMembers = [];
      setState(() {
        processing = false;
      });
      CustomToast.sucessToast(
          msg: AppLocalizations.of(context).translate('Admin created'));
      viewMembers();
    }

    if (exceptionString == accessTokenException) {
      _authController.getNewToken();
      return addAdmin();
    } else {
      print(exceptionString);
      CustomToast.exceptionToast(
          msg: AppLocalizations.of(context)
              .translate("Something went wrong!Try again later"));
      setState(() {
        processing = false;
      });
    }
  }

  //add or remove selected members from list
  void _onMemberSelected(bool selected, String memberId) {
    if (selected == true) {
      if (!adminsList.contains(memberId)) {
        setState(() {
          selectedMembers.add('"$memberId"');
        });
      } else {
        CustomToast.exceptionToast(
          msg: AppLocalizations.of(context).translate("Can't select admins"),
        );
      }
    } else {
      setState(() {
        selectedMembers.remove('"$memberId"');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('Organization Members'),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          processing
              ? Container(
                  color: Colors.transparent.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox(),
          membersList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemCount: membersList.length,
                  itemBuilder: (context, index) {
                    final members = membersList[index];
                    final String mId = members['_id'].toString();
                    final String name =
                        '${members['firstName']} ${members['lastName']}';
                    return CheckboxListTile(
                      secondary: members['image'] != null
                          ? CircleAvatar(
                              radius: SizeConfig.safeBlockVertical * 3.75,
                              backgroundImage: NetworkImage(
                                Provider.of<GraphQLConfiguration>(context)
                                        .displayImgRoute +
                                    members['image'].toString(),
                              ),
                            )
                          : CircleAvatar(
                              radius: SizeConfig.safeBlockVertical * 3.75,
                              backgroundColor: Colors.white,
                              child: Text(
                                members['firstName']
                                        .toString()
                                        .substring(0, 1)
                                        .toUpperCase() +
                                    members['lastName']
                                        .toString()
                                        .substring(0, 1)
                                        .toUpperCase(),
                                style: const TextStyle(
                                  color: UIData.primaryColor,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                      title: Text(name),
                      subtitle: Text(adminsList.contains(mId)
                          ? AppLocalizations.of(context).translate('Admin')
                          : ''),
                      value: selectedMembers.contains('"$mId"'),
                      onChanged: (bool value) {
                        _onMemberSelected(value, members['_id'].toString());
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(2, (int index) {
          final Widget child = Container(
            margin: const EdgeInsets.only(bottom: 15),
            alignment: FractionalOffset.bottomRight,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 1.0 - index, curve: Curves.easeOut),
              ),
              child: FloatingActionButton.extended(
                heroTag: null,
                backgroundColor: UIData.secondaryColor,
                tooltip: index == 0
                    ? AppLocalizations.of(context).translate("Remove")
                    : AppLocalizations.of(context).translate("Admin"),
                icon: Icon(
                  index == 0 ? Icons.delete : Icons.admin_panel_settings,
                  color: Colors.white,
                ),
                label: Text(index == 0
                    ? AppLocalizations.of(context).translate("Remove")
                    : AppLocalizations.of(context).translate("Admin")),
                onPressed: () {
                  if (index == 0) {
                    dialog(
                      AppLocalizations.of(context).translate(
                          "Are you sure you want to remove selected member(s)?"),
                      removeMembers,
                    );
                  } else if (index == 1) {
                    if (selectedMembers.length == 1) {
                      dialog(
                        AppLocalizations.of(context).translate(
                            "Are you sure you want to make selected member and admin?"),
                        addAdmin,
                      );
                    } else {
                      CustomToast.exceptionToast(
                        msg: AppLocalizations.of(context)
                            .translate('You can make one admin at a time'),
                      );
                    }
                  }
                },
              ),
            ),
          );
          return child;
        }).toList()
          ..add(
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                setState(() {
                  forward = !forward;
                });
                _controller.isDismissed
                    ? _controller.forward()
                    : _controller.reverse();
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                    transform:
                        Matrix4.rotationZ(_controller.value * 1 * math.pi),
                    alignment: FractionalOffset.center,
                    child: const Icon(Icons.expand_more),
                  );
                },
              ),
            ),
          ),
      ),
    );
  }

  //dialog to confirm if the admin really wants to remove the member or not
  void dialog(String msg, Function function) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertBox(message: msg, function: function);
      },
    );
  }
}

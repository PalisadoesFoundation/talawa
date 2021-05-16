import 'package:flutter/cupertino.dart';
//flutter packages are  imported here
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//pages are imported here
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/page_view_model/profile_page_viewModel.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/views/pages/organization/join_organization_view.dart';
import 'package:talawa/views/pages/organization/update_profile_page_view.dart';
import 'package:talawa/views/widgets/about_tile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/views/pages/organization/organization_settings.dart';
import 'package:talawa/views/widgets/alert_dialog_box.dart';
import 'package:talawa/views/widgets/loading.dart';
import 'switch_org_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({this.isCreator, this.test});
  final bool isCreator;
  final List test;
  //main build starts from here
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilePageViewModel>(
      onModelReady: (model) => model.initialize(context, isCreator, test),
      builder: (context, model, child) => Scaffold(
        key: const Key('PROFILE_PAGE_SCAFFOLD'),
        backgroundColor: Colors.white,
        // body: model.userDetails.isEmpty || isCreator == null
        body: model.userDetails.isEmpty || model.isCreator == null
            ? Center(
                child: Loading(
                key: UniqueKey(),
                isCurrentOrgNull: false,
              ))
            : Column(
                key: const Key('body'),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 4,
                    ),
                    decoration: const BoxDecoration(
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
                            title: const Text(
                              "Profile",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            trailing: model.userDetails[0]['image'] != null
                                ? CircleAvatar(
                                    radius: SizeConfig.safeBlockVertical * 3.75,
                                    backgroundImage: NetworkImage(
                                        Provider.of<GraphQLConfiguration>(
                                                    context)
                                                .displayImgRoute +
                                            model.userDetails[0]['image']
                                                .toString()))
                                : CircleAvatar(
                                    radius:
                                        SizeConfig.safeBlockVertical * 5.625,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                        model.userDetails[0]['firstName']
                                                .toString()
                                                .substring(0, 1)
                                                .toUpperCase() +
                                            model.userDetails[0]['lastName']
                                                .toString()
                                                .substring(0, 1)
                                                .toUpperCase(),
                                        style: const TextStyle(
                                          color: UIData.primaryColor,
                                        )),
                                  )),
                        SizedBox(height: SizeConfig.safeBlockVertical * 1.25),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 4),
                          child: Text(
                              "${model.userDetails[0]['firstName']} ${model.userDetails[0]['lastName']}",
                              style: const TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 0.625),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 4),
                          child: Text(
                              "Current Organization: ${model.orgName ?? 'No Organization Joined'}",
                              style: const TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2.5),
                  Expanded(
                    child: ListView(
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: [
                          ListTile(
                            key: const Key('Update Profile'),
                            title: const Text(
                              'Update Profile',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            leading: const Icon(
                              Icons.edit,
                              color: UIData.secondaryColor,
                            ),
                            onTap: () {
                              pushNewScreen(
                                context,
                                screen: UpdateProfileView(
                                  userDetails: model.userDetails,
                                ),
                              );
                            },
                          ),
                          model.org.isEmpty
                              ? const SizedBox()
                              : ListTile(
                                  key: const Key('Switch Organization'),
                                  title: const Text(
                                    'Switch Organization',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  leading: const Icon(
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
                              key: const Key('Join or Create New Organization'),
                              title: const Text(
                                'Join or Create New Organization',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: const Icon(
                                Icons.business,
                                color: UIData.secondaryColor,
                              ),
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: const JoinOrganization(
                                    fromProfile: true,
                                  ),
                                );
                              }),
                          model.isCreator == null
                              ? const SizedBox()
                              : isCreator == true
                                  ? ListTile(
                                      key: const Key('Organization Settings'),
                                      title: const Text(
                                        'Organization Settings',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      leading: const Icon(
                                        Icons.settings,
                                        color: UIData.secondaryColor,
                                      ),
                                      onTap: () {
                                        pushNewScreen(
                                          context,
                                          screen: OrganizationSettings(
                                              creator:
                                                  model.creator == model.userID,
                                              public: model.isPublic,
                                              organization:
                                                  model.curOrganization),
                                        );
                                      })
                                  : model.org.isEmpty
                                      ? const SizedBox()
                                      : ListTile(
                                          key: const Key(
                                              'Leave This Organization'),
                                          title: const Text(
                                            'Leave This Organization',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          leading: const Icon(
                                            Icons.exit_to_app,
                                            color: UIData.secondaryColor,
                                          ),
                                          onTap: () async {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertBox(
                                                  message:
                                                      "Are you sure you want to leave this organization?",
                                                  function: model.leaveOrg,
                                                );
                                              },
                                            );
                                          },
                                        ),
                          ListTile(
                              key: const Key('Logout'),
                              title: const Text(
                                "Logout",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              leading: const Icon(
                                Icons.exit_to_app,
                                color: UIData.secondaryColor,
                              ),
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertBox(
                                          message:
                                              "Are you sure you want to logout?",
                                          function: () => model.authController
                                              .logout(context));
                                    });
                              }),
                          MyAboutTile(),
                        ],
                      ).toList(),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

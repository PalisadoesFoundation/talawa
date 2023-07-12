import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

/// Creates a custom drawer for switching organizations.
///
/// joining new organizations, or leaving an organization.
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.homeModel,
  }) : super(key: key);

  /// home model.
  final MainScreenViewModel homeModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<CustomDrawerViewModel>(
      onModelReady: (model) => model.initialize(homeModel, context),
      builder: (context, model, child) {
        return Container(
          width: SizeConfig.screenWidth! * 0.6,
          alignment: Alignment.centerLeft,
          child: Drawer(
            key: const Key("Drawer"),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //A material design Drawer header that identifies the app's user.
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CustomAvatar(
                        isImageNull: model.selectedOrg?.image == null,
                        imageUrl: model.selectedOrg?.image,
                        firstAlphabet: model.selectedOrg?.name!.substring(0, 1),
                      ),
                      accountName: Column(
                        key: MainScreenViewModel.keyDrawerCurOrg,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.selectedOrg?.name! ?? "NULL",
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate("Selected Organization"),
                          )
                        ],
                      ),
                      accountEmail: const SizedBox(),
                    ),
                    //Tile to Switch organizations
                    Column(
                      key: MainScreenViewModel.keyDrawerSwitchableOrg,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 8.0,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate("Switch Organization"),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.41,
                          child: Scrollbar(
                            controller: model.controller,
                            thumbVisibility: true,
                            child: ListView.builder(
                              key: const Key("Switching Org"),
                              controller: model.controller,
                              padding: EdgeInsets.zero,
                              itemCount: model.switchAbleOrg.length,
                              // itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  key: const Key("Org"),
                                  onTap: () => model
                                      .switchOrg(model.switchAbleOrg[index]),
                                  leading: CustomAvatar(
                                    isImageNull:
                                        model.switchAbleOrg[index].image ==
                                            null,
                                    imageUrl: model.switchAbleOrg[index].image,
                                    firstAlphabet: model
                                        .switchAbleOrg[index].name!
                                        .substring(0, 1),
                                    fontSize: 18,
                                  ),
                                  title: Text(
                                    model.switchAbleOrg[index].name!,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    // A Tile to join a new organization
                    ListTile(
                      key: MainScreenViewModel.keyDrawerJoinOrg,
                      onTap: () => navigationService
                          .popAndPushScreen(Routes.joinOrg, arguments: '-1'),
                      leading: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                      title: Text(
                        AppLocalizations.of(context)!
                            .strictTranslate("Join new Organization"),
                      ),
                    ),
                    ListTile(
                      key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                      onTap: () => exitButton(),
                      leading: const Icon(Icons.logout, size: 30),
                      title: Text(
                        AppLocalizations.of(context)!
                            .strictTranslate("Leave Current Organization"),
                      ),
                    ),
                    SizedBox(
                      key: const Key("Sized Box Drawer"),
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    const FromPalisadoes(key: Key("From Palisadoes")),
                    SizedBox(
                      key: const Key("Sized BottomBox Drawer"),
                      height: SizeConfig.screenHeight! * 0.03,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Button to exit the organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None

  void exitButton() {
    return navigationService.pushDialog(
      CustomAlertDialog(
        key: const Key("Exit?"),
        reverse: true,
        dialogSubTitle: 'Are you sure you want to exit this organization?',
        successText: 'Exit',
        success: () {
          //Exit org
        },
      ),
    );
  }
}

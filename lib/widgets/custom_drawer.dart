import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

/// Creates a custom drawer for switching organizations.
///
/// This widget enables users to view the selected organization,
/// switch between organizations, join new organizations,
/// and leave the current organization.
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.homeModel,
  });

  /// The main screen view model associated with the drawer.
  final MainScreenViewModel homeModel;

  /// Builds the custom drawer widget tree.
  ///
  /// **params**:
  /// * `context`: The build context of the widget.
  ///
  /// **returns**:
  /// * `Widget`: The constructed drawer widget.
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: [
                      _DrawerHeader(
                        model: model,
                        homeModel: homeModel,
                      ),
                      _SwitchOrganizationSection(
                        model: model,
                        homeModel: homeModel,
                      ),
                    ],
                  ),
                ),
                _DrawerActions(
                  model: model,
                  homeModel: homeModel,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Displays the current organization information in the drawer header.
///
/// This widget renders the selected organization's avatar
/// and basic identification details.
class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    required this.model,
    required this.homeModel,
  });

  /// The view model managing drawer state.
  final CustomDrawerViewModel model;

  /// The main screen view model associated with the drawer.
  final MainScreenViewModel homeModel;

  /// Builds the drawer header widget.
  ///
  /// **params**:
  /// * `context`: The build context of the widget.
  ///
  /// **returns**:
  /// * `Widget`: The constructed drawer header widget.
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: CustomAvatar(
        isImageNull: model.selectedOrg?.image == null,
        imageUrl: model.selectedOrg?.image,
        firstAlphabet: model.selectedOrg?.name?.substring(0, 1),
      ),
      accountName: Column(
        key: homeModel.keys.keyDrawerCurOrg,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.selectedOrg?.name ??
                AppLocalizations.of(context)!
                    .strictTranslate("Unnamed Organization"),
          ),
          Text(
            AppLocalizations.of(context)!
                .strictTranslate("Selected Organization"),
          ),
        ],
      ),
      accountEmail: const SizedBox(),
    );
  }
}

/// Displays the list of switchable organizations.
///
/// This widget shows all organizations the user can switch to
/// inside a scrollable list.
class _SwitchOrganizationSection extends StatelessWidget {
  const _SwitchOrganizationSection({
    required this.model,
    required this.homeModel,
  });

  /// The view model managing organization switching logic.
  final CustomDrawerViewModel model;

  /// The main screen view model associated with the drawer.
  final MainScreenViewModel homeModel;

  /// Builds the organization switching section.
  ///
  /// **params**:
  /// * `context`: The build context of the widget.
  ///
  /// **returns**:
  /// * `Widget`: The constructed organization list section.
  @override
  Widget build(BuildContext context) {
    return Column(
      key: homeModel.keys.keyDrawerSwitchableOrg,
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
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  key: const Key("Org"),
                  onTap: () => model.switchOrg(
                    model.switchAbleOrg[index],
                  ),
                  leading: CustomAvatar(
                    isImageNull: model.switchAbleOrg[index].image == null,
                    imageUrl: model.switchAbleOrg[index].image,
                    firstAlphabet:
                        model.switchAbleOrg[index].name?.substring(0, 1),
                    fontSize: 18,
                  ),
                  title: Text(
                    model.switchAbleOrg[index].name ?? "NULL",
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// Displays bottom drawer actions.
///
/// This section contains options to join a new organization,
/// leave the current organization, and shows branding information.

class _DrawerActions extends StatelessWidget {
  const _DrawerActions({
    required this.model,
    required this.homeModel,
  });

  /// The view model managing drawer logic.
  final CustomDrawerViewModel model;

  /// The main screen view model associated with the drawer.
  final MainScreenViewModel homeModel;

  /// Builds the bottom drawer actions section.
  ///
  /// **params**:
  /// * `context`: The build context of the widget.
  ///
  /// **returns**:
  /// * `Widget`: The constructed bottom action section.
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Column(
        children: <Widget>[
          const Divider(),
          ListTile(
            key: homeModel.keys.keyDrawerJoinOrg,
            onTap: () {
              if (userConfig.loggedIn) {
                navigationService.popAndPushScreen(
                  Routes.joinOrg,
                  arguments: '-1',
                );
              } else {
                navigationService.popAndPushScreen(
                  Routes.setUrlScreen,
                  arguments: '',
                );
              }
            },
            leading: const Icon(
              Icons.add,
              size: 30,
            ),
            title: Text(
              AppLocalizations.of(context)!
                  .strictTranslate("Join new Organization"),
            ),
          ),
          if (userConfig.loggedIn)
            ListTile(
              key: homeModel.keys.keyDrawerLeaveCurrentOrg,
              onTap: () => navigationService.pushDialog(
                model.exitAlertDialog(context),
              ),
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
          ),
        ],
      ),
    );
  }
}

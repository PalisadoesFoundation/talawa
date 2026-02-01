import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Helper class for building home screen tour targets.
class HomeTourTargets {
  /// Builds home tour targets.
  ///
  /// **params**:
  /// * `keys`: MainScreenKeys instance
  /// * `appTour`: AppTour instance
  /// * `scaffoldKey`: Scaffold key for drawer operations
  /// * `userConfig`: User configuration (optional, for testing)
  ///
  /// **returns**:
  /// * `List<FocusTarget>`: List of focus targets for home tour
  static List<FocusTarget> build({
    required MainScreenKeys keys,
    required AppTour appTour,
    required GlobalKey<ScaffoldState> scaffoldKey,
    UserConfig? userConfig,
  }) {
    final UserConfig localUserConfig = userConfig ?? locator<UserConfig>();
    final List<FocusTarget> targets = [];

    targets.add(
      FocusTarget(
        key: keys.keySHOrgName,
        keyName: 'keySHOrgName',
        description: 'Current selected Organization Name',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySHMenuIcon,
        keyName: 'keySHMenuIcon',
        description:
            'Click this button to see options related to switching, joining and leaving organization(s)',
        isCircle: true,
        next: () => scaffoldKey.currentState!.openDrawer(),
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keyDrawerCurOrg,
        keyName: 'keyDrawerCurOrg',
        description: "Current selected Organization's Name appears here",
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keyDrawerSwitchableOrg,
        keyName: 'keyDrawerSwitchableOrg',
        description:
            "All your joined organizations appear over here you can click on them to change the current organization",
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keyDrawerJoinOrg,
        keyName: 'keyDrawerJoinOrg',
        description: "From this button you can join other listed organizations",
        appTour: appTour,
        align: ContentAlign.top,
        next: () {
          if (!localUserConfig.loggedIn) {
            navigationService.pop();
          }
        },
      ),
    );

    if (localUserConfig.loggedIn) {
      targets.add(
        FocusTarget(
          key: keys.keyDrawerLeaveCurrentOrg,
          keyName: 'keyDrawerLeaveCurrentOrg',
          description:
              "To leave the current organization you can use this option",
          align: ContentAlign.top,
          next: () => navigationService.pop(),
          appTour: appTour,
        ),
      );
    }

    targets.add(
      FocusTarget(
        key: keys.keyBNHome,
        keyName: 'keyBNHome',
        description:
            "This is the home tab here you can see the latest post from other members of the current organization",
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySHPinnedPost,
        keyName: 'keySHPinnedPost',
        description:
            "This section displays all the important post set by the organization admin(s)",
        align: ContentAlign.bottom,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySHPost,
        keyName: 'keySHPost',
        description:
            "This is the post card you can like and comment on the post from the options available",
        align: ContentAlign.bottom,
        appTour: appTour,
      ),
    );

    return targets;
  }

  /// Handles clicks during home tour.
  ///
  /// **params**:
  /// * `clickedTarget`: The clicked target
  /// * `scaffoldKey`: Scaffold key for drawer operations
  ///
  /// **returns**:
  ///   None
  static Future<void> handleClick(
    TargetFocus clickedTarget,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) async {
    switch (clickedTarget.identify) {
      case "keySHMenuIcon":
        scaffoldKey.currentState!.openDrawer();
        return;
      case "keyDrawerLeaveCurrentOrg":
        navigationService.pop();
        return;
      case "keyBNHome":
        if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
          scaffoldKey.currentState?.closeDrawer();
          await Future.delayed(const Duration(milliseconds: 300));
        }
        return;
    }
  }
}

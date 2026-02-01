import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// ViewModel managing app tour flow, tutorial targets, and dialogs.
///
/// Responsibilities:
/// - Build and display app tour dialog
/// - Manage tour targets for home, events, chat, profile screens
/// - Handle tour flow progression
/// - Track tour completion state
class MainScreenTourViewModel extends BaseModel {
  /// Constructs MainScreenTourViewModel with required dependencies.
  ///
  /// **params**:
  /// * `keys`: MainScreenKeys instance for accessing GlobalKeys
  /// * `onTabTapped`: Callback to switch tabs during tour
  MainScreenTourViewModel({
    required this.keys,
    required this.onTabTapped,
  });

  /// Reference to MainScreenKeys for accessing GlobalKeys.
  final MainScreenKeys keys;

  /// Callback to switch tabs during tour.
  final void Function(int) onTabTapped;

  /// Whether to show the app tour.
  late bool showAppTour;

  /// Whether the tour is complete.
  bool tourComplete = false;

  /// Whether the tour was skipped.
  bool tourSkipped = false;

  /// Current build context.
  late BuildContext context;

  /// App tour instance.
  late AppTour appTour;

  /// List of focus targets for the current tour step.
  final List<FocusTarget> targets = [];

  /// Initializes the tour based on user state.
  ///
  /// **params**:
  /// * `ctx`: BuildContext
  /// * `fromSignUp`: Whether user just signed up
  /// * `demoMode`: Whether app is in demo mode
  /// * `scaffoldKey`: Scaffold key for drawer operations
  /// * `parentModel`: Reference to parent model for AppTour
  ///
  /// **returns**:
  ///   None
  void initializeTour(
    BuildContext ctx, {
    required bool fromSignUp,
    required bool demoMode,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required BaseModel parentModel,
  }) {
    showAppTour = fromSignUp || demoMode;
    context = ctx;
    appTour = AppTour(model: parentModel as MainScreenViewModel);

    if (!showAppTour) {
      tourComplete = true;
      tourSkipped = false;
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          navigationService.pushDialog(
            appTourDialog(ctx, scaffoldKey),
          );
        },
      );
    }
  }

  /// Builds and returns an AppTourDialog.
  ///
  /// **params**:
  /// * `ctx`: The build context to work with
  /// * `scaffoldKey`: Scaffold key for drawer operations
  ///
  /// **returns**:
  /// * `Widget`: The built [Dialog]
  Widget appTourDialog(BuildContext ctx, GlobalKey<ScaffoldState> scaffoldKey) {
    return CustomAlertDialog(
      dialogTitle: 'App Tour',
      dialogSubTitle: 'Start app tour to know talawa functioning',
      successText: 'Start',
      secondaryButtonText: 'Skip',
      success: () {
        navigationService.pop();
        if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
          scaffoldKey.currentState?.closeDrawer();
        }
        tourHomeTargets(scaffoldKey);
      },
      secondaryButtonTap: () {
        tourComplete = false;
        tourSkipped = true;
        navigationService.pop();
        notifyListeners();
      },
    );
  }

  /// Starts the home tour with focus targets.
  ///
  /// **params**:
  /// * `scaffoldKey`: Scaffold key for drawer operations
  /// * `givenUserConfig`: Mock user config for testing
  ///
  /// **returns**:
  ///   None
  void tourHomeTargets(
    GlobalKey<ScaffoldState> scaffoldKey, [
    UserConfig? givenUserConfig,
  ]) {
    final UserConfig localUserConfig = givenUserConfig ?? userConfig;
    targets.clear();
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
    appTour.showTutorial(
      onClickTarget: (target) => showHome(target, scaffoldKey),
      onFinish: () {
        onTabTapped(1); // Move to events tab
        if (!tourComplete && !tourSkipped) {
          tourEventTargets();
        }
      },
      targets: targets,
    );
  }

  /// Handles clicks during home tour.
  ///
  /// **params**:
  /// * `clickedTarget`: The clicked target
  /// * `scaffoldKey`: Scaffold key for drawer operations
  ///
  /// **returns**:
  ///   None
  Future<void> showHome(
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

  /// Shows the events tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourEventTargets() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keys.keyBNEvents,
        keyName: 'keyBNEvents',
        description:
            'This is the Events tab here you can see all event related information of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySECategoryMenu,
        keyName: 'keySECategoryMenu',
        description: 'Filter Events based on categories',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySEDateFilter,
        keyName: 'keySEDateFilter',
        description: 'Filter Events between selected dates',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySECard,
        keyName: 'keySECard',
        description:
            'Description of event to see more details click on the card',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySEAdd,
        keyName: 'keySEAdd',
        description: 'You can create a new event from here',
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );

    appTour.showTutorial(
      onFinish: () {
        onTabTapped(2); // Move to chat tab
        if (!tourComplete && !tourSkipped) {
          tourChat();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// Shows the chat tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourChat() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keys.keyBNChat,
        keyName: 'keyBNChat',
        description:
            'This is the Chat tab here you can see all your messages of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );
    appTour.showTutorial(
      onFinish: () {
        onTabTapped(4); // Move to profile tab
        if (!tourComplete && !tourSkipped) {
          tourProfile();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// Shows the profile tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourProfile() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keys.keyBNProfile,
        keyName: 'keyBNProfile',
        description:
            'This is the Profile tab here you can see all options related to account, app setting, invitation, help etc',
        isCircle: true,
        align: ContentAlign.top,
        nextCrossAlign: CrossAxisAlignment.start,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySPAppSetting,
        keyName: 'keySPAppSetting',
        description:
            'You can edit application settings like language, theme etc from here',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySPHelp,
        keyName: 'keySPHelp',
        description:
            'For any help we are always there. You can reach us from here',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySPDonateUs,
        keyName: 'keySPDonateUs',
        description:
            'To help your organization grow you can support them financially from here',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keys.keySPPalisadoes,
        keyName: 'keySPPalisadoes',
        description: 'You are all set to go lets get you in',
        isEnd: true,
        appTour: appTour,
      ),
    );

    appTour.showTutorial(
      onFinish: () {
        if (!tourComplete && !tourSkipped) {
          tourComplete = true;
          onTabTapped(0); // Return to home tab
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// Shows the add post tour (kept for compatibility).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourAddPost() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keys.keyBNPost,
        keyName: 'keyBNPost',
        description:
            'This is the Create post tab here you can add post to the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );
    appTour.showTutorial(
      onFinish: () {
        onTabTapped(2); // Move to chat
        if (!tourComplete && !tourSkipped) {
          tourChat();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }
}

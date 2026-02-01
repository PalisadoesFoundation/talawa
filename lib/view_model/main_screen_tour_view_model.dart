import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/tour_targets/home_tour_targets.dart';
import 'package:talawa/view_model/tour_targets/other_tour_targets.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// ViewModel managing app tour flow, tutorial targets, and dialogs.
///
/// Handles tour initialization, progression, and completion tracking.
class MainScreenTourViewModel extends BaseModel {
  MainScreenTourViewModel({required this.keys, required this.onTabTapped});

  /// Reference to MainScreenKeys.
  final MainScreenKeys keys;

  /// Callback to switch tabs.
  final void Function(int) onTabTapped;

  /// Show tour flag.
  bool showAppTour = false;
  /// Tour complete flag.
  bool tourComplete = false;

  /// Tour skipped flag.
  bool tourSkipped = false;

  @visibleForTesting

  /// Transition delay for testing.
  static Duration transitionDelay = const Duration(milliseconds: 500);

  /// Context set in initializeTour. Check mounted before use.
  late BuildContext context;

  /// App tour instance.
  late AppTour appTour;

  /// List of focus targets for the current tour step.
  final List<FocusTarget> targets = [];

  /// Initializes tour based on user state.
  ///
  /// **params**:
  /// * `ctx`: BuildContext
  /// * `fromSignUp`: User just signed up
  /// * `demoMode`: App in demo mode
  /// * `scaffoldKey`: Scaffold key
  /// * `mainScreenModel`: MainScreenViewModel instance
  ///
  /// **returns**:
  ///   None
  void initializeTour(
    BuildContext ctx, {
    required bool fromSignUp,
    required bool demoMode,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required MainScreenViewModel mainScreenModel,
  }) {
    // Reset tour state to allow re-initialization
    tourComplete = false;
    tourSkipped = false;
    showAppTour = fromSignUp || demoMode;
    context = ctx;
    appTour = AppTour(model: mainScreenModel);

    if (!showAppTour) {
      tourComplete = true;
      tourSkipped = false;
    } else {
      _showTourDialogAfterDelay(ctx, scaffoldKey);
    }
  }

  /// Shows tour dialog after delay with mounted check.
  ///
  /// **params**:
  /// * `ctx`: BuildContext
  /// * `scaffoldKey`: Scaffold key
  ///
  /// **returns**:
  ///   None
  Future<void> _showTourDialogAfterDelay(
    BuildContext ctx,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (ctx.mounted)
      navigationService.pushDialog(appTourDialog(ctx, scaffoldKey));
  }

  /// Builds and returns an AppTourDialog.
  ///
  /// **params**:
  /// * `ctx`: BuildContext
  /// * `scaffoldKey`: Scaffold key
  ///
  /// **returns**:
  /// * `Widget`: CustomAlertDialog widget
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

  /// Starts home tour.
  ///
  /// **params**:
  /// * `scaffoldKey`: Scaffold key
  /// * `givenUserConfig`: Mock config for testing
  ///
  /// **returns**:
  ///   None
  void tourHomeTargets(
    GlobalKey<ScaffoldState> scaffoldKey, [
    UserConfig? givenUserConfig,
  ]) {
    targets.clear();
    targets.addAll(
      HomeTourTargets.build(
        keys: keys,
        appTour: appTour,
        scaffoldKey: scaffoldKey,
        userConfig: givenUserConfig,
      ),
    );

    appTour.showTutorial(
      onClickTarget: (target) =>
          HomeTourTargets.handleClick(target, scaffoldKey),
      onFinish: () async {
        onTabTapped(1);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) {
          tourEventTargets();
        }
      },
      targets: targets,
    );
  }

  /// Shows events tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourEventTargets() {
    targets.clear();
    targets.addAll(
      OtherTourTargets.buildEventTargets(keys: keys, appTour: appTour),
    );

    appTour.showTutorial(
      onFinish: () async {
        onTabTapped(2);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) {
          tourChat();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// Shows chat tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourChat() {
    targets.clear();
    targets.addAll(
      OtherTourTargets.buildChatTargets(keys: keys, appTour: appTour),
    );

    appTour.showTutorial(
      onFinish: () async {
        onTabTapped(4);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) {
          tourProfile();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// Shows profile tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourProfile() {
    targets.clear();
    targets.addAll(
      OtherTourTargets.buildProfileTargets(keys: keys, appTour: appTour),
    );

    appTour.showTutorial(
      onFinish: () async {
        if (!tourComplete && !tourSkipped) {
          tourComplete = true;
          onTabTapped(0);
          await Future.delayed(transitionDelay);
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// Shows add post tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourAddPost() {
    targets.clear();
    targets.addAll(
      OtherTourTargets.buildAddPostTargets(keys: keys, appTour: appTour),
    );

    appTour.showTutorial(
      onFinish: () async {
        onTabTapped(2);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) {
          tourChat();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// Handles home tour clicks.
  ///
  /// **params**:
  /// * `clickedTarget`: Clicked target
  /// * `scaffoldKey`: Scaffold key
  ///
  /// **returns**:
  ///   None
  Future<void> showHome(
    TargetFocus clickedTarget,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) {
    return HomeTourTargets.handleClick(clickedTarget, scaffoldKey);
  }
}

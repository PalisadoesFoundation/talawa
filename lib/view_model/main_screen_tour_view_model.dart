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
  /// Constructs MainScreenTourViewModel.
  MainScreenTourViewModel({
    required this.keys,
    required this.onTabTapped,
  });

  /// Reference to MainScreenKeys for accessing GlobalKeys.
  final MainScreenKeys keys;

  /// Callback to switch tabs during tour.
  final void Function(int) onTabTapped;

  /// Whether to show the app tour.
  bool showAppTour = false;
  /// Whether the tour is complete.
  bool tourComplete = false;

  /// Whether the tour was skipped.
  bool tourSkipped = false;

  /// Current build context for tour operations.
  ///
  /// **Lifecycle**: Set during `initializeTour()` by MainScreenViewModel and
  /// valid only while the associated MainScreen widget is mounted. Should not
  /// be used after widget disposal. Callers must check `context.mounted` before
  /// use in async operations to prevent use-after-dispose errors.
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
  /// * `mainScreenModel`: MainScreenViewModel instance for AppTour
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

  /// Shows tour dialog after a delay with mounted check.
  ///
  /// **params**:
  /// * `ctx`: BuildContext for dialog
  /// * `scaffoldKey`: Scaffold key for drawer operations
  ///
  /// **returns**:
  ///   None
  Future<void> _showTourDialogAfterDelay(
    BuildContext ctx,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    // Check if context is still valid
    if (ctx.mounted) {
      navigationService.pushDialog(
        appTourDialog(ctx, scaffoldKey),
      );
    }
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
      onFinish: () {
        onTabTapped(1); // Move to events tab
        if (!tourComplete && !tourSkipped) {
          tourEventTargets();
        }
      },
      targets: targets,
    );
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
    targets.addAll(
      OtherTourTargets.buildEventTargets(
        keys: keys,
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
    targets.addAll(
      OtherTourTargets.buildChatTargets(
        keys: keys,
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
    targets.addAll(
      OtherTourTargets.buildProfileTargets(
        keys: keys,
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
    targets.addAll(
      OtherTourTargets.buildAddPostTargets(
        keys: keys,
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

  /// Handles clicks during home tour (delegated to helper).
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
  ) {
    return HomeTourTargets.handleClick(clickedTarget, scaffoldKey);
  }
}

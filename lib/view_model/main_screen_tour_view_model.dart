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
class MainScreenTourViewModel extends BaseModel {
  MainScreenTourViewModel({required this.keys, required this.onTabTapped});

  final MainScreenKeys keys;
  final void Function(int) onTabTapped;

  /// Flags to track tour state
  bool showAppTour = false;
  bool tourComplete = false;
  bool tourSkipped = false;

  @visibleForTesting
  static Duration transitionDelay = const Duration(milliseconds: 500);

  late BuildContext context;
  late AppTour appTour;

  /// Active focus targets for the current tour step
  final List<FocusTarget> targets = [];

  /// Initializes the app tour based on user state.
  void initializeTour(
    BuildContext ctx, {
    required bool fromSignUp,
    required bool demoMode,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required MainScreenViewModel mainScreenModel,
  }) {
    tourComplete = false;
    tourSkipped = false;
    showAppTour = fromSignUp || demoMode;
    context = ctx;
    appTour = AppTour(model: mainScreenModel);

    if (!showAppTour) {
      tourComplete = true;
    } else {
      _showTourDialogAfterDelay(ctx, scaffoldKey);
    }
  }

  /// Delay and show tour dialog safely if mounted.
  Future<void> _showTourDialogAfterDelay(
    BuildContext ctx,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (ctx.mounted) {
      navigationService.pushDialog(_buildTourDialog(ctx, scaffoldKey));
    }
  }

  /// Builds the CustomAlertDialog for app tour start.
  Widget _buildTourDialog(BuildContext ctx, GlobalKey<ScaffoldState> scaffoldKey) {
    return CustomAlertDialog(
      dialogTitle: 'App Tour',
      dialogSubTitle: 'Start app tour to know Talawa functioning',
      successText: 'Start',
      secondaryButtonText: 'Skip',
      success: () {
        navigationService.pop();
        if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
          scaffoldKey.currentState?.closeDrawer();
        }
        _startHomeTour(scaffoldKey);
      },
      secondaryButtonTap: () {
        tourSkipped = true;
        navigationService.pop();
        notifyListeners();
      },
    );
  }

  /// ------------------- Tour Steps -------------------

  void _startHomeTour(GlobalKey<ScaffoldState> scaffoldKey, [UserConfig? userConfig]) {
    _showTourStep(
      targets: HomeTourTargets.build(
        keys: keys,
        appTour: appTour,
        scaffoldKey: scaffoldKey,
        userConfig: userConfig,
      ),
      onClickTarget: (t) => HomeTourTargets.handleClick(t, scaffoldKey),
      onFinish: () async {
        onTabTapped(1);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) _startEventTour();
      },
    );
  }

  void _startEventTour() {
    _showTourStep(
      targets: OtherTourTargets.buildEventTargets(keys: keys, appTour: appTour),
      onFinish: () async {
        onTabTapped(2);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) _startChatTour();
      },
    );
  }

  void _startChatTour() {
    _showTourStep(
      targets: OtherTourTargets.buildChatTargets(keys: keys, appTour: appTour),
      onFinish: () async {
        onTabTapped(4);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) _startProfileTour();
      },
    );
  }

  void _startProfileTour() {
    _showTourStep(
      targets: OtherTourTargets.buildProfileTargets(keys: keys, appTour: appTour),
      onFinish: () async {
        tourComplete = true;
        onTabTapped(0);
        await Future.delayed(transitionDelay);
      },
    );
  }

  void tourAddPost() {
    _showTourStep(
      targets: OtherTourTargets.buildAddPostTargets(keys: keys, appTour: appTour),
      onFinish: () async {
        onTabTapped(2);
        await Future.delayed(transitionDelay);
        if (!tourComplete && !tourSkipped) _startChatTour();
      },
    );
  }

  /// ------------------- Private Helper -------------------

  void _showTourStep({
    required List<FocusTarget> targets,
    required void Function(TargetFocus)? onClickTarget,
    required FutureOr<void> Function()? onFinish,
  }) {
    this.targets
      ..clear()
      ..addAll(targets);

    appTour.showTutorial(
      targets: this.targets,
      onClickTarget: onClickTarget ?? (_) {},
      onFinish: onFinish ?? () {},
    );
  }

  /// Exposed method for handling clicks in HomeTourTargets
  Future<void> showHome(TargetFocus clickedTarget, GlobalKey<ScaffoldState> scaffoldKey) {
    return HomeTourTargets.handleClick(clickedTarget, scaffoldKey);
  }
}

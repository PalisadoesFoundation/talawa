import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Class that handles all the apptour routines.
class AppTour {
  AppTour({
    required this.model,
  });

  ///instance of mainscreenviewmodel.
  MainScreenViewModel model;

  ///instance of tutorialCoachMark.
  late TutorialCoachMark tutorialCoachMark;

  /// This function show tutorial to user.
  ///
  /// **params**:
  /// * `onClickTarget`: Its a function which is required to run desired tasks on click.
  /// * `onFinish`: Its a function which is required to run desired tasks on finish
  ///
  ///
  /// **returns**:
  ///   None

  void showTutorial({
    required Function(TargetFocus) onClickTarget,
    required dynamic Function() onFinish,
    required List<FocusTarget> targets,
  }) {
    tutorialCoachMark = TutorialCoachMark(
      targets: targets.map((target) => target.focusWidget).toList(),
      colorShadow: Theme.of(model.context).colorScheme.secondaryContainer,
      textSkip: "SKIP",
      textStyleSkip: TextStyle(
        color: Theme.of(model.context).colorScheme.background,
        fontSize: 20,
      ),
      paddingFocus: 10,
      opacityShadow: 1.0,
      onFinish: onFinish,
      onClickTarget: onClickTarget,
      onSkip: () {
        if (MainScreenViewModel.scaffoldKey.currentState!.isDrawerOpen) {
          navigationService.pop();
        }
        model.tourSkipped = true;
        model.onTabTapped(0);
        return true;
      },
      onClickOverlay: (target) {
        onClickTarget(target);
      },
    );
    if (!model.testMode) tutorialCoachMark.show(context: model.context);
  }
}

/// Class that represents FocusTarget.
class FocusTarget {
  /// This returns a widget for a step in a tutorial.
  ///
  /// **params**:
  /// * `key`: key of type GlobalKey.
  /// * `keyName`: key where the widget shows.
  /// * `description`: description of the step.
  /// * `isCircle`: bool to specify if circle
  /// * `align`: align of type ContentAlign to align button.
  /// * `crossAlign`: Cross align axes
  /// * `skipAlignment`: to give alignment of skip option
  /// * `next`: Function` type, this show the next step or `key` to show the tour of.
  /// * `nextCrossAlign`: nextCrossAlign to give alignment of next option
  /// * `isEnd`: true if last step of the tour.
  /// * `tutorialCoachMark`: instance of tutorialCoachMark to which this focusTarget is linked.
  FocusTarget({
    required this.key,
    required this.keyName,
    required this.description,
    required this.appTour,
    this.isCircle = false,
    this.align = ContentAlign.bottom,
    this.crossAlign = CrossAxisAlignment.start,
    this.skipAlignment = Alignment.topRight,
    this.next,
    this.nextCrossAlign = CrossAxisAlignment.end,
    this.isEnd = false,
  }) {
    this.focusWidget = TargetFocus(
      enableOverlayTab: true,
      color: Colors.transparent,
      identify: keyName,
      keyTarget: key,
      alignSkip: skipAlignment,
      shape: isCircle ? ShapeLightFocus.Circle : ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: align,
          builder: (context, controller) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: crossAlign,
                children: <Widget>[
                  Text(
                    description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        TargetContent(
          align: ContentAlign.custom,
          customPosition: CustomTargetContentPosition(
            bottom: SizeConfig.screenHeight! * 0.025,
          ),
          builder: (context, controller) {
            return GestureDetector(
              onTap: () {
                next?.call();

                appTour.tutorialCoachMark.next();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: nextCrossAlign,
                children: <Widget>[
                  Text(
                    isEnd ? 'COMPLETE' : 'NEXT',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  /// represents the key of the target that is intended to be focused.
  GlobalKey key;

  /// keyName of the target in mainScreenViewModel.
  String keyName;

  /// description of the target.
  String description;

  /// true if focusing shape is circle.
  bool isCircle;

  /// alignment of description text.
  ContentAlign align;

  /// crossAxisAlignment.
  CrossAxisAlignment crossAlign;

  /// skip alignment configuration.
  Alignment skipAlignment;

  /// instance of AppTour.
  AppTour appTour;

  /// next callback that is executed on pressing this target.
  Function()? next;

  /// next target's crossAxisAlignment.
  CrossAxisAlignment nextCrossAlign;

  /// true current target ends ths appTour.
  bool isEnd;

  /// Target focus widget with all above properties.
  late TargetFocus focusWidget;
}

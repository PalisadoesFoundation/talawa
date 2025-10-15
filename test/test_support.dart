import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Mock BuildContext for testing purposes
class MockBuildContext extends Mock implements BuildContext {}

/// Custom TutorialCoachMarkController for testing purposes
class CustomTutorialController extends TutorialCoachMarkController {
  @override
  void next() {}

  @override
  void previous() {}

  @override
  void skip() {}
}

/// Mock TutorialCoachMark for testing purposes
class MockTutorialCoachMark extends Mock implements TutorialCoachMark {}

/// Mock AppTour for testing purposes
class MockAppTour extends Mock implements AppTour {
  MockAppTour({
    required this.model,
  });

  @override
  TutorialCoachMark get tutorialCoachMark => MockTutorialCoachMark();

  @override
  void showTutorial({
    required Function(TargetFocus p1) onClickTarget,
    required Function() onFinish,
    required List<FocusTarget> targets,
  }) {
    onFinish();
    onClickTarget(
      TargetFocus(
        identify: MainScreenViewModel.keyDrawerCurOrg,
        keyTarget: MainScreenViewModel.keyBNChat,
      ),
    );
  }

  @override
  MainScreenViewModel model;
}

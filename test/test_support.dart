import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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

  TutorialCoachMark? _tutorialCoachMark;

  @override
  TutorialCoachMark get tutorialCoachMark =>
      _tutorialCoachMark ??= MockTutorialCoachMark();

  @override
  set tutorialCoachMark(TutorialCoachMark value) => _tutorialCoachMark = value;

  @override
  void showTutorial({
    required void Function(TargetFocus p1) onClickTarget,
    required VoidCallback onFinish,
    required List<FocusTarget> targets,
  }) {
    onFinish();
    onClickTarget(
      TargetFocus(
        identify: "keyDrawerCurOrg",
        keyTarget: MainScreenViewModel.keyBNChat,
      ),
    );
  }

  @override
  MainScreenViewModel model;
}

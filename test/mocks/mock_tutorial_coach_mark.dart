// ignore_for_file: talawa_api_doc
import 'package:mockito/mockito.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// Mocks for AppTour/tutorial coach mark flows used in tests.
class MockTutorialCoachMark extends Mock implements TutorialCoachMark {}

class MockTargetFocus extends Mock implements TargetFocus {}

class MockTutorialCoachMarkController extends Mock
    implements TutorialCoachMarkController {}

// Note: These mocks are only used in widget tests to isolate tutorial dependencies.

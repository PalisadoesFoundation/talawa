import 'package:mockito/mockito.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// Mocks for testing the tutorial functionality
// Had some trouble with real objects in tests, so using mocks instead
class MockTutorialCoachMark extends Mock implements TutorialCoachMark {}

class MockTargetFocus extends Mock implements TargetFocus {}

class MockTutorialCoachMarkController extends Mock 
    implements TutorialCoachMarkController {}

// Learning notes:
// - Mockito is pretty powerful for testing Flutter widgets
// - Context initialization is crucial for widget tests to work properly  
// - Need to make sure all dependencies are mocked or provided
// - Still getting the hang of when to use mocks vs fakes

// PS: The navigation service mocking was tricky but finally got it working!
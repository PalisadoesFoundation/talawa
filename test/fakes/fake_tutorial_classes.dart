// ignore_for_file: talawa_api_doc
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Test double for MainScreenViewModel used by AppTour tests to track tab taps.
class FakeMainScreenViewModel extends MainScreenViewModel {
  FakeMainScreenViewModel() : super();

  /// Records last tapped tab index for verification.
  int? lastTappedIndex;

  /// Counts how many times onTabTapped() was triggered during tests.
  int tabTapCount = 0;

  @override
  void onTabTapped(int index) {
    lastTappedIndex = index;
    tabTapCount++;
    super.onTabTapped(index); // Preserve original behavior.
  }
}

/// Minimal controller used to simulate TutorialCoachMark behavior in tests.
class FakeTutorialCoachMarkController implements TutorialCoachMarkController {
  /// Tracks next() invocations.
  int nextCount = 0;

  /// Tracks previous() invocations.
  int previousCount = 0;

  /// Tracks skip() invocations.
  int skipCount = 0;

  @override
  void next() => nextCount++;

  @override
  void previous() => previousCount++;

  @override
  void skip() => skipCount++;

  // Basic synchronous implementation is sufficient for current tests.
}

/// Test NavigationService that only records when pop() is called.
class FakeNavigationService extends NavigationService {
  /// Indicates if pop() was invoked during test flows.
  bool popCalled = false;

  @override
  void pop() {
    popCalled = true;
  }

  // Additional NavigationService methods can be added here if future tests require them.
}

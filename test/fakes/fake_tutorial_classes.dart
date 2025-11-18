import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// Trying out a simpler version of MainScreenViewModel just for testing the app tour
// Mainly need to track tab taps and skip status
class FakeMainScreenViewModel extends MainScreenViewModel {
  FakeMainScreenViewModel() : super();

  // Keep track of which tab was last tapped during tests
  int? lastTappedIndex;

  // Count how many times tabs were tapped
  int tabTapCount = 0;

  @override
  void onTabTapped(int index) {
    lastTappedIndex = index;
    tabTapCount++;

    // Still call the parent method to maintain normal behavior
    super.onTabTapped(index);
  }
}

// This fake controller helps when we're building tutorial content
// The real one would be null during tests, so this gives us something to work with
class FakeTutorialCoachMarkController implements TutorialCoachMarkController {
  // Track how many times each method gets called
  int nextCount = 0;
  int previousCount = 0;
  int skipCount = 0;

  @override
  void next() {
    nextCount++;
  }

  @override
  void previous() {
    previousCount++;
  }

  @override
  void skip() {
    skipCount++;
  }

  // TODO: Add proper Mockito annotations later if needed
  // For now, this basic implementation works for our tests
}

// Simple navigation service that just records when pop is called
// We don't need the full navigation stack for these tests
class FakeNavigationService extends NavigationService {
  bool popCalled = false;

  @override
  void pop() {
    popCalled = true;
  }

  // Other methods we might need later...
  // @override
  // void pushScreen(String route) {
  //   // implement when needed
  // }
}

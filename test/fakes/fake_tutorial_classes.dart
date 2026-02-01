// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:talawa/view_model/main_screen_nav_view_model.dart';
import 'package:talawa/view_model/main_screen_tour_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Fake navigation view model for tracking tab taps.
class FakeNavViewModel extends MainScreenNavViewModel {
  FakeNavViewModel({required super.keys});

  /// Records last tapped tab index for verification.
  int? lastTappedIndex;

  ///Counts how many times onTabTapped() was triggered during tests.
  int tabTapCount = 0;

  @override
  void onTabTapped(int index) {
    lastTappedIndex = index;
    tabTapCount++;
    super.onTabTapped(index);
  }
}

/// Test double for MainScreenViewModel used by AppTour tests to track tab taps.
///
/// Uses FakeNavViewModel to ensure tab taps are tracked properly.
class FakeMainScreenViewModel {
  /// Creates a fake instance with tracking-enabled navigation.
  factory FakeMainScreenViewModel() {
    final keys = MainScreenKeys();
    final navViewModel = FakeNavViewModel(keys: keys);
    final delegate = MainScreenViewModel.createForTest(
      keysInstance: keys,
      navInstance: navViewModel,
    );
    return FakeMainScreenViewModel._create(delegate, navViewModel);
  }

  FakeMainScreenViewModel._create(this._delegate, this._navViewModel);

  final MainScreenViewModel _delegate;
  final FakeNavViewModel _navViewModel;

  /// Records last tappedtab index for verification.
  int? get lastTappedIndex => _navViewModel.lastTappedIndex;

  ///  Counts how many times onTabTapped() was triggered during tests.
  int get tabTapCount => _navViewModel.tabTapCount;

  // Delegate all properties/methods used in tests
  MainScreenViewModel get model => _delegate;
  MainScreenKeys get keys => _delegate.keys;
  MainScreenTourViewModel get tourViewModel => _delegate.tourViewModel;
  bool get tourSkipped => _delegate.tourSkipped;
  set tourSkipped(bool value) => _delegate.tourSkipped = value;

  void onTabTapped(int index) => _delegate.onTabTapped(index);
  void tourHomeTargets([UserConfig? givenUserConfig]) =>
      _delegate.tourHomeTargets(givenUserConfig);

  void addListener(VoidCallback listener) => _delegate.addListener(listener);
  void removeListener(VoidCallback listener) =>
      _delegate.removeListener(listener);
}

/// Minimal controller used to simulate TutorialCoachMark behavior in tests.
class FakeTutorialCoachMarkController implements TutorialCoachMarkController {
  /// Tracks next() invocations.
  int nextCount = 0;

  /// Tracks previous() invocations.
  int previousCount = 0;

  ///Tracks skip() invocations.
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

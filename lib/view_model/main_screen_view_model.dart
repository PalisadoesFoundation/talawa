import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:talawa/view_model/main_screen_nav_view_model.dart';
import 'package:talawa/view_model/main_screen_tour_view_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// MainScreenViewModel serves as a coordinator for the main screen.
///
/// This class follows the composition pattern to delegate responsibilities
/// to specialized ViewModels while maintaining backward compatibility with
/// existing widgets and tests.
///
/// Responsibilities are delegated to:
/// - [MainScreenKeys]: All GlobalKeys (zero logic)
/// - [MainScreenNavViewModel]: Navigation, pages, tabs, demo mode
/// - [MainScreenTourViewModel]: App tour, targets, dialogs, tutorial flows
class MainScreenViewModel extends BaseModel {
  /// Constructs MainScreenViewModel with optional dependencies for testing.
  factory MainScreenViewModel() {
    final keys = MainScreenKeys();
    final navViewModel = MainScreenNavViewModel(keys: keys);
    final tourViewModel = MainScreenTourViewModel(
      keys: keys,
      onTabTapped: navViewModel.onTabTapped,
    );
    final model = MainScreenViewModel._internal(
      keys: keys,
      navViewModel: navViewModel,
      tourViewModel: tourViewModel,
    );

    // Forward notifications from sub-models to parent
    navViewModel.addListener(model.notifyListeners);
    tourViewModel.addListener(model.notifyListeners);

    return model;
  }

  /// Internal constructor for dependency injection (primarily for testing).
  MainScreenViewModel._internal({
    required this.keys,
    required this.navViewModel,
    required this.tourViewModel,
  });

  /// Creates test instance with consistent dependency injection.
  ///
  /// **params**:
  /// * `keysInstance`: Optional MainScreenKeys
  /// * `navInstance`: Optional MainScreenNavViewModel
  /// * `tourInstance`: Optional MainScreenTourViewModel
  ///
  /// **returns**:
  /// * `MainScreenViewModel`: Test instance
  static MainScreenViewModel createForTest({
    MainScreenKeys? keysInstance,
    MainScreenNavViewModel? navInstance,
    MainScreenTourViewModel? tourInstance,
  }) {
    final resolvedKeys = keysInstance ?? MainScreenKeys();
    final resolvedNav =
        navInstance ?? MainScreenNavViewModel(keys: resolvedKeys);
    final resolvedTour = tourInstance ??
        MainScreenTourViewModel(
          keys: resolvedKeys,
          onTabTapped: resolvedNav.onTabTapped,
        );
    return MainScreenViewModel._internal(
      keys: resolvedKeys,
      navViewModel: resolvedNav,
      tourViewModel: resolvedTour,
    );
  }

  /// Instance of MainScreenKeys for GlobalKey access.
  late final MainScreenKeys keys;

  /// Instance of MainScreenNavViewModel for navigation logic.
  late final MainScreenNavViewModel navViewModel;

  /// Instance of MainScreenTourViewModel for tour logic.
  late final MainScreenTourViewModel tourViewModel;

  // Delegated Properties - Navigation
  /// Contains the Widgets to be rendered for corresponding navbar items.
  List<Widget> get pages => navViewModel.pages;

  /// Actual navbar items.
  List<BottomNavigationBarItem> get navBarItems => navViewModel.navBarItems;

  /// Current page index.
  int get currentPageIndex => navViewModel.currentPageIndex;

  // Delegated Properties - Tour
  /// Whether to show the app tour.
  bool get showAppTour => tourViewModel.showAppTour;

  /// Whether the tour is complete.
  bool get tourComplete => tourViewModel.tourComplete;

  /// Whether the tour was skipped.
  bool get tourSkipped => tourViewModel.tourSkipped;
  set tourSkipped(bool value) {
    tourViewModel.tourSkipped = value;
    notifyListeners();
  }

  /// Current build context.
  BuildContext get context => tourViewModel.context;

  /// App tour instance.
  AppTour get appTour => tourViewModel.appTour;

  /// Focus targets for current tour step.
  List<FocusTarget> get targets => tourViewModel.targets;

  // Delegated Methods - Initialization & Setup
  /// Initializes the view model.
  ///
  /// **params**:
  /// * `ctx`: BuildContext
  /// * `fromSignUp`: User entry point
  /// * `mainScreenIndex`: Tab index
  /// * `demoMode`: Demo mode flag
  ///
  /// **returns**:
  ///   None
  void initialise(
    BuildContext ctx, {
    required bool fromSignUp,
    required int mainScreenIndex,
    bool demoMode = false,
  }) {
    // Set demo mode in app config
    appConfig.isDemoMode = demoMode;

    // Set initial page index
    navViewModel.currentPageIndex = mainScreenIndex;

    // Initialize tour
    tourViewModel.initializeTour(
      ctx,
      fromSignUp: fromSignUp,
      demoMode: demoMode,
      scaffoldKey: keys.scaffoldKey,
      mainScreenModel: this,
    );

    notifyListeners();
  }

  /// Sets up navigation items.
  ///
  /// **params**:
  /// * `context`: BuildContext
  ///
  /// **returns**:
  ///   None
  void setupNavigationItems(BuildContext context) {
    navViewModel.setupNavigationItems(
      context,
      isDemoMode: appConfig.isDemoMode,
      homeModel: this,
    );
  }

  // Delegated Methods - Navigation
  /// Handles click on tab.
  ///
  /// **params**:
  /// * `index`: Tab index
  ///
  /// **returns**:
  ///   None
  void onTabTapped(int index) {
    navViewModel.onTabTapped(index);
    notifyListeners();
  }

  /// Exits demo mode.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void exitDemoMode() {
    navViewModel.exitDemoMode();
  }

  // Delegated Methods - Tour
  /// Builds AppTourDialog.
  ///
  /// **params**:
  /// * `ctx`: BuildContext
  ///
  /// **returns**:
  /// * `Widget`: Dialog widget
  Widget appTourDialog(BuildContext ctx) {
    return tourViewModel.appTourDialog(ctx, keys.scaffoldKey);
  }

  /// Starts home tour.
  ///
  /// **params**:
  /// * `givenUserConfig`: Mock config for testing
  ///
  /// **returns**:
  ///   None
  void tourHomeTargets([UserConfig? givenUserConfig]) {
    tourViewModel.tourHomeTargets(keys.scaffoldKey, givenUserConfig);
  }

  /// Handles home tour clicks.
  ///
  /// **params**:
  /// * `clickedTarget`: Clicked target
  ///
  /// **returns**:
  ///   None
  Future<void> showHome(TargetFocus clickedTarget) {
    return tourViewModel.showHome(clickedTarget, keys.scaffoldKey);
  }

  /// Shows events tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourEventTargets() {
    tourViewModel.tourEventTargets();
  }

  /// Shows add post tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourAddPost() {
    tourViewModel.tourAddPost();
  }

  /// Shows chat tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourChat() {
    tourViewModel.tourChat();
  }

  /// Shows profile tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourProfile() {
    tourViewModel.tourProfile();
  }

  @override
  void dispose() {
    // Remove listeners before disposing sub-models
    navViewModel.removeListener(notifyListeners);
    tourViewModel.removeListener(notifyListeners);

    // Dispose sub-models
    navViewModel.dispose();
    tourViewModel.dispose();

    super.dispose();
  }
}

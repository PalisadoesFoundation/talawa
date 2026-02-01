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
  ///
  /// **params**:
  /// * `keysInstance`: Optional MainScreenKeys instance (for testing)
  /// * `navInstance`: Optional MainScreenNavViewModel instance (for testing)
  /// * `tourInstance`: Optional MainScreenTourViewModel instance (for testing)
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

  /// Test constructor that allows dependency injection without listener wiring.
  /// Use this for testing to avoid automatic listener forwarding.
  MainScreenViewModel.test({
    MainScreenKeys? keysInstance,
    MainScreenNavViewModel? navInstance,
    MainScreenTourViewModel? tourInstance,
  })  : keys = keysInstance ?? MainScreenKeys(),
        navViewModel = navInstance ??
            MainScreenNavViewModel(keys: keysInstance ?? MainScreenKeys()),
        tourViewModel = tourInstance ??
            MainScreenTourViewModel(
              keys: keysInstance ?? MainScreenKeys(),
              onTabTapped: (navInstance ??
                      MainScreenNavViewModel(
                          keys: keysInstance ?? MainScreenKeys()))
                  .onTabTapped,
            );

  /// Instance of MainScreenKeys for GlobalKey access.
  late final MainScreenKeys keys;

  /// Instance of MainScreenNavViewModel for navigation logic.
  late final MainScreenNavViewModel navViewModel;

  /// Instance of MainScreenTourViewModel for tour logic.
  late final MainScreenTourViewModel tourViewModel;

  // ==========================================================================
  // Delegated Properties - Navigation
  // ==========================================================================

  /// Contains the Widgets to be rendered for corresponding navbar items.
  List<Widget> get pages => navViewModel.pages;

  /// Actual [BottomNavigationBarItem]s that show up on the screen.
  List<BottomNavigationBarItem> get navBarItems => navViewModel.navBarItems;

  /// Current page index in the bottom navigation.
  int get currentPageIndex => navViewModel.currentPageIndex;

  // ==========================================================================
  // Delegated Properties - Tour
  // ==========================================================================

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

  /// List of focus targets for the current tour step.
  List<FocusTarget> get targets => tourViewModel.targets;

  // ==========================================================================
  // Delegated Methods - Initialization & Setup
  // ==========================================================================

  /// Initializes the view model.
  ///
  /// **params**:
  /// * `ctx`: BuildContext
  /// * `fromSignUp`: Bool to find user entry
  /// * `mainScreenIndex`: Index to find tab on mainScreen
  /// * `demoMode`: Whether the app is in demo mode
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

  /// Dynamically adds [BottomNavigationBarItems] in `BottomNavigationBar`.
  ///
  /// **params**:
  /// * `context`: BuildContext for localization
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

  // ==========================================================================
  // Delegated Methods - Navigation
  // ==========================================================================

  /// Handles click on [BottomNavigationBarItem].
  ///
  /// **params**:
  /// * `index`: Index of the tapped tab
  ///
  /// **returns**:
  ///   None
  void onTabTapped(int index) {
    navViewModel.onTabTapped(index);
    notifyListeners();
  }

  /// Exits demo mode and navigates to the splash screen.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void exitDemoMode() {
    navViewModel.exitDemoMode();
  }

  // ==========================================================================
  // Delegated Methods - Tour
  // ==========================================================================

  /// Builds and returns an AppTourDialog.
  ///
  /// **params**:
  /// * `ctx`: The build context to work with
  ///
  /// **returns**:
  /// * `Widget`: The built [Dialog]
  Widget appTourDialog(BuildContext ctx) {
    return tourViewModel.appTourDialog(ctx, keys.scaffoldKey);
  }

  /// Starts the home tour with focus targets.
  ///
  /// **params**:
  /// * `givenUserConfig`: Mock user config for testing
  ///
  /// **returns**:
  ///   None
  void tourHomeTargets([UserConfig? givenUserConfig]) {
    tourViewModel.tourHomeTargets(keys.scaffoldKey, givenUserConfig);
  }

  /// Handles clicks during home tour.
  ///
  /// **params**:
  /// * `clickedTarget`: The clicked target
  ///
  /// **returns**:
  ///   None
  Future<void> showHome(TargetFocus clickedTarget) {
    return tourViewModel.showHome(clickedTarget, keys.scaffoldKey);
  }

  /// Shows the events tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourEventTargets() {
    tourViewModel.tourEventTargets();
  }

  /// Shows the add post tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourAddPost() {
    tourViewModel.tourAddPost();
  }

  /// Shows the chat tour.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourChat() {
    tourViewModel.tourChat();
  }

  /// Shows the profile tour.
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

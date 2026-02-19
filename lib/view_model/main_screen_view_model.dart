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

/// Coordinator ViewModel for MainScreen.
/// 
/// Delegates responsibilities to:
/// - [MainScreenKeys]: All GlobalKeys
/// - [MainScreenNavViewModel]: Navigation, pages, tabs, demo mode
/// - [MainScreenTourViewModel]: App tour, targets, dialogs
class MainScreenViewModel extends BaseModel {
  /// Factory constructor for normal usage
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

    // Forward notifications from sub-models
    navViewModel.addListener(model.notifyListeners);
    tourViewModel.addListener(model.notifyListeners);

    return model;
  }

  /// Internal constructor for dependency injection/testing
  MainScreenViewModel._internal({
    required this.keys,
    required this.navViewModel,
    required this.tourViewModel,
  });

  /// Factory for creating test instances
  factory MainScreenViewModel.createForTest({
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

    final model = MainScreenViewModel._internal(
      keys: resolvedKeys,
      navViewModel: resolvedNav,
      tourViewModel: resolvedTour,
    );

    resolvedNav.addListener(model.notifyListeners);
    resolvedTour.addListener(model.notifyListeners);

    return model;
  }

  /// ------------------- Dependencies -------------------

  final MainScreenKeys keys;
  final MainScreenNavViewModel navViewModel;
  final MainScreenTourViewModel tourViewModel;

  /// ------------------- Delegated Properties -------------------

  // Navigation
  List<Widget> get pages => navViewModel.pages;
  List<BottomNavigationBarItem> get navBarItems => navViewModel.navBarItems;
  int get currentPageIndex => navViewModel.currentPageIndex;

  // Tour
  bool get showAppTour => tourViewModel.showAppTour;
  bool get tourComplete => tourViewModel.tourComplete;
  bool get tourSkipped => tourViewModel.tourSkipped;
  set tourSkipped(bool value) {
    tourViewModel.tourSkipped = value;
    notifyListeners();
  }

  BuildContext get context => tourViewModel.context;
  AppTour get appTour => tourViewModel.appTour;
  List<FocusTarget> get targets => tourViewModel.targets;

  /// ------------------- Initialization -------------------

  void initialise(
    BuildContext ctx, {
    required bool fromSignUp,
    required int mainScreenIndex,
    bool demoMode = false,
  }) {
    appConfig.isDemoMode = demoMode;
    navViewModel.currentPageIndex = mainScreenIndex;

    tourViewModel.initializeTour(
      ctx,
      fromSignUp: fromSignUp,
      demoMode: demoMode,
      scaffoldKey: keys.scaffoldKey,
      mainScreenModel: this,
    );

    notifyListeners();
  }

  void setupNavigationItems(BuildContext context) {
    navViewModel.setupNavigationItems(
      context,
      isDemoMode: appConfig.isDemoMode,
      homeModel: this,
    );
  }

  /// ------------------- Navigation Delegates -------------------

  void onTabTapped(int index) => navViewModel.onTabTapped(index);
  void exitDemoMode() => navViewModel.exitDemoMode();

  /// ------------------- Tour Delegates -------------------

  Widget appTourDialog(BuildContext ctx) =>
      tourViewModel.appTourDialog(ctx, keys.scaffoldKey);

  void tourHomeTargets([UserConfig? givenUserConfig]) =>
      tourViewModel.tourHomeTargets(keys.scaffoldKey, givenUserConfig);

  Future<void> showHome(TargetFocus clickedTarget) =>
      tourViewModel.showHome(clickedTarget, keys.scaffoldKey);

  void tourEventTargets() => tourViewModel.tourEventTargets();
  void tourAddPost() => tourViewModel.tourAddPost();
  void tourChat() => tourViewModel.tourChat();
  void tourProfile() => tourViewModel.tourProfile();

  /// ------------------- Lifecycle -------------------

  @override
  void dispose() {
    navViewModel.removeListener(notifyListeners);
    tourViewModel.removeListener(notifyListeners);

    navViewModel.dispose();
    tourViewModel.dispose();

    super.dispose();
  }
}

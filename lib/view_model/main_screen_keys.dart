import 'package:flutter/material.dart';

/// Central registry of all GlobalKeys used across MainScreen and its components.
///
/// This class contains zero logic and serves as a pure data holder for UI keys.
/// Separating keys from ViewModels improves testability and makes it easier
/// to mock UI bindings in tests.
class MainScreenKeys {
  /// Scaffold key for the main screen.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Home Tab Keys
  /// Key for home bottom navigation button.
  final GlobalKey keyBNHome = GlobalKey(debugLabel: "HomeTab");

  /// Key for demo home bottom navigation button.
  final GlobalKey keyBNDemoHome = GlobalKey(debugLabel: "DemoHomeTab");

  /// Key for pinned post on home screen.
  final GlobalKey keySHPinnedPost =
      GlobalKey(debugLabel: "HomeScreenPinnedPost");

  /// Key for post on home screen.
  final GlobalKey keySHPost = GlobalKey(debugLabel: "HomeScreenPost");

  /// Key for organization name on home screen.
  final GlobalKey keySHOrgName = GlobalKey(debugLabel: "HomeScreenOrgName");

  /// Key for menu icon on home screen.
  final GlobalKey keySHMenuIcon = GlobalKey(debugLabel: "HomeScreenMenuIcon");

  // Drawer Keys
  /// Key for current organization in drawer.
  final GlobalKey keyDrawerCurOrg = GlobalKey(debugLabel: "DrawerCurrentOrg");

  /// Key for switchable organization in drawer.
  final GlobalKey keyDrawerSwitchableOrg =
      GlobalKey(debugLabel: "DrawerSwitchableOrg");

  /// Key for join organization button in drawer.
  final GlobalKey keyDrawerJoinOrg = GlobalKey(debugLabel: "DrawerJoinOrg");

  /// Key for leave current organization button in drawer.
  final GlobalKey keyDrawerLeaveCurrentOrg =
      GlobalKey(debugLabel: "DrawerLeaveCurrentOr");

  // Events Tab Keys
  /// Key for events bottom navigation button.
  final GlobalKey keyBNEvents = GlobalKey(debugLabel: "EventTab");

  /// Key for demo events bottom navigation button.
  final GlobalKey keyBNDemoEvents = GlobalKey(debugLabel: "DemoEventTab");

  /// Key for category menu on events screen.
  final GlobalKey keySECategoryMenu =
      GlobalKey(debugLabel: "EventScreenCategory");

  /// Key for date filter on events screen.
  final GlobalKey keySEDateFilter =
      GlobalKey(debugLabel: "EventScreenDateFilter");

  /// Key for add button on events screen.
  final GlobalKey keySEAdd = GlobalKey(debugLabel: "EventScreenAdd");

  /// Key for event card on events screen.
  final GlobalKey keySECard = GlobalKey(debugLabel: "EventScreenCard");

  // Post Tab Keys
  /// Key for post bottom navigation button.
  final GlobalKey keyBNPost = GlobalKey(debugLabel: "PostTab");

  /// Key for demo post bottom navigation button.
  final GlobalKey keyBNDemoPost = GlobalKey(debugLabel: "DemoPostTab");

  // Chat Tab Keys
  /// Key for chat bottom navigation button.
  final GlobalKey keyBNChat = GlobalKey(debugLabel: "ChatTab");

  // Profile Tab Keys
  /// Key for profile bottom navigation button.
  final GlobalKey keyBNProfile = GlobalKey(debugLabel: "ProfileTab");

  /// Key for demo profile bottom navigation button.
  final GlobalKey keyBNDemoProfile = GlobalKey(debugLabel: "DemoProfileTab");

  /// Key for edit profile on profile screen.
  final GlobalKey keySPEditProfile = GlobalKey(debugLabel: "ProfileScreenEdit");

  /// Key for app settings on profile screen.
  final GlobalKey keySPAppSetting =
      GlobalKey(debugLabel: "ProfileScreenAppSetting");

  /// Key for help on profile screen.
  final GlobalKey keySPHelp = GlobalKey(debugLabel: "ProfileScreenHelp");

  /// Key for donate us on profile screen.
  final GlobalKey keySPDonateUs =
      GlobalKey(debugLabel: "ProfileScreenDonateUs");

  /// Key for invite on profile screen.
  final GlobalKey keySPInvite = GlobalKey(debugLabel: "ProfileScreenInvite");

  /// Key for logout on profile screen.
  final GlobalKey keySPLogout = GlobalKey(debugLabel: "ProfileScreenLogout");

  /// Key for Palisadoes on profile screen.
  final GlobalKey keySPPalisadoes =
      GlobalKey(debugLabel: "ProfileScreenPalisadoes");

  // Funds Tab Keys
  /// Key for funds bottom navigation button.
  final GlobalKey keyBNFunds = GlobalKey(debugLabel: "FundsTab");
}

import 'package:flutter/material.dart';

/// Central registry of all GlobalKeys used across MainScreen and its components.
///
/// This class contains zero logic and serves as a pure data holder for UI keys.
/// Separating keys from ViewModels improves testability and makes it easier
/// to mock UI bindings in tests.
class MainScreenKeys {
  /// Scaffold key for the main screen.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // ------------------ Home Tab ------------------
  final GlobalKey keyBNHome = GlobalKey(debugLabel: "HomeTab");
  final GlobalKey keyBNDemoHome = GlobalKey(debugLabel: "DemoHomeTab");
  final GlobalKey keySHPinnedPost = GlobalKey(debugLabel: "HomeScreenPinnedPost");
  final GlobalKey keySHPost = GlobalKey(debugLabel: "HomeScreenPost");
  final GlobalKey keySHOrgName = GlobalKey(debugLabel: "HomeScreenOrgName");
  final GlobalKey keySHMenuIcon = GlobalKey(debugLabel: "HomeScreenMenuIcon");

  // ------------------ Drawer ------------------
  final GlobalKey keyDrawerCurOrg = GlobalKey(debugLabel: "DrawerCurrentOrg");
  final GlobalKey keyDrawerSwitchableOrg = GlobalKey(debugLabel: "DrawerSwitchableOrg");
  final GlobalKey keyDrawerJoinOrg = GlobalKey(debugLabel: "DrawerJoinOrg");
  final GlobalKey keyDrawerLeaveCurrentOrg = GlobalKey(debugLabel: "DrawerLeaveCurrentOrg");

  // ------------------ Events Tab ------------------
  final GlobalKey keyBNEvents = GlobalKey(debugLabel: "EventTab");
  final GlobalKey keyBNDemoEvents = GlobalKey(debugLabel: "DemoEventTab");
  final GlobalKey keySECategoryMenu = GlobalKey(debugLabel: "EventScreenCategory");
  final GlobalKey keySEDateFilter = GlobalKey(debugLabel: "EventScreenDateFilter");
  final GlobalKey keySEAdd = GlobalKey(debugLabel: "EventScreenAdd");
  final GlobalKey keySECard = GlobalKey(debugLabel: "EventScreenCard");

  // ------------------ Post Tab ------------------
  final GlobalKey keyBNPost = GlobalKey(debugLabel: "PostTab");
  final GlobalKey keyBNDemoPost = GlobalKey(debugLabel: "DemoPostTab");

  // ------------------ Chat Tab ------------------
  final GlobalKey keyBNChat = GlobalKey(debugLabel: "ChatTab");

  // ------------------ Profile Tab ------------------
  final GlobalKey keyBNProfile = GlobalKey(debugLabel: "ProfileTab");
  final GlobalKey keyBNDemoProfile = GlobalKey(debugLabel: "DemoProfileTab");
  final GlobalKey keySPEditProfile = GlobalKey(debugLabel: "ProfileScreenEdit");
  final GlobalKey keySPAppSetting = GlobalKey(debugLabel: "ProfileScreenAppSetting");
  final GlobalKey keySPHelp = GlobalKey(debugLabel: "ProfileScreenHelp");
  final GlobalKey keySPDonateUs = GlobalKey(debugLabel: "ProfileScreenDonateUs");
  final GlobalKey keySPInvite = GlobalKey(debugLabel: "ProfileScreenInvite");
  final GlobalKey keySPLogout = GlobalKey(debugLabel: "ProfileScreenLogout");
  final GlobalKey keySPPalisadoes = GlobalKey(debugLabel: "ProfileScreenPalisadoes");

  // ------------------ Funds Tab ------------------
  final GlobalKey keyBNFunds = GlobalKey(debugLabel: "FundsTab");
}
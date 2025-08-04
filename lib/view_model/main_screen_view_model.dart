import 'dart:async';

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/views/demo_screens/organization_feed_demo.dart';
import 'package:talawa/views/demo_screens/profile_page_demo.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// MainScreenViewModel class provide methods to interact with the modal to serve data in user's action in Main Screen Views.
///
/// The functions in this class are
/// mainly in the context of Tutorials for different componenets of the App.
///
/// Functions include:
/// * `showTutorial`
/// * `showHome`
/// * `tourEventTargets`
/// * `tourAddPost`
/// * `tourChat`
/// * `tourProfile`
class MainScreenViewModel extends BaseModel {
  /// static variables.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// static variables.
  final GlobalKey keyBNHome = GlobalKey(debugLabel: "HomeTab");

  /// static variables.
  final GlobalKey keyBNDemoHome = GlobalKey(debugLabel: "DemoHomeTab");

  /// static variables.
  final GlobalKey keySHPinnedPost =
      GlobalKey(debugLabel: "HomeScreenPinnedPost");

  /// static variables.
  final GlobalKey keySHPost = GlobalKey(debugLabel: "HomeScreenPost");

  /// static variables.
  final GlobalKey keySHOrgName = GlobalKey(debugLabel: "HomeScreenOrgName");

  /// static variables.
  final GlobalKey keySHMenuIcon = GlobalKey(debugLabel: "HomeScreenMenuIcon");

  /// static variables.
  final GlobalKey keyDrawerCurOrg = GlobalKey(debugLabel: "DrawerCurrentOrg");

  /// static variables.
  final GlobalKey keyDrawerSwitchableOrg =
      GlobalKey(debugLabel: "DrawerSwitchableOrg");

  /// static variables.
  final GlobalKey keyDrawerJoinOrg = GlobalKey(debugLabel: "DrawerJoinOrg");

  /// static variables.
  final GlobalKey keyDrawerLeaveCurrentOrg =
      GlobalKey(debugLabel: "DrawerLeaveCurrentOr");

  /// static variables.
  final GlobalKey keyBNEvents = GlobalKey(debugLabel: "EventTab");

  /// static variables.
  final GlobalKey keyBNDemoEvents = GlobalKey(debugLabel: "DemoEventTab");

  /// static variables.
  final GlobalKey keySECategoryMenu =
      GlobalKey(debugLabel: "EventScreenCategory");

  /// static variables.
  final GlobalKey keySEDateFilter =
      GlobalKey(debugLabel: "EventScreenDateFilter");

  /// static variables.
  final GlobalKey keySEAdd = GlobalKey(debugLabel: "EventScreenAdd");

  /// static variables.
  final GlobalKey keySECard = GlobalKey(debugLabel: "EventScreenCard");

  /// static variables.
  final GlobalKey keyBNPost = GlobalKey(debugLabel: "PostTab");

  /// static variables.
  final GlobalKey keyBNDemoPost = GlobalKey(debugLabel: "DemoPostTab");

  /// static variables.
  final GlobalKey keyBNChat = GlobalKey(debugLabel: "ChatTab");

  /// static variables.
  final GlobalKey keyBNProfile = GlobalKey(debugLabel: "ProfileTab");

  /// static variables.
  final GlobalKey keyBNDemoProfile = GlobalKey(debugLabel: "DemoProfileTab");

  /// static variables.
  final GlobalKey keySPEditProfile = GlobalKey(debugLabel: "ProfileScreenEdit");

  /// static variables.
  final GlobalKey keySPAppSetting =
      GlobalKey(debugLabel: "ProfileScreenAppSetting");

  /// static variables.
  final GlobalKey keySPHelp = GlobalKey(debugLabel: "ProfileScreenHelp");

  /// static variables.
  final GlobalKey keySPDonateUs =
      GlobalKey(debugLabel: "ProfileScreenDonateUs");

  /// static variables.
  final GlobalKey keySPInvite = GlobalKey(debugLabel: "ProfileScreenInvite");

  /// static variables.
  final GlobalKey keySPLogout = GlobalKey(debugLabel: "ProfileScreenLogout");

  /// static variables.
  final GlobalKey keySPPalisadoes =
      GlobalKey(debugLabel: "ProfileScreenPalisadoes");

  /// bool to determine if we wanna show the apptour.
  late bool showAppTour;

  /// bool to determine if apptour is complete.
  bool tourComplete = false;

  /// bool to determine if apptour is skipped.
  bool tourSkipped = false;

  /// context consist of parent info.
  late BuildContext context;

  /// tutorialCoachMark consist of coach used to give tutorial.
  late AppTour appTour = AppTour(model: this);

  /// array of target.
  final List<FocusTarget> targets = [];

  /// flag to represent if app is in demoMode.
  static bool demoMode = false;

  /// Initalizing function.
  ///
  /// **params**:
  /// * `ctx`: BuildContext, contain parent info
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
    MainScreenViewModel.demoMode = demoMode;
    currentPageIndex = mainScreenIndex;
    showAppTour = fromSignUp || demoMode;
    context = ctx;
    final appTourDialogWidget = appTourDialog(ctx);

    notifyListeners();
    if (!showAppTour) {
      tourComplete = true;
      tourSkipped = false;
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () => navigationService.pushDialog(
          appTourDialogWidget,
        ),
      );
    }
  }

  /// Contains the Widgets to be rendered for corresponding navbar items.
  List<Widget> pages = [];

  /// Actual [BottomNavigationBarItem]s that show up on the screen.
  List<BottomNavigationBarItem> navBarItems = [];

  /// Dynamically adds [BottomNavigationBarItems] in `BottomNavigationBar`.
  ///
  /// by mapping over the data received from the server.
  ///
  /// **params**:
  /// * `context`: its the same context you use everywhere in the flutter framework refer flutter docs for more info.
  ///
  /// **returns**:
  ///   None
  void setupNavigationItems(
    BuildContext context,
  ) {
    navBarItems = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          key: keyBNHome,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.event_note,
          key: keyBNEvents,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Events'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_outlined,
          key: keyBNChat,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Chat'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.account_circle,
          key: keyBNProfile,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Profile'),
      ),
    ];

    if (!demoMode) {
      pages = [
        OrganizationFeed(
          key: const Key("HomeView"),
          homeModel: this,
        ),
        ExploreEvents(
          key: const Key('ExploreEvents'),
          homeModel: this,
        ),
        // AddPost(
        //   key: const Key('AddPost'),
        //   drawerKey: MainScreenViewModel.scaffoldKey,
        // ),
        const ChatPage(
          key: Key('Chats'),
        ),
        ProfilePage(
          key: keySPEditProfile,
          homeModel: this,
        ),
      ];
    } else {
      pages = [
        DemoOrganizationFeed(
          key: const Key("DemoHomeView"),
          homeModel: this,
        ),
        DemoExploreEvents(
          key: const Key('DemoExploreEvents'),
          homeModel: this,
        ),
        const ChatPage(
          key: Key('DemoChats'),
        ),
        DemoProfilePage(
          key: const Key('DemoProfile'),
          homeModel: this,
        ),
      ];
    }
  }

  /// var for current page in index.
  int currentPageIndex = 0;

  /// Handles click on [BottomNavigationBarItem].
  ///
  /// **params**:
  /// * `index`: it is track of current page index.
  ///
  /// **returns**:
  ///   None
  void onTabTapped(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  /// Builds and returns an AppTourDialog.
  ///
  /// **params**:
  /// * `ctx`: The build context to work with.
  ///
  /// **returns**:
  /// * `Widget`: The built [Dialog]
  Widget appTourDialog(BuildContext ctx) {
    return CustomAlertDialog(
      dialogTitle: 'App Tour',
      dialogSubTitle: 'Start app tour to know talawa functioning',
      successText: 'Start',
      secondaryButtonText: 'Skip',
      success: () {
        navigationService.pop();
        if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
          scaffoldKey.currentState?.closeDrawer();
        }
        tourHomeTargets();
      },
      secondaryButtonTap: () {
        tourComplete = false;
        tourSkipped = true;
        navigationService.pop();
        notifyListeners();
      },
    );
  }

  /// Starts the tour and info to be displayed is mentioned in this functions.
  ///
  /// **params**:
  /// * `givenUserConfig`: Mock user config that helps in testing.
  ///
  /// **returns**:
  ///   None
  void tourHomeTargets([UserConfig? givenUserConfig]) {
    final UserConfig localUserConfig = givenUserConfig ?? userConfig;
    targets.clear();
    targets.add(
      FocusTarget(
        key: keySHOrgName,
        keyName: 'keySHOrgName',
        description: 'Current selected Organization Name',
        appTour: appTour,
      ),
    );
    targets.add(
      FocusTarget(
        key: keySHMenuIcon,
        keyName: 'keySHMenuIcon',
        description:
            'Click this button to see options related to switching, joining and leaving organization(s)',
        isCircle: true,
        next: () => scaffoldKey.currentState!.openDrawer(),
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keyDrawerCurOrg,
        keyName: 'keyDrawerCurOrg',
        description: "Current selected Organization's Name appears here",
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keyDrawerSwitchableOrg,
        keyName: 'keyDrawerSwitchableOrg',
        description:
            "All your joined organizations appear over here you can click on them to change the current organization",
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keyDrawerJoinOrg,
        keyName: 'keyDrawerJoinOrg',
        description: "From this button you can join other listed organizations",
        appTour: appTour,
        align: ContentAlign.top,
        next: () {
          if (!localUserConfig.loggedIn) {
            navigationService.pop();
          }
        },
      ),
    );

    if (localUserConfig.loggedIn) {
      targets.add(
        FocusTarget(
          key: keyDrawerLeaveCurrentOrg,
          keyName: 'keyDrawerLeaveCurrentOrg',
          description:
              "To leave the current organization you can use this option",
          align: ContentAlign.top,
          next: () => navigationService.pop(),
          appTour: appTour,
        ),
      );
    }

    targets.add(
      FocusTarget(
        key: keyBNHome,
        keyName: 'keyBNHome',
        description:
            "This is the home tab here you can see the latest post from other members of the current organization",
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySHPinnedPost,
        keyName: 'keySHPinnedPost',
        description:
            "This section displays all the important post set by the organization admin(s)",
        align: ContentAlign.bottom,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySHPost,
        keyName: 'keySHPost',
        description:
            "This is the post card you can like and comment on the post from the options available",
        align: ContentAlign.bottom,
        appTour: appTour,
      ),
    );
    appTour.showTutorial(
      onClickTarget: showHome,
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourEventTargets();
        }
      },
      targets: targets,
    );
  }

  /// This function shows the Home screen.
  ///
  /// **params**:
  /// * `clickedTarget`: object to identify clickedTarget.
  ///
  /// **returns**:
  ///   None
  Future<void> showHome(TargetFocus clickedTarget) async {
    switch (clickedTarget.identify) {
      case "keySHMenuIcon":
        scaffoldKey.currentState!.openDrawer();
        break;
      case "keyDrawerLeaveCurrentOrg":
        navigationService.pop();
        break;
      case "keyBNHome":
        // Close drawer when moving to bottom navigation tour
        if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
          scaffoldKey.currentState?.closeDrawer();
          // Add a small delay to let the drawer close animation complete
          await Future.delayed(const Duration(milliseconds: 300));
        }
        break;
    }
  }

  /// This function show the tutorial for Events.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourEventTargets() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keyBNEvents,
        keyName: 'keyBNEvents',
        description:
            'This is the Events tab here you can see all event related information of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySECategoryMenu,
        keyName: 'keySECategoryMenu',
        description: 'Filter Events based on categories',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySEDateFilter,
        keyName: 'keySEDateFilter',
        description: 'Filter Events between selected dates',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySECard,
        keyName: 'keySECard',
        description:
            'Description of event to see more details click on the card',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySEAdd,
        keyName: 'keySEAdd',
        description: 'You can create a new event from here',
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );

    appTour.showTutorial(
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourChat();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// This function show the tutorial to add Post in the organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourAddPost() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keyBNPost,
        keyName: 'keyBNPost',
        description:
            'This is the Create post tab here you can add post to the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );
    appTour.showTutorial(
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourChat();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// This function show the tour of chats.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourChat() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keyBNChat,
        keyName: 'keyBNChat',
        description:
            'This is the Chat tab here you can see all your messages of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
        appTour: appTour,
      ),
    );
    appTour.showTutorial(
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourProfile();
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }

  /// This function show the tutorial for the profile page.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourProfile() {
    targets.clear();
    targets.add(
      FocusTarget(
        key: keyBNProfile,
        keyName: 'keyBNProfile',
        description:
            'This is the Profile tab here you can see all options related to account, app setting, invitation, help etc',
        isCircle: true,
        align: ContentAlign.top,
        nextCrossAlign: CrossAxisAlignment.start,
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySPAppSetting,
        keyName: 'keySPAppSetting',
        description:
            'You can edit application settings like language, theme etc from here',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySPHelp,
        keyName: 'keySPHelp',
        description:
            'For any help we are always there. You can reach us from here',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySPDonateUs,
        keyName: 'keySPDonateUs',
        description:
            'To help your organization grow you can support them financially from here',
        appTour: appTour,
      ),
    );

    targets.add(
      FocusTarget(
        key: keySPPalisadoes,
        keyName: 'keySPPalisadoes',
        description: 'You are all set to go lets get you in',
        isEnd: true,
        appTour: appTour,
      ),
    );

    appTour.showTutorial(
      onFinish: () {
        if (!tourComplete && !tourSkipped) {
          tourComplete = true;
          onTabTapped(0);
        }
      },
      onClickTarget: (TargetFocus a) {},
      targets: targets,
    );
  }
}

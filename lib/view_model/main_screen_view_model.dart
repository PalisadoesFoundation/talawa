import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/app_tour.dart';
import 'package:talawa/plugins/fetch_plugin_list.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
// import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/views/demo_screens/organization_feed_demo.dart';
import 'package:talawa/views/demo_screens/profile_page_demo.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/theme_switch.dart';
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
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

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
  static final GlobalKey keyDrawerCurOrg =
      GlobalKey(debugLabel: "DrawerCurrentOrg");

  /// static variables.
  static final GlobalKey keyDrawerSwitchableOrg =
      GlobalKey(debugLabel: "DrawerSwitchableOrg");

  /// static variables.
  static final GlobalKey keyDrawerJoinOrg =
      GlobalKey(debugLabel: "DrawerJoinOrg");

  /// static variables.
  static final GlobalKey keyDrawerLeaveCurrentOrg =
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
  bool demoMode = false;

  /// flag to represent if app is in testMode.
  bool testMode = false;

  /// Initalizing function.
  ///
  /// **params**:
  /// * `ctx`: BuildContext, contain parent info
  /// * `fromSignUp`: Bool to find user entry
  /// * `mainScreenIndex`: Index to find tab on mainScreen
  ///
  /// **returns**:
  ///   None
  void initialise(
    BuildContext ctx, {
    required bool fromSignUp,
    required int mainScreenIndex,
    bool demoMode = false,
    bool testMode = false,
  }) {
    this.testMode = testMode;
    this.demoMode = demoMode;
    currentPageIndex = mainScreenIndex;
    showAppTour = fromSignUp || demoMode;
    context = ctx;

    print(ctx);
    print(context);
    pluginPrototypeData = {
      "Donation": {
        "icon": Icons.attach_money_outlined,
        "page": const ChangeThemeTile(),
      },
    };

    notifyListeners();
    if (!showAppTour) {
      tourComplete = true;
      tourSkipped = false;
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () => navigationService.pushDialog(
          appTourDialog(ctx),
        ),
      );
    }
  }

  /// Contains the Widgets to be rendered for corresponding navbar items.
  ///
  /// Features that should be implemented as plugins should be kept here.
  List<StatelessWidget> pages = [];

  /// Actual [BottomNavigationBarItem]s that show up on the screen.
  List<BottomNavigationBarItem> navBarItems = [];

  /// Maps the feature names with their proper Icon and Page.
  ///
  /// `icon` contains the [IconData] corresponding to plugin's icon.
  /// `page` contains the corresponding page to be displayed.
  /// Name of the feature provided by the admin must [exactly] match with the.
  /// name stored here.
  Map<dynamic, dynamic> pluginPrototypeData = {};

  /// list of all the pluginList.
  List<dynamic> pluginList = [];

  /// Dynamically adds [BottomNavigationBarItems] in `BottomNavigationBar`.
  ///
  /// by mapping over the data received from the server.
  ///
  /// **params**:
  /// * `context`: its the same context you use everywhere in the flutter framework refer flutter docs for more info.
  ///
  /// **returns**:
  ///   None
  void fetchAndAddPlugins(
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

      /// Makes chat inaccessible for the user
      //TODO: add chat functionality
      // BottomNavigationBarItem(
      //   icon: Icon(
      //     Icons.chat_outlined,
      //     key: keyBNChat,
      //   ),
      //   label: AppLocalizations.of(context)!.strictTranslate('Chat'),
      // ),
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
        // const ChatPage(
        //   key: Key('Chats'),
        // ),
        ProfilePage(
          key: keySPEditProfile,
          homeModel: this,
        ),
      ];
      pluginList =
          (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

      print(pluginPrototypeData);
      pluginList.forEach((plugin) {
        if (pluginPrototypeData.containsKey(
              (plugin as Map<String, dynamic>)["pluginName"] as String,
            ) &&
            plugin["pluginInstallStatus"] as bool) {
          navBarItems.add(
            BottomNavigationBarItem(
              icon: Icon(
                (pluginPrototypeData[plugin["pluginName"]]
                    as Map<String, dynamic>)["icon"] as IconData,
              ),
              label: AppLocalizations.of(context)!.strictTranslate(
                plugin["pluginName"] as String,
              ),
            ),
          );
          pages.add(
            (pluginPrototypeData[plugin["pluginName"]]
                as Map<String, dynamic>)["class"] as StatelessWidget,
          );
        }
      });

      /// Causes the app check the plugins updates in every 300 sec
      ///
      /// updated and re-render the navbar
      Timer.periodic(Duration(seconds: (testMode ? 1 : 300)), (timer) {
        FetchPluginList();
        final newPluginList =
            (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

        if (listEquals(pluginList, newPluginList)) {
          // notifyListeners();
        }
        if (testMode) timer.cancel();
      });
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
        // DemoAddPost(
        //   key: const Key('DemoAddPost'),
        //   drawerKey: MainScreenViewModel.scaffoldKey,
        // ),
        // const ChatPage(
        //   key: Key('Chats'),
        // ),
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

  Widget appTourDialog(BuildContext ctx) {
    return CustomAlertDialog(
      dialogTitle: 'App Tour',
      dialogSubTitle: 'Start app tour to know talawa functioning',
      successText: 'Start',
      secondaryButtonText: 'Skip',
      success: () {
        navigationService.pop();
        print(MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen);
        if (MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen ??
            false) {
          MainScreenViewModel.scaffoldKey.currentState?.closeDrawer();
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

  /// this functions starts the tour and info to be displayed is mentioned in this functions.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void tourHomeTargets() {
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
          if (!userConfig.loggedIn) {
            navigationService.pop();
          }
        },
      ),
    );

    if (userConfig.loggedIn) {
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
  void showHome(TargetFocus clickedTarget) {
    switch (clickedTarget.identify) {
      case "keySHMenuIcon":
        scaffoldKey.currentState!.openDrawer();
        break;
      case "keyDrawerLeaveCurrentOrg":
        navigationService.pop();
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
          tourProfile();
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
          // tourChat();
          tourProfile();
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

// Uncomment the section below if you want to add the keySPInvite target
// targets.add(
//   FocusTarget(
//     key: keySPInvite,
//     keyName: 'keySPInvite',
//     description: 'Wanna invite colleague, invite them from here',
//   ),
// );

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

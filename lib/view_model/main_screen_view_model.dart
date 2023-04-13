// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/plugins/fetch_plugin_list.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/theme_switch.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// MainScreenViewModel class provide methods to interact with the modal to
/// serve data in user's action in Main Screen Views. The functions in this class are
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
  // getters
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey keyBNHome = GlobalKey(debugLabel: "HomeTab");
  final GlobalKey keySHPinnedPost =
      GlobalKey(debugLabel: "HomeScreenPinnedPost");
  final GlobalKey keySHPost = GlobalKey(debugLabel: "HomeScreenPost");
  final GlobalKey keySHOrgName = GlobalKey(debugLabel: "HomeScreenOrgName");
  final GlobalKey keySHMenuIcon = GlobalKey(debugLabel: "HomeScreenMenuIcon");

  // variables
  static final GlobalKey keyDrawerCurOrg =
      GlobalKey(debugLabel: "DrawerCurrentOrg");
  static final GlobalKey keyDrawerSwitchableOrg =
      GlobalKey(debugLabel: "DrawerSwitchableOrg");
  static final GlobalKey keyDrawerJoinOrg =
      GlobalKey(debugLabel: "DrawerJoinOrg");
  static final GlobalKey keyDrawerLeaveCurrentOrg =
      GlobalKey(debugLabel: "DrawerLeaveCurrentOr");

  final GlobalKey keyBNEvents = GlobalKey(debugLabel: "EventTab");
  final GlobalKey keySECategoryMenu =
      GlobalKey(debugLabel: "EventScreenCategory");
  final GlobalKey keySEDateFilter =
      GlobalKey(debugLabel: "EventScreenDateFilter");
  final GlobalKey keySEAdd = GlobalKey(debugLabel: "EventScreenAdd");
  final GlobalKey keySECard = GlobalKey(debugLabel: "EventScreenCard");

  final GlobalKey keyBNPost = GlobalKey(debugLabel: "PostTab");

  final GlobalKey keyBNChat = GlobalKey(debugLabel: "ChatTab");

  final GlobalKey keyBNProfile = GlobalKey(debugLabel: "ProfileTab");
  final GlobalKey keySPEditProfile = GlobalKey(debugLabel: "ProfileScreenEdit");
  final GlobalKey keySPAppSetting =
      GlobalKey(debugLabel: "ProfileScreenAppSetting");
  final GlobalKey keySPHelp = GlobalKey(debugLabel: "ProfileScreenHelp");
  final GlobalKey keySPDonateUs =
      GlobalKey(debugLabel: "ProfileScreenDonateUs");
  final GlobalKey keySPInvite = GlobalKey(debugLabel: "ProfileScreenInvite");
  final GlobalKey keySPLogout = GlobalKey(debugLabel: "ProfileScreenLogout");
  final GlobalKey keySPPalisadoes =
      GlobalKey(debugLabel: "ProfileScreenPalisadoes");

  late bool showAppTour;
  bool tourComplete = false;
  bool tourSkipped = false;
  late BuildContext context;
  late TutorialCoachMark tutorialCoachMark;
  final List<TargetFocus> targets = [];

  void initialise(
    BuildContext ctx, {
    required bool fromSignUp,
    required int mainScreenIndex,
  }) {
    currentPageIndex = mainScreenIndex;
    showAppTour = fromSignUp;

    pluginPrototypeData = {
      "Donation": {
        "icon": Icons.attach_money_outlined,
        "page": const ChangeThemeTile(),
      }
    };

    notifyListeners();
    if (!showAppTour) {
      tourComplete = true;
      tourSkipped = false;
    } else {
      Future.delayed(
        const Duration(seconds: 1),
        () => navigationService.pushDialog(
          CustomAlertDialog(
            dialogTitle: 'App Tour',
            dialogSubTitle: 'Start app tour to know talawa functioning',
            successText: 'Start',
            secondaryButtonText: 'Skip',
            success: () {
              context = ctx;
              navigationService.pop();
              tourHomeTargets();
            },
            secondaryButtonTap: () {
              tourComplete = false;
              tourSkipped = true;
              notifyListeners();
            },
          ),
        ),
      );
    }
  }

  /// Contains the Widgets to be rendered for corresponding navbar items.
  /// Features that should be implemented as plugins should be kept here.
  List<StatelessWidget> pages = [];

  /// Actual [BottomNavigationBarItem]s that show up on the screen
  List<BottomNavigationBarItem> navBarItems = [];

  /// Maps the feature names with their proper Icon and Page.
  /// `icon` contains the [IconData] corresponding to plugin's icon.
  /// `page` contains the corresponding page to be displayed
  /// Name of the feature provided by the admin must [exactly] match with the
  /// name stored here.
  Map<dynamic, dynamic> pluginPrototypeData = {};

  /// Contains plugin data fetched from the server
  List<dynamic> pluginList = [];

  /// Dynamically adds [BottomNavigationBarItems] in `BottomNavigationBar`
  /// by mapping over the data received from the server.
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
      BottomNavigationBarItem(
        icon: Icon(
          Icons.add_box,
          key: keyBNPost,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Add'),
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
      )
    ];

    pages = [
      OrganizationFeed(
        key: const Key("HomeView"),
        homeModel: this,
      ),
      ExploreEvents(
        key: const Key('ExploreEvents'),
        homeModel: this,
      ),
      AddPost(
        key: const Key('AddPost'),
        drawerKey: MainScreenViewModel.scaffoldKey,
      ),
      const ChatPage(
        key: Key('Chats'),
      ),
      ProfilePage(
        key: keySPEditProfile,
        homeModel: this,
      ),
    ];

    pluginList = (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

    pluginList.forEach((plugin) {
      if (pluginPrototypeData.containsKey(plugin["pluginName"] as String) &&
          plugin["pluginInstallStatus"] as bool) {
        navBarItems.add(
          BottomNavigationBarItem(
            icon: Icon(
              pluginPrototypeData[plugin["pluginName"]]["icon"] as IconData,
            ),
            label: AppLocalizations.of(context)!.strictTranslate(
              plugin["pluginName"] as String,
            ),
          ),
        );
        pages.add(
          pluginPrototypeData[plugin["pluginName"]]["class"] as StatelessWidget,
        );
      }
    });

    /// Causes the app to continously check for plugins if they are
    /// updated and re-render the navbar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FetchPluginList();
      final newPluginList =
          (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

      if (listEquals(pluginList, newPluginList)) {
        notifyListeners();
      }
    });
  }

  /// Currently selected page
  int currentPageIndex = 0;

  /// Handles click on [BottomNavigationBarItem]
  void onTabTapped(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  /// This function show tutorial to user.
  void showTutorial({
    required dynamic Function(TargetFocus) onClickTarget,
    required dynamic Function() onFinish,
  }) {
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Theme.of(context).colorScheme.secondaryContainer,
      textSkip: "SKIP",
      textStyleSkip: TextStyle(
        color: Theme.of(context).colorScheme.background,
        fontSize: 20,
      ),
      paddingFocus: 10,
      opacityShadow: 1.0,
      onFinish: onFinish,
      onClickTarget: onClickTarget,
      onSkip: () {
        if (scaffoldKey.currentState!.isDrawerOpen) {
          navigationService.pop();
        }
        tourSkipped = true;
        onTabTapped(0);
      },
      onClickOverlay: (target) {
        onClickTarget(target);
      },
    )..show(context: context);
  }

  void tourHomeTargets() {
    targets.clear();
    targets.add(
      focusTarget(
        keySHOrgName,
        'keySHOrgName',
        'Current selected Organization Name',
      ),
    );
    targets.add(
      focusTarget(
        keySHMenuIcon,
        'keySHMenuIcon',
        'Click this button to see options related to switching, joining and leaving organization(s)',
        isCircle: true,
        next: () => scaffoldKey.currentState!.openDrawer(),
      ),
    );
    targets.add(
      focusTarget(
        keyDrawerCurOrg,
        'keyDrawerCurOrg',
        "Current selected Organization's Name appears here",
      ),
    );
    targets.add(
      focusTarget(
        keyDrawerSwitchableOrg,
        'keyDrawerSwitchableOrg',
        "All your joined organizations appear over here you can click on them to change the current organization",
      ),
    );
    targets.add(
      focusTarget(
        keyDrawerJoinOrg,
        'keyDrawerJoinOrg',
        "From this button you can join other listed organizations",
        align: ContentAlign.top,
      ),
    );
    targets.add(
      focusTarget(
        keyDrawerLeaveCurrentOrg,
        'keyDrawerLeaveCurrentOrg',
        "To leave the current organization you can use this option",
        align: ContentAlign.top,
        next: () => navigationService.pop(),
      ),
    );
    targets.add(
      focusTarget(
        keyBNHome,
        'keyBNHome',
        "This is the home tab here you can see the latest post from other members of the current organization",
        isCircle: true,
        align: ContentAlign.top,
      ),
    );
    targets.add(
      focusTarget(
        keySHPinnedPost,
        'keySHPinnedPost',
        "This section displays all the important post set by the organization admin(s)",
        align: ContentAlign.bottom,
      ),
    );
    targets.add(
      focusTarget(
        keySHPost,
        'keySHPost',
        "This is the post card you can like and comment on the post from the options available",
        align: ContentAlign.bottom,
      ),
    );
    showTutorial(
      onClickTarget: showHome,
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourEventTargets();
        }
      },
    );
  }

  /// This function shows the Home screen.
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
  void tourEventTargets() {
    targets.clear();
    targets.add(
      focusTarget(
        keyBNEvents,
        'keyBNEvents',
        'This is the Events tab here you can see all event related information of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
      ),
    );
    targets.add(
      focusTarget(
        keySECategoryMenu,
        'keySECategoryMenu',
        'Filter Events based on categories',
      ),
    );
    targets.add(
      focusTarget(
        keySEDateFilter,
        'keySEDateFilter',
        'Filter Events between selected dates',
      ),
    );
    targets.add(
      focusTarget(
        keySECard,
        'keySECard',
        'Description of event to see more details click on the card',
      ),
    );
    targets.add(
      focusTarget(
        keySEAdd,
        'keySEAdd',
        'You can create a new event from here',
        align: ContentAlign.top,
      ),
    );
    showTutorial(
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourAddPost();
        }
      },
      onClickTarget: (TargetFocus a) {},
    );
  }

  /// This function show the tutorial to add Post in the organization.
  void tourAddPost() {
    targets.clear();
    targets.add(
      focusTarget(
        keyBNPost,
        'keyBNPost',
        'This is the Create post tab here you can add post to the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
      ),
    );
    showTutorial(
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourChat();
        }
      },
      onClickTarget: (TargetFocus a) {},
    );
  }

  /// This function show the tour of chats.
  void tourChat() {
    targets.clear();
    targets.add(
      focusTarget(
        keyBNChat,
        'keyBNChat',
        'This is the Chat tab here you can see all your messages of the current selected organization',
        isCircle: true,
        align: ContentAlign.top,
      ),
    );
    showTutorial(
      onFinish: () {
        onTabTapped(currentPageIndex + 1);
        if (!tourComplete && !tourSkipped) {
          tourProfile();
        }
      },
      onClickTarget: (TargetFocus a) {},
    );
  }

  /// This function show the tutorial for the profile page.
  void tourProfile() {
    targets.clear();
    targets.add(
      focusTarget(
        keyBNProfile,
        'keyBNProfile',
        'This is the Profile tab here you can see all options related to account, app setting, invitation, help etc',
        isCircle: true,
        align: ContentAlign.top,
        nextCrossAlign: CrossAxisAlignment.start,
      ),
    );
    targets.add(
      focusTarget(
        keySPAppSetting,
        'keySPAppSetting',
        'You can edit application settings like language, theme etc from here',
      ),
    );
    targets.add(
      focusTarget(
        keySPHelp,
        'keySPHelp',
        'For any help we are always there. You can reach us from here',
      ),
    );
    targets.add(
      focusTarget(
        keySPDonateUs,
        'keySPDonateUs',
        'To help your organization grow you can support them financially from here',
      ),
    );
    targets.add(
      focusTarget(
        keySPInvite,
        'keySPInvite',
        'Wanna invite colleague, invite them from here',
      ),
    );
    targets.add(
      focusTarget(
        keySPPalisadoes,
        'keySPPalisadoes',
        'You are all set to go lets get you in',
        isEnd: true,
      ),
    );
    showTutorial(
      onFinish: () {
        if (!tourComplete && !tourSkipped) {
          tourComplete = true;
          onTabTapped(0);
        }
      },
      onClickTarget: (TargetFocus a) {},
    );
  }

  /// This returns a widget for a step in a tutorial.
  ///
  /// params:
  /// * [keyName] : key where the widget shows.
  /// * [description] : description of the step.
  /// * [isCircle]
  /// * [next] : `Function` type, this show the next step or `key` to show the tour of.
  /// * [isEnd] : true if last step of the tour.
  TargetFocus focusTarget(
    GlobalKey key,
    String keyName,
    String description, {
    bool isCircle = false,
    ContentAlign align = ContentAlign.bottom,
    CrossAxisAlignment crossAlign = CrossAxisAlignment.start,
    Alignment skipAlignment = Alignment.topRight,
    Function? next,
    CrossAxisAlignment nextCrossAlign = CrossAxisAlignment.end,
    bool isEnd = false,
  }) {
    return TargetFocus(
      enableOverlayTab: true,
      color: Colors.transparent,
      identify: keyName,
      keyTarget: key,
      alignSkip: skipAlignment,
      shape: isCircle ? ShapeLightFocus.Circle : ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: align,
          builder: (context, controller) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: crossAlign,
                children: <Widget>[
                  Text(
                    description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        TargetContent(
          align: ContentAlign.custom,
          customPosition: CustomTargetContentPosition(
            bottom: SizeConfig.screenHeight! * 0.025,
          ),
          builder: (context, controller) {
            return GestureDetector(
              onTap: () {
                if (next != null) {
                  next();
                }
                tutorialCoachMark.next();
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: nextCrossAlign,
                children: <Widget>[
                  Text(
                    isEnd ? 'COMPLETE' : 'NEXT',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

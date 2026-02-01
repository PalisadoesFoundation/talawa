import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/funds/funds_screen.dart';
import 'package:talawa/views/after_auth_screens/menu/menu_page.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/views/demo_screens/organization_feed_demo.dart';
import 'package:talawa/views/demo_screens/profile_page_demo.dart';

/// ViewModel managing bottom navigation, page construction, and tab switching.
///
/// Responsibilities:
/// - Build navigation bar items with localization and keys
/// - Construct page widgets (demo vs. regular mode)
/// - Handle tab switching and current page state
/// - Manage demo mode exit logic
class MainScreenNavViewModel extends BaseModel {
  /// Constructs MainScreenNavViewModel with required dependencies.
  ///
  /// **params**:
  /// * `keys`: MainScreenKeys instance for accessing GlobalKeys
  MainScreenNavViewModel({required this.keys});

  /// Reference to MainScreenKeys for accessing GlobalKeys.
  final MainScreenKeys keys;

  /// Contains the Widgets to be rendered for corresponding navbar items.
  List<Widget> pages = [];

  /// Actual [BottomNavigationBarItem]s that show up on the screen.
  List<BottomNavigationBarItem> navBarItems = [];

  /// Current page index in the bottom navigation.
  int currentPageIndex = 0;

  /// Dynamically adds [BottomNavigationBarItems] in `BottomNavigationBar`.
  ///
  /// Populates both `navBarItems` and `pages` based on demo mode.
  ///
  /// **params**:
  /// * `context`: BuildContext for localization
  /// * `isDemoMode`: Whether the app is in demo mode
  /// * `homeModel`: Parent model reference for passing to pages
  ///
  /// **returns**:
  ///   None
  void setupNavigationItems(
    BuildContext context, {
    required bool isDemoMode,
    required dynamic homeModel,
  }) {
    navBarItems = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          key: isDemoMode ? keys.keyBNDemoHome : keys.keyBNHome,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.event_note,
          key: isDemoMode ? keys.keyBNDemoEvents : keys.keyBNEvents,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Events'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat_outlined,
          key: keys.keyBNChat,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Chat'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.currency_exchange,
          key: keys.keyBNFunds,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Funds'),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.account_circle,
          key: isDemoMode ? keys.keyBNDemoProfile : keys.keyBNProfile,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Profile'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.menu,
        ),
        label: AppLocalizations.of(context)!.strictTranslate('Menu'),
      ),
    ];

    if (!isDemoMode) {
      pages = [
        OrganizationFeed(
          key: const Key("HomeView"),
          // ignore: argument_type_not_assignable
          homeModel: homeModel,
        ),
        const EventCalendar(
          key: Key('ExploreEvents'),
        ),
        const ChatPage(
          key: Key('Chats'),
        ),
        const FundScreen(
          key: Key('Funds'),
        ),
        ProfilePage(
          key: keys.keySPEditProfile,
        ),
        const MenuPage(
          key: Key('Menu'),
        ),
      ];
    } else {
      pages = [
        DemoOrganizationFeed(
          key: const Key("DemoHomeView"),
          // ignore: argument_type_not_assignable
          homeModel: homeModel,
        ),
        const DemoExploreEvents(
          key: Key('DemoExploreEvents'),
        ),
        const ChatPage(
          key: Key('DemoChats'),
        ),
        const FundScreen(
          key: Key('Funds'),
        ),
        DemoProfilePage(
          key: const Key('DemoProfile'),
          // ignore: argument_type_not_assignable
          homeModel: homeModel,
        ),
        const MenuPage(
          key: Key('Menu'),
        ),
      ];
    }
  }

  /// Handles click on [BottomNavigationBarItem].
  ///
  /// **params**:
  /// * `index`: Index of the tapped tab
  ///
  /// **returns**:
  ///   None
  void onTabTapped(int index) {
    currentPageIndex = index;
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
    appConfig.isDemoMode = false;
    navigationService.removeAllAndPush(
      Routes.setUrlScreen,
      Routes.splashScreen,
      arguments: '',
    );
  }
}

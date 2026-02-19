import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/view_model/main_screen_keys.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_list_screen.dart';
import 'package:talawa/views/after_auth_screens/events/event_calendar.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/funds/funds_screen.dart';
import 'package:talawa/views/after_auth_screens/menu/menu_page.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/demo_screens/explore_events_demo.dart';
import 'package:talawa/views/demo_screens/organization_feed_demo.dart';
import 'package:talawa/views/demo_screens/profile_page_demo.dart';

/// ViewModel for managing bottom navigation and page construction.
class MainScreenNavViewModel extends BaseModel {
  MainScreenNavViewModel({required this.keys});

  /// Keys for accessing UI elements.
  final MainScreenKeys keys;

  /// Pages corresponding to bottom navigation items.
  late List<Widget> pages;

  /// Bottom navigation items.
  late List<BottomNavigationBarItem> navBarItems;

  /// Currently selected page index.
  int currentPageIndex = 0;

  /// Setup the bottom navigation bar items and page widgets.
  ///
  /// Supports demo mode with alternate pages and keys.
  void setupNavigationItems(
    BuildContext context, {
    required bool isDemoMode,
    required MainScreenViewModel homeModel,
  }) {
    navBarItems = _buildNavBarItems(context, isDemoMode);
    pages = _buildPages(isDemoMode, homeModel);
  }

  /// Handles tap on a bottom navigation item.
  void onTabTapped(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  /// Exit demo mode and navigate to splash screen.
  void exitDemoMode() {
    appConfig.isDemoMode = false;
    navigationService.removeAllAndPush(
      Routes.setUrlScreen,
      Routes.splashScreen,
      arguments: '',
    );
  }

  // ------------------ Private Helpers ------------------

  List<BottomNavigationBarItem> _buildNavBarItems(
      BuildContext context, bool isDemoMode) {
    final t = AppLocalizations.of(context)!.strictTranslate;
    return [
      BottomNavigationBarItem(
        icon: Icon(isDemoMode ? Icons.home_outlined : Icons.home,
            key: isDemoMode ? keys.keyBNDemoHome : keys.keyBNHome),
        label: t('Home'),
      ),
      BottomNavigationBarItem(
        icon: Icon(isDemoMode ? Icons.event_note_outlined : Icons.event_note,
            key: isDemoMode ? keys.keyBNDemoEvents : keys.keyBNEvents),
        label: t('Events'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_outlined, key: keys.keyBNChat),
        label: t('Chat'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.currency_exchange, key: keys.keyBNFunds),
        label: t('Funds'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle,
            key: isDemoMode ? keys.keyBNDemoProfile : keys.keyBNProfile),
        label: t('Profile'),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.menu),
        label: t('Menu'),
      ),
    ];
  }

  List<Widget> _buildPages(bool isDemoMode, MainScreenViewModel homeModel) {
    if (!isDemoMode) {
      return [
        OrganizationFeed(key: const Key("HomeView"), homeModel: homeModel),
        const EventCalendar(key: Key('ExploreEvents')),
        const ChatPage(key: Key('Chats')),
        const FundScreen(key: Key('Funds')),
        ProfilePage(key: keys.keySPEditProfile),
        const MenuPage(key: Key('Menu')),
      ];
    } else {
      return [
        DemoOrganizationFeed(key: const Key("DemoHomeView"), homeModel: homeModel),
        const DemoExploreEvents(key: Key('DemoExploreEvents')),
        const ChatPage(key: Key('DemoChats')),
        const FundScreen(key: Key('Funds')),
        DemoProfilePage(key: const Key('DemoProfile'), homeModel: homeModel),
        const MenuPage(key: Key('Menu')),
      ];
    }
  }
}

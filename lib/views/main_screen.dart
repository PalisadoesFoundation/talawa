import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/chat/chat_page.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final List<Widget> childrenPage = [
      OrganizationFeed(key: const Key("HomeView"), drawerKey: scaffoldKey),
      ExploreEvents(key: const Key('ExploreEvents'), drawerKey: scaffoldKey),
      AddPost(key: const Key('AddPost'), drawerKey: scaffoldKey),
      // Container(
      //   child: Center(
      //     child: Text(
      //         AppLocalizations.of(context)!.strictTranslate('Chat Screen')),
      //   ),
      // ),
      const ChatPage(),
      ProfilePage(key: const Key('Profile'), drawerKey: scaffoldKey),
    ];

    return BaseView<MainScreenViewModel>(builder: (context, model, child) {
      return Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        body: IndexedStack(
          index: model.currentIndex,
          children: childrenPage,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: model.onTabTapped,
          selectedItemColor: const Color(0xff34AD64),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.strictTranslate('Home'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.event_note),
              label: AppLocalizations.of(context)!.strictTranslate('Events'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.add_box),
              label: AppLocalizations.of(context)!.strictTranslate('Post'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_bubble_outline),
              label: AppLocalizations.of(context)!.strictTranslate('Chat'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: AppLocalizations.of(context)!.strictTranslate('Profile'),
            )
          ],
        ),
      );
    });
  }
}

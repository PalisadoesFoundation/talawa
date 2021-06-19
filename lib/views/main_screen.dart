import 'package:flutter/material.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
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
      Container(
        child: const Center(
          child: Text('Chat Screen'),
        ),
      ),
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
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              label: 'Events',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Post',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            )
          ],
        ),
      );
    });
  }
}

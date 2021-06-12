import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed_page/organization_feed.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

import '../locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _childrenPages = [
    const OrganizationFeed(key: Key("HomeView")),
    const ExploreEvents(key: Key('ExploreEvents')),
    const AddPost(key: Key('AddPost')),
    Container(
      child: const Center(
        child: Text('Chat Screen'),
      ),
    ),
    Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.4,
            ),
            const Text('Profile Screen'),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.4,
            ),
            RaisedRoundedButton(
              buttonLabel: 'Log out',
              onTap: () {
                final user = Hive.box<User>('currentUser');
                final url = Hive.box('url');
                user.clear();
                url.clear();
                locator<NavigationService>()
                    .removeAllAndPush('/selectLang', '/', arguments: '0');
              },
              textColor: const Color(0xFF008A37),
              key: const Key('Logout'),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.0215,
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childrenPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
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
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

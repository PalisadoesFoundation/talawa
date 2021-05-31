import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/views/after_auth_screens/feed_page/organization_feed.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _childrenPages = [
    const OrganizationFeed(key: Key("HomeView")),
    Container(
      child: const Center(
        child: Text('Events Screen'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Post Screen'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Chat Screen'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Profile Screen'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.screenWidth);
    print(SizeConfig.screenHeight);
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

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({required Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _childrenPages = [
    Container(
      child: const Center(
        child: Text('Add Newsfeed Here'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Add EventsScreen Here'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Add Post Screen Here'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Add Chat Screen Here'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Add Profile Screen Here'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childrenPages[_currentIndex], // new

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // new
        currentIndex: _currentIndex,
        onTap: onTabTapped,
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

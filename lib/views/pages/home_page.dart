// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/newsfeed/newsfeed.dart';
import 'package:talawa/views/pages/members/members.dart';

import 'package:talawa/views/pages/events/events.dart';
import 'package:talawa/views/pages/chat/groups.dart';

import 'package:talawa/utils/apiFuctions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'organization/profile_page.dart';
import 'package:talawa/services/preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  // int currentIndex = 0;

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);
  Preferences preferences = Preferences();

  @override
  void initState() {
    super.initState();
    Provider.of<GraphQLConfiguration>(context, listen: false).getOrgUrl();
    Provider.of<Preferences>(context, listen: false).getCurrentOrgId();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getUserInfo() async {
    final String userID = await preferences.getUserId();
    String mutation = Queries().fetchUserInfo2(userID);
    ApiFunctions apiFunctions = ApiFunctions();
    final result = await apiFunctions.gqlmutation(mutation);
  }

  List<Widget> _buildScreens() {
    return [
      NewsFeed(),
      Groups(),
      Events(),
      Organizations(),
      ProfilePage(),
    ];
  }

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 26, semanticLabel: "Home"),
          Icon(Icons.chat, size: 26, semanticLabel: "Chat"),
          Icon(Icons.calendar_today, size: 26, semanticLabel: "Calendar"),
          Icon(Icons.people, size: 26, semanticLabel: "People"),
          Icon(Icons.folder, size: 26, semanticLabel: "Folder"),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.orange,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

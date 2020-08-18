import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/newsfeed.dart';
import 'package:talawa/views/pages/members.dart';
import 'package:talawa/enums/connectivity_status.dart';

import 'package:talawa/views/pages/events.dart';
import 'package:talawa/views/pages/groups.dart';

import 'package:talawa/utils/apiFuctions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'profile_page.dart';
import 'package:talawa/services/preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // PageController pageController = PageController(initialPage: 3);
  // int currentIndex = 0;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 4);
  // AnimationController controller;
  String userID;
  Preferences preferences = Preferences();
  Map result = {};
  @override
  void initState() {
    super.initState();
    getUser();
    // Provider.of<NoteController>(context, listen: false).initializeSocket(
    //     Provider.of<AuthController>(context, listen: false).currentUserId);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getUser() async {
    final id = await preferences.getUserId();
    userID = id;
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    String mutation = Queries().fetchUserInfo2(userID);
    ApiFunctions apiFunctions = ApiFunctions();
    result = await apiFunctions.gqlmutation(mutation);
  }

  List<Widget> _buildScreens() {
    return [
      NewsFeed(),
      Groups(),
      Organizations(),
      Events(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        // isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        title: ("Chats"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        // isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.group),
        title: ("Members"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        // isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_today),
        title: ("events"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        // isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("profile"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        // isTranslucent: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
 
    return PersistentTabView(
      backgroundColor: UIData.primaryColor,
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      // showElevation: true,
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      iconSize: 26.0,
      navBarStyle: NavBarStyle.style4,
      onItemSelected: (index) {},
    );
  }
}

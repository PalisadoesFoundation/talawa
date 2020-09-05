// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/newsfeed/newsfeed.dart';
import 'package:talawa/views/pages/members/members.dart';
import 'package:talawa/enums/connectivity_status.dart';

import 'package:talawa/views/pages/events/events.dart';
import 'package:talawa/views/pages/chat/groups.dart';

import 'package:talawa/utils/apiFuctions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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

//////////////
  int currentIndex = 0;

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
        icon: Icon(Icons.calendar_today),
        title: ("Events"),
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
        icon: Icon(Icons.folder),
        title: ("Profile"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        // isTranslucent: false,
      ),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(
        //   body: _buildScreens()[currentIndex],
        //   bottomNavigationBar: BottomNavigationBar(
        //     onTap: onTabTapped,
        //     currentIndex: currentIndex, // this will be set when a new tab is tapped
        //     // fixedColor: UIData.primaryColor,
        //     items: [
        //       BottomNavigationBarItem(
        //         icon: new Icon(Icons.home),
        //         title: new Text('Home'),
        //         backgroundColor: UIData.primaryColor,
        //       ),
        //       BottomNavigationBarItem(
        //         icon: new Icon(Icons.chat),
        //         title: new Text('Chat'),
        //         backgroundColor: UIData.primaryColor,
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.calendar_today),
        //         title: Text('Events'),
        //         backgroundColor: UIData.primaryColor,
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.people),
        //         title: Text('Members'),
        //         backgroundColor: UIData.primaryColor,
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.folder),
        //         title: Text('Profile'),
        //         backgroundColor: UIData.primaryColor,
        //       )
        //     ],
        //   ),
        // )

        PersistentTabView(
      // stateManagement: false,

      backgroundColor: UIData.primaryColor,
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      // showElevation: true,
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      iconSize: 26.0,
      navBarStyle: NavBarStyle.style4,
      // onItemSelected: (index) {
      //   if (index == 0) {
      //     pushNewScreen(context, screen: NewsFeed());
      //   }
      // },
    );
  }
}

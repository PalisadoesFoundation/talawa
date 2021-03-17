//imported flutter packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//importing the pages here
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

  int currentIndex = 0;

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);
  Preferences preferences = Preferences();

  @override
  void initState() {
    super.initState();
    Provider.of<GraphQLConfiguration>(context, listen: false).getOrgUrl(); //Here we are getting the Current Organization URL that is being joined by the user
    Provider.of<Preferences>(context, listen: false).getCurrentOrgId(); //Here we are getting the Current Org ID
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getUserInfo() async {
    final String userID = await preferences.getUserId(); //getting the current user id from the server
    String mutation = Queries().fetchUserInfo2(userID); //getting some more user information with the ID
    ApiFunctions apiFunctions = ApiFunctions();
    final result = await apiFunctions.gqlmutation(mutation);
  }

  List<Widget> _buildScreens() { //here we are building the screens that are mention in the app bar
    return [
      NewsFeed(), //first page of the news feed
      Groups(), //second page of the Group chatting event
      Events(), //Third page of creating the events and viewing it
      Organizations(), //fourth page of seeing the organization
      ProfilePage(), //last page of the profile
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem( //mentioning the screen home in the bottom bar
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
      ),
      PersistentBottomNavBarItem( //mentioning the screen chats in the bottom bar
        icon: Icon(Icons.chat),
        title: ("Chats"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
      ),
      PersistentBottomNavBarItem( //mentioning the Events home in the bottom bar
        icon: Icon(Icons.calendar_today),
        title: ("Events"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
      ),
      PersistentBottomNavBarItem( //mentioning the screen home in the bottom bar
        icon: Icon(Icons.group),
        title: ("Members"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
      ),
      PersistentBottomNavBarItem( //mentioning the screen Profile in the bottom bar
        icon: Icon(Icons.folder),
        title: ("Profile"),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
      ),
    ];
  }

  void onTabTapped(int index) { //this function tells us what should be done if the particular tab is clicked
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        PersistentTabView( //calling the Persistent tab view here
      backgroundColor: UIData.primaryColor,
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      iconSize: 26.0,
      navBarStyle: NavBarStyle.style4,
    );
  }
}

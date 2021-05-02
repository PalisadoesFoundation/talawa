//imported flutter packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//importing the pages here
import 'package:provider/provider.dart';
import 'package:talawa/controllers/post_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/newsfeed/newsfeed.dart';
import 'package:talawa/views/pages/members/members.dart';

import 'package:talawa/views/pages/events/events.dart';
import 'package:talawa/views/pages/chat/groups.dart';
import 'package:talawa/utils/api_functions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'organization/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.openPageIndex = 0});
  final int openPageIndex;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  int currentIndex = 0;

  PersistentTabController _controller;
  Preferences preferences = Preferences();

  @override
  void initState() {
    super.initState();
    currentIndex = widget.openPageIndex;
    _controller = PersistentTabController(initialIndex: currentIndex);
    Provider.of<GraphQLConfiguration>(context, listen: false).getOrgUrl();
    Provider.of<Preferences>(context, listen: false).getCurrentOrgId();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getUserInfo() async {
    final String userID = await preferences
        .getUserId(); //getting the current user id from the server
    final String mutation = Queries().fetchUserInfo2(
        userID); //getting some more user information with the ID
    final ApiFunctions apiFunctions = ApiFunctions();
    await apiFunctions.gqlmutation(mutation);
  }

  List<Widget> _buildScreens() {
    //here we are building the screens that are mention in the app bar
    return [
      const NewsFeed(), //first page of the news feed
      const Groups(), //second page of the Group chatting event
      const Events(), //Third page of creating the events and viewing it
      const Organizations(), //fourth page of seeing the organization
      const ProfilePage(), //last page of the profile
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        //mentioning the screen home in the bottom bar
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        //mentioning the screen chats in the bottom bar
        icon: const Icon(Icons.chat),
        title: "Chats",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        //mentioning the Events home in the bottom bar
        icon: const Icon(Icons.calendar_today),
        title: "Events",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        //mentioning the screen home in the bottom bar
        icon: const Icon(Icons.group),
        title: "Members",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        //mentioning the screen Profile in the bottom bar
        icon: const Icon(Icons.folder),
        title: "Profile",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }

  void onTabTapped(int index) {
    //this function tells us what should be done if the particular tab is clicked
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
          create: (_) => GraphQLConfiguration(),
        ),
        ChangeNotifierProvider<Preferences>(
          create: (_) => Preferences(),
        ),
        ChangeNotifierProvider<PostController>(
          create: (_) => PostController(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        final BuildContext rootContext = context;
        Provider.of<GraphQLConfiguration>(rootContext, listen: false)
            .getOrgUrl();
        Provider.of<Preferences>(rootContext, listen: false).getCurrentOrgId();
        return PersistentTabView(rootContext,
            backgroundColor: UIData.primaryColor,
            controller: _controller,
            items: _navBarsItems(),
            screens: _buildScreens(),
            confineInSafeArea: true,
            handleAndroidBackButtonPress: true,
            navBarStyle: NavBarStyle.style4,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ));
      }),
    );
  }
}

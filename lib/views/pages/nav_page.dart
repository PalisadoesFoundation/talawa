import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/note_controller.dart';
import 'package:talawa/controllers/organisation_controller.dart';
import 'package:talawa/model/activity.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/newsfeed.dart';
import 'package:talawa/views/pages/members.dart';
import 'package:talawa/views/widgets/common_drawer.dart';
import 'package:intl/intl.dart';
import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/model/user.dart';
import 'package:talawa/enums/connectivity_status.dart';


import 'package:talawa/views/pages/events.dart';
import 'package:talawa/views/pages/groups.dart';

import 'package:talawa/views/pages/addEventPage.dart';

import 'package:talawa/utils/apiFuctions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/utils/userInfo.dart';
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
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
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

  _showSnackBar() {
    print("Show SnackBar Here");
    final snackBar = new SnackBar(content: new Text("Device Disconnected"));
    _scaffoldKey.currentState.showSnackBar(snackBar);
    return CircularProgressIndicator();
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


    UserInfo userInfo = UserInfo();
    // userInfo.currentOrg = 0;
    // userInfo.currentOrgList = result['users'][0]['joinedOrganizations'];

    print(result['users'][0]['joinedOrganizations'][0]['_id']);
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
    var connectionStatus =
        Provider.of<ConnectivityStatus>(context, listen: true);
    if (connectionStatus == ConnectivityStatus.Offline) {
      _showSnackBar();
    }
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
      onItemSelected: (index) {
      },
    ); 
  }

}







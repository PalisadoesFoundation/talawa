import 'package:flutter/material.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/views/after_auth_screens/add_post_page.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed_page/organization_feed.dart';
import 'package:talawa/views/after_auth_screens/profile/profile_page.dart';

class MainScreenViewModel extends BaseModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Widget> childrenPage;
  int currentIndex = 0;

  initialize() {
    childrenPage = [
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
  }

  onTabTapped(int index) {
    currentIndex = index;
    setState(ViewState.idle);
  }
}

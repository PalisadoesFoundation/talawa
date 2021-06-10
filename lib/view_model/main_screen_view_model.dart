import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_events.dart';
import 'package:talawa/views/after_auth_screens/feed_page/organization_feed.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

import '../locator.dart';

class MainScreenViewModel extends BaseModel {
  late List<Widget> childrenPage;
  int currentIndex = 0;

  initialize() {
    childrenPage = [
      const OrganizationFeed(
        key: Key("OrganizationFeed"),
      ),
      const ExploreEvents(
        key: Key('ExploreEvents'),
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
                  const bool logout = true;
                  if (logout) {
                    final user = Hive.box<User>('currentUser');
                    final url = Hive.box('url');
                    final org = Hive.box<OrgInfo>('currentOrg');
                    user.clear();
                    org.clear();
                    url.clear();
                    locator<NavigationService>()
                        .removeAllAndPush('/selectLang', '/', arguments: '0');
                  }
                  /* else {
                    locator<GraphqlConfig>().getToken();
                    locator<DataBaseMutationFunctions>().init();
                    locator<DataBaseMutationFunctions>()
                        .joinPublicOrg('607c28c26aeaab0027b81ec3');
                  }*/
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
  }

  onTabTapped(int index) {
    currentIndex = index;
    setState(ViewState.idle);
  }
}

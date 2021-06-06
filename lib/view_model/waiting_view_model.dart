import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/org_info.dart';
import 'package:talawa/models/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../locator.dart';

class WaitingViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  late OrgInfo pendingRequestOrg;
  late User currentUser;

  initialise() {
    currentUser = locator<UserConfig>().currentUser!;
    pendingRequestOrg = currentUser.membershipRequests![0];
    greeting = [
      {
        'text': "Please wait for ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': pendingRequestOrg.name,
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24)
      },
      {
        'text': " to accept your invitation. ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
    ];
  }

  logout() {
    final user = Hive.box<User>('currentUser');
    final url = Hive.box('url');
    user.clear();
    url.clear();
    locator<NavigationService>()
        .removeAllAndPush('/selectLang', '/', arguments: '0');
  }
}

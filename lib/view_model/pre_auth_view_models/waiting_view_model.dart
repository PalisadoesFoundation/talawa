import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../../locator.dart';

class WaitingViewModel extends BaseModel {
  final navigationService = locator<NavigationService>();
  late List<Map<String, dynamic>> greeting;
  late List<OrgInfo> pendingRequestOrg;
  late User currentUser;

  initialise() {
    currentUser = locator<UserConfig>().currentUser;
    pendingRequestOrg = currentUser.membershipRequests!;
    greeting = [
      {
        'text': "Please wait for ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text':
            '${pendingRequestOrg[0].creatorInfo!.firstName} ${pendingRequestOrg[0].creatorInfo!.lastName}',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24)
      },
      {
        'text': " to accept your invitation. ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
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
    navigationService.removeAllAndPush('/selectLang', '/', arguments: '0');
  }
}

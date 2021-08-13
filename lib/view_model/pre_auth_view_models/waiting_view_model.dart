import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

class WaitingViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  late List<OrgInfo> pendingRequestOrg;
  late User currentUser;

  initialise() {
    currentUser = userConfig.currentUser;
    pendingRequestOrg = currentUser.membershipRequests!;
    print(pendingRequestOrg.length);
    greeting = [
      {
        'text': "Please wait",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': " ${currentUser.firstName} ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24)
      },
      {
        'text': "for organisation(s) to accept your invitation.",
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
    navigationService.removeAllAndPush(
        Routes.languageSelectionRoute, Routes.splashScreen,
        arguments: '0');
  }

  joinOrg() {
    navigationService.pushScreen(Routes.joinOrg, arguments: '-1');
  }
}

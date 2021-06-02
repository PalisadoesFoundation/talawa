import 'package:flutter/material.dart';
import 'package:talawa/models/org_info.dart';
import 'package:talawa/models/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

import '../locator.dart';

class WaitingViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  late OrgInfo pendingRequestOrg;

  initialise() {
    pendingRequestOrg = OrgInfo(
        id: '1',
        name: 'Organization 1',
        creatorInfo: User(
          id: '1',
          firstName: 'Rutvik',
          lastName: 'Chandla',
        ),
        isPublic: false);
    greeting = [
      {
        'text': "Please wait for ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': "Org Name ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24)
      },
      {
        'text': "to accept your invitation. ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
    ];
  }
}

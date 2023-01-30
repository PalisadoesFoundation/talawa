import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });
  test("test initialise function of model", () async {
    final model = SelectContactViewModel();
    model.initialise();
  });
  // final User user1 = User(id: "fakeUser1");
  // final User user2 = User(id: "fakeUser2");
  // final List<User> users = [user1, user2];
  //
  // when(organizationService.getOrgMembersList("XYZ"))
  //     .thenAnswer((realInvocation) async {
  //   return users;
  // });
  //TODO: To be Written when SelectContactViewModel is completed
  test("test initialise function of model", () async {
    final model = SelectContactViewModel();
    model.initialise();
    final User user1 = User(id: "fakeUser1");
    final User user2 = User(id: "fakeUser2");
    final List<User> users = [user1, user2];

    when(organizationService.getOrgMembersList("XYZ"))
        .thenAnswer((realInvocation) async {
      return users;
    });
    await model.getCurrentOrgUsersList();
    bool working = true;
    model.orgMembersList.forEach((user) {
      if (user.id == null) {
        working = false;
      }
    });

    expect(working, true);
  });
}

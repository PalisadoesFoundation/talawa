// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';

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
  test("test to check if getOrgMembersList is working", () async {
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

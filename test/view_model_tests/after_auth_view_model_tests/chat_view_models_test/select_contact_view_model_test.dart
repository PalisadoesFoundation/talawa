import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  test("test initialise function of model", () {
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

    // Test state management
    expect(model.state, ViewState.idle);

    await model.getCurrentOrgUsersList();

    // Verify state returns to idle after completion
    expect(model.state, ViewState.idle);

    // Verify the users were loaded correctly
    expect(model.orgMembersList.length, 2);
    expect(model.orgMembersList[0].id, "fakeUser1");
    expect(model.orgMembersList[1].id, "fakeUser2");

    bool working = true;
    model.orgMembersList.forEach((user) {
      if (user.id == null) {
        working = false;
      }
    });

    expect(working, true);
  });

  test("test state management during getCurrentOrgUsersList", () async {
    final model = SelectContactViewModel();
    model.initialise();
    final User user1 = User(id: "fakeUser1");
    final List<User> users = [user1];

    when(organizationService.getOrgMembersList("XYZ"))
        .thenAnswer((realInvocation) async {
      // Simulate some delay
      await Future.delayed(const Duration(milliseconds: 100));
      return users;
    });

    // Initially should be idle
    expect(model.state, ViewState.idle);

    // Start the async operation
    final future = model.getCurrentOrgUsersList();

    // Should be busy now
    expect(model.state, ViewState.busy);

    // Wait for completion
    await future;

    // Should be idle again
    expect(model.state, ViewState.idle);
  });

  test("test notifyListeners is called during getCurrentOrgUsersList",
      () async {
    final model = SelectContactViewModel();
    model.initialise();
    final User user1 = User(id: "fakeUser1");
    final List<User> users = [user1];

    when(organizationService.getOrgMembersList("XYZ"))
        .thenAnswer((realInvocation) async {
      return users;
    });

    bool listenerCalled = false;
    model.addListener(() {
      listenerCalled = true;
    });

    await model.getCurrentOrgUsersList();

    // Verify that listeners were notified
    expect(listenerCalled, true);
  });

  test("test notifyListeners is called even on error", () async {
    final model = SelectContactViewModel();
    model.initialise();

    when(organizationService.getOrgMembersList("XYZ"))
        .thenThrow(Exception("Network error"));

    bool listenerCalled = false;
    model.addListener(() {
      listenerCalled = true;
    });

    await model.getCurrentOrgUsersList();

    // Verify that listeners were notified even on error
    expect(listenerCalled, true);
  });

  test("test state transitions during error in getCurrentOrgUsersList",
      () async {
    final model = SelectContactViewModel();
    model.initialise();

    when(organizationService.getOrgMembersList("XYZ"))
        .thenThrow(Exception("Network error"));

    // Initially should be idle
    expect(model.state, ViewState.idle);

    // Start the async operation and capture states
    final future = model.getCurrentOrgUsersList();

    // Should be busy now
    expect(model.state, ViewState.busy);

    // Wait for completion
    await future;

    // Should return to idle even after error
    expect(model.state, ViewState.idle);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

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

  group('Create Event Tests', () {
    final model = CreateEventViewModel();
    model.initialize();

    test('check that empty values are not accepted for required fields', () {
      final String? emptyTitle = Validator.validateEventForm("", "Title");
      expect(emptyTitle, "Title must not be left blank.");

      final String? emptyLocation = Validator.validateEventForm("", "Location");
      expect(emptyLocation, "Location must not be left blank.");

      final String? emptyDescription =
          Validator.validateEventForm("", "Description");
      expect(emptyDescription, "Description must not be left blank.");
    });

    test('Check validators return null for valid values', () {
      final String? validTitle =
          Validator.validateEventForm("Test Title", "Title");
      expect(validTitle, null);

      final String? validLocation =
          Validator.validateEventForm("Test Location", "Location");
      expect(validLocation, null);

      final String? validDescription =
          Validator.validateEventForm("Test Description", "Description");
      expect(validDescription, null);
    });

    test('Check addition of members', () {
      final List<User> allMembers =
          userConfig.currentOrg.members! + userConfig.currentOrg.admins!;
      model.orgMembersList = allMembers;

      // non admins (normal members)
      final List<User> usersInCurrentOrg = userConfig.currentOrg.members!;
      model.memberCheckedMap[usersInCurrentOrg.first.id!] = true;
      model.buildUserList(isAdmin: false);
      final bool isMemberFound =
          model.selectedMembers.contains(usersInCurrentOrg.first);
      expect(isMemberFound, true);

      // admins
      final List<User> adminsInCurrentOrg = userConfig.currentOrg.admins!;
      model.adminCheckedMap[adminsInCurrentOrg.first.id!] = true;
      model.buildUserList(isAdmin: true);
      final bool isAdminFound =
          model.selectedAdmins.contains(adminsInCurrentOrg.first);
      expect(isAdminFound, true);
    });

    test('Removing of members from event', () {
      final List<User> allMembers =
          userConfig.currentOrg.members! + userConfig.currentOrg.admins!;
      model.orgMembersList = allMembers;

      // non admins (normal members)
      // to remove, first we need to add a member
      final List<User> usersInCurrentOrg = userConfig.currentOrg.members!;
      model.memberCheckedMap[usersInCurrentOrg.first.id!] = true;
      model.buildUserList(isAdmin: false);
      model.removeUserFromList(
          isAdmin: false, userId: usersInCurrentOrg.first.id!);
      final bool isMemberFound =
          model.selectedMembers.contains(usersInCurrentOrg.first);
      expect(isMemberFound, false);

      // admins
      // to remove, first we need to add an admin
      final List<User> adminsInCurrentOrg = userConfig.currentOrg.admins!;
      model.adminCheckedMap[adminsInCurrentOrg.first.id!] = true;
      model.buildUserList(isAdmin: true);
      model.removeUserFromList(
          isAdmin: true, userId: adminsInCurrentOrg.first.id!);
      final bool isAdminFound =
          model.selectedAdmins.contains(adminsInCurrentOrg.first);
      expect(isAdminFound, false);
    });
  });
}

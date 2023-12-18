import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

/// Mocked context.
/// 
/// more_info_if_required
class MockBuildContext extends Mock implements BuildContext {}

/// Main.
/// 
/// more_info_if_required
/// 
/// **params**:
///   None
/// 
/// **returns**:
///   None
void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();
  locator<NavigationService>();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });
  group('CustomDrawerViewModel Tests', () {
    test('switchAbleOrg should correctly get and set value', () {
      final model = CustomDrawerViewModel();
      final orgList = [
        OrgInfo(name: 'Test Org 1'),
        OrgInfo(name: 'Test Org 2'),
      ];

      model.switchAbleOrg = orgList;

      expect(model.switchAbleOrg, equals(orgList));
    });
    test("initialize should setup the model with user's joined organizations",
        () {
      final homeModel = MainScreenViewModel();
      final MockBuildContext mockContext = MockBuildContext();
      final model = CustomDrawerViewModel();
      final user = User(joinedOrganizations: [OrgInfo(name: 'Test Org')]);

      when(userConfig.currentOrgInfoStream)
          .thenAnswer((_) => Stream.value(OrgInfo()));
      when(userConfig.currentUser).thenReturn(user);
      when(userConfig.currentOrg).thenReturn(OrgInfo());

      model.initialize(homeModel, mockContext);

      expect(model.switchAbleOrg, equals(user.joinedOrganizations));
    });

    test('switchOrg should show info message if different organization', () {
      final model = CustomDrawerViewModel();
      final orgInfo = OrgInfo(name: 'Test Org');

      when(userConfig.currentOrg).thenReturn(OrgInfo(name: 'Current Org'));
      model.switchAbleOrg = [orgInfo];

      model.switchOrg(orgInfo);

      verify(
        navigationService.showTalawaErrorSnackBar(
          'Switched to ${orgInfo.name}',
          MessageType.info,
        ),
      );
    });

    test('switchOrg should pop navigation after switching or showing error',
        () {
      final model = CustomDrawerViewModel();
      final orgInfo = OrgInfo(name: 'Test Org');

      when(userConfig.currentOrg).thenReturn(OrgInfo(name: 'Current Org'));
      model.switchAbleOrg = [orgInfo];

      model.switchOrg(orgInfo);

      verify(navigationService.pop());
    });
  });
  test('initialize should setup the model with userConfig values', () {
    final homeModel = MainScreenViewModel();
    final MockBuildContext mockContext = MockBuildContext();
    final model = CustomDrawerViewModel();
    final user = User(joinedOrganizations: [OrgInfo(name: 'Test Org')]);

    when(userConfig.currentOrgInfoStream)
        .thenAnswer((_) => Stream.value(OrgInfo()));
    when(userConfig.currentUser).thenReturn(user);
    when(userConfig.currentOrg).thenReturn(OrgInfo());

    model.initialize(homeModel, mockContext);

    expect(model.switchAbleOrg, equals(user.joinedOrganizations));
    expect(model.selectedOrg, equals(userConfig.currentOrg));
  });
  test(
      'switchOrg should save new organization in userConfig if different organization',
      () {
    final model = CustomDrawerViewModel();
    final orgInfo = OrgInfo(name: 'Test Org');

    when(userConfig.currentOrg).thenReturn(OrgInfo(name: 'Current Org'));
    model.switchAbleOrg = [orgInfo];

    model.switchOrg(orgInfo);

    verify(userConfig.saveCurrentOrgInHive(orgInfo));
    verify(
      navigationService.showTalawaErrorSnackBar(
        'Switched to ${orgInfo.name}',
        MessageType.info,
      ),
    );
  });

  test('check if switchOrg is working with zero switchable orgs', () {
    final model = CustomDrawerViewModel();
    model.setSelectedOrganizationName(userConfig.currentOrg);

    //No switchable org are present in the model
    model.switchAbleOrg = [];

    //Acess mock joined Organisation for the mock user
    final OrgInfo mockJoinedOrg =
        userConfig.currentUser.joinedOrganizations!.first;

    //check if selected org is mocked joined org .Expectation-false.
    expect(model.selectedOrg, isNot(mockJoinedOrg));
  });

  test('check if switchOrg is working with wrong switchable org being passed',
      () {
    final model = CustomDrawerViewModel();
    model.setSelectedOrganizationName(userConfig.currentOrg);

    //Mock switchable org are present in the model
    model.switchAbleOrg = userConfig.currentUser.joinedOrganizations!;

    //Mock fake org which is not present in the mock switchableOrg

    //Acess mock joined Organisation for the mock user
    final OrgInfo fakeOrg = OrgInfo(
      id: '5',
      name: 'fake org 1',
      isPublic: false,
      creatorInfo: User(firstName: 'fake', lastName: 'user'),
    );
    //check if the mocked org is present or not

    final isPresent = model.isPresentinSwitchableOrg(fakeOrg);

    //expecting that the org is not present so will return false
    expect(isPresent, false);
    //check if selected org is changed or not. Expected-Not changing
    expect(model.selectedOrg, isNot(fakeOrg));
  });

   test('check if switchOrg is working with mock joined orgs', () async {
       final model = CustomDrawerViewModel();
        final homeModel = MainScreenViewModel();
    final MockBuildContext mockContext = MockBuildContext();
      //Intializing a mock model with mockBuildContext
      model.initialize(homeModel, mockContext);
      //Storing the first switchable org in mockOrgInfo
      final OrgInfo mockChangeOrgTo = model.switchAbleOrg.first;

      //Calling the switchOrg function
      model.switchOrg(mockChangeOrgTo);

      //expecting the selected org will be equal to the mockChangeOrgto returns true
      expect(model.selectedOrg, mockChangeOrgTo);
    });

     test('setSelectedOrganizationName should update selectedOrg if different', () {
    final model = CustomDrawerViewModel();
    final orgInfo = OrgInfo(name: 'Test Org');

    model.setSelectedOrganizationName(orgInfo);

    expect(model.selectedOrg, equals(orgInfo));
  });
}

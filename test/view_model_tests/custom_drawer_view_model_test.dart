// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigationService extends Mock implements NavigationService {}

void main() {
  int testCount = 0;
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

  group('Custom Drawer Model testing -', () {
    //final mockConnectivity = getAndRegisterConnectivityService();
    final mainscreenModel = MainScreenViewModel();
    final model = CustomDrawerViewModel();
    final MockBuildContext mockBuildContext = MockBuildContext();
    //final UserConfig mockus
    tearDown(() {
      if (testCount == 5) {
        model.dispose();
      }
    });

    test('check if switchOrg is working with zero switchable orgs', () {
      print("1");
      model.setSelectedOrganizationName(userConfig.currentOrg);

      //No switchable org are present in the model
      model.switchAbleOrg = [];

      //Acess mock joined Organisation for the mock user
      final OrgInfo mockJoinedOrg =
          userConfig.currentUser.joinedOrganizations!.first;

      //check if selected org is mocked joined org .Expectation-false.
      expect(model.selectedOrg, isNot(mockJoinedOrg));
      testCount++;
    });

    test('check if switchOrg is working with wrong switchable org being passed',
        () {
      print("2");
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
      testCount++;
    });

    test('check if switchOrg is working with mock joined orgs', () async {
      print("3");
      //Intializing a mock model with mockBuildContext
      model.initialize(mainscreenModel, mockBuildContext);
      //Storing the first switchable org in mockOrgInfo
      final OrgInfo mockChangeOrgTo = model.switchAbleOrg.first;

      //Calling the switchOrg function
      model.switchOrg(mockChangeOrgTo);

      //expecting the selected org will be equal to the mockChangeOrgto returns true
      expect(model.selectedOrg, mockChangeOrgTo);
      testCount++;
    });

    test('check if switchAbleOrg getter and setter are working', () {
      final List<OrgInfo> mockOrgList = [
        OrgInfo(
          id: '1',
          name: 'org 1',
          isPublic: false,
          creatorInfo: User(firstName: 'user', lastName: '1'),
        ),
        OrgInfo(
          id: '2',
          name: 'org 2',
          isPublic: true,
          creatorInfo: User(firstName: 'user', lastName: '2'),
        ),
      ];

      model.switchAbleOrg = mockOrgList;

      expect(model.switchAbleOrg, mockOrgList);
    });

    test('check if selectedOrg getter is working', () {
      final OrgInfo mockOrg = OrgInfo(
        id: '1',
        name: 'org 1',
        isPublic: false,
        creatorInfo: User(firstName: 'user', lastName: '1'),
      );

      model.switchAbleOrg = [mockOrg];
      model.setSelectedOrganizationName(mockOrg);

      expect(model.selectedOrg, mockOrg);
    });

    test(
        'check if switchOrg is working when selectedOrg is equal to switchToOrg and switchToOrg is present',
        () {
      final OrgInfo mockOrg = OrgInfo(
        id: '1',
        name: 'org 1',
        isPublic: false,
        creatorInfo: User(firstName: 'user', lastName: '1'),
      );

      model.switchAbleOrg = [mockOrg];
      model.setSelectedOrganizationName(mockOrg);

      
    

      model.switchOrg(mockOrg);

      verify(navigationService.showTalawaErrorSnackBar(
              '${mockOrg.name} already selected', MessageType.warning,),)
          .called(1);
      verify(navigationService.pop()).called(1);
      expect(model.selectedOrg, mockOrg);
    });

    test(
        'check if switchOrg is working when selectedOrg is not equal to switchToOrg',
        () {
      final OrgInfo mockOrg1 = OrgInfo(
        id: '1',
        name: 'org 1',
        isPublic: false,
        creatorInfo: User(firstName: 'user', lastName: '1'),
      );

      final OrgInfo mockOrg2 = OrgInfo(
        id: '2',
        name: 'org 2',
        isPublic: true,
        creatorInfo: User(firstName: 'user', lastName: '2'),
      );

      model.switchAbleOrg = [mockOrg1, mockOrg2];
      model.setSelectedOrganizationName(mockOrg1);

      
    

      model.switchOrg(mockOrg2);

      verify(navigationService.showTalawaErrorSnackBar(
              'Switched to ${mockOrg2.name}', MessageType.info,),)
          .called(1);
      verify(navigationService.pop()).called(1);
      expect(model.selectedOrg, mockOrg2);
    });

    test('check if isPresentinSwitchableOrg is working correctly', () {
      final OrgInfo mockOrg1 = OrgInfo(
        id: '1',
        name: 'org 1',
        isPublic: false,
        creatorInfo: User(firstName: 'user', lastName: '1'),
      );

      final OrgInfo mockOrg2 = OrgInfo(
        id: '2',
        name: 'org 2',
        isPublic: true,
        creatorInfo: User(firstName: 'user', lastName: '2'),
      );

      model.switchAbleOrg = [mockOrg1];

      expect(model.isPresentinSwitchableOrg(mockOrg1), true);
      expect(model.isPresentinSwitchableOrg(mockOrg2), false);
    });
    // test('check if switchOrg is working with already joined mock orgs',
    //     () async {
    //   print("4");
    //   //Intializing a mock model with mockBuildContext
    //   // model.initialize(mainscreenModel, mockBuildContext);
    //   //Storing the first switchable org in mockOrgInfo
    //   final OrgInfo mockChangeOrgTo = model.switchAbleOrg.first;
    //   //Calling the switchOrg function
    //   model.switchOrg(mockChangeOrgTo);
    //   model.switchOrg(mockChangeOrgTo);

    //   //expecting the selected org will be equal to the mockChangeOrgto returns true
    //   expect(model.selectedOrg, mockChangeOrgTo);
    //   testCount++;
    // });

    // test('check if switchOrg is working with switching joined mock orgs',
    //     () async {
    //   print("5");
    //   // model.initialize(mainscreenModel, mockBuildContext);
    //   final OrgInfo mockChangeOrgTo = model.switchAbleOrg.first;
    //   final OrgInfo mockChangeOrgToLast = model.switchAbleOrg.last;
    //   model.switchOrg(mockChangeOrgTo);
    //   model.switchOrg(mockChangeOrgToLast);
    //   expect(model.selectedOrg, mockChangeOrgToLast);
    //   testCount++;
    // });
  });
}

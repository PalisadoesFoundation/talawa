// Packages imports.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/views/pages/organization/organization_settings.dart';

Widget createProfilePageScreen({bool isCreator, List userDetails}) => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
          create: (_) => GraphQLConfiguration(),
        ),
        ChangeNotifierProvider<OrgController>(
          create: (_) => OrgController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<Preferences>(
          create: (_) => Preferences(),
        ),
      ],
      child: MaterialApp(
        home: ProfilePage(isCreator: isCreator, test: userDetails),
      ),
    );

void main() {

  testLogout(WidgetTester tester)async{
    await tester.tap(find.byKey(Key('back')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('Logout')));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('ALERT_DIALOG')), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('Close')));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('PROFILE_PAGE_SCAFFOLD')), findsOneWidget);

    await tester.tap(find.byKey(Key('Logout')));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('ALERT_DIALOG')), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('Yes')));
    await tester.pumpAndSettle(Duration(milliseconds: 1000));

    expect(find.byKey(Key('SET_URL_PAGE')), findsNWidgets(0));

  }

  testSwitchOrganization(WidgetTester tester)async{
    await tester.tap(find.byKey(Key('Switch Organization')));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('SWITCH_ORGANIZATION_PAGE')), findsOneWidget);
  }

  testOrganizationSetting(WidgetTester tester,bool creator)async{
    await tester.tap(find.byKey(Key('Organization Settings')));
    await tester.pumpAndSettle();
    //finding the update organization tile so that the creator can update organization
    expect(find.byKey(Key('Update Organization')), findsOneWidget);
    //finding the Accept MemberShip Requests tile so that creator can accept member joining requests
    expect(
        find.byKey(Key('Member(s)')), findsOneWidget);
    //finding the remove organization tile so that the creator can remove the organization
    if (creator) {
      expect(find.byKey(Key('Remove This Organization')), findsOneWidget);
    }else{
      expect(find.byKey(Key('Leave Organization')), findsOneWidget);
    }

    await tester.tap(find.byKey(Key('back')));
    await tester.pumpAndSettle();
  }

  testProfile(WidgetTester tester,bool isCreator,bool isInOrg)async{
    //finding the update profile tile so that the user can update his profile
    expect(find.byKey(Key('Update Profile')), findsOneWidget);
    //finding the update join/create organization tile so that he can be a part of any organization
    expect(
        find.byKey(Key('Join or Create New Organization')), findsOneWidget);
    //finding the update logout tile so that the user can logout from the application
    expect(find.byKey(Key('Logout')), findsOneWidget);

    if(isInOrg){
      //finding the switch organization tile so can switch to any other organization from switch organization page
      expect(find.byKey(Key('Switch Organization')), findsOneWidget);
      if(isCreator){
        //finding the organization settings tile so that the user can change organization settings
        expect(find.byKey(Key('Organization Settings')), findsOneWidget);
      }else{
        //finding the organization settings tile so that the user can change organization settings
        expect(find.byKey(Key('Leave This Organization')), findsOneWidget);
      }
    }

  }

  group('Profile Page Widget Tests', () {
    //Test when there is error loading data
    testWidgets('When not able to fetch data from server', (tester) async {
      List notJoinedInAny = [];

      await tester.pumpWidget(
          createProfilePageScreen(
            isCreator: null,
            userDetails: notJoinedInAny,),
          Duration(microseconds: 100));

      //finding is the circular progress indicator is visible to user
      expect(find.byKey(Key('loading')), findsOneWidget);
    });

    //Test when the user has no current organization/not joined any organization
    testWidgets('When user is not in any organization', (tester) async {
      List notJoinedInAny = [
        {
          '_id': '60573d99cf13b54d55284aac',
          'firstName': 'Test',
          'lastName': 'Test',
          'email': 'testlogin@mail.in',
          'image': null,
          'joinedOrganizations': [],
          'createdOrganizations': [],
          'adminFor': []
        }
      ];

      await tester.pumpWidget(
          createProfilePageScreen(
            isCreator: false,
            userDetails: notJoinedInAny,
          ),
          Duration(microseconds: 100));

      //finding that the data is shown to user
      expect(find.byKey(Key('body')), findsOneWidget);
      testProfile(tester, false, false);
    });
    testWidgets('When user is creator in current organization', (tester) async {
      List joinedCreator = [
        {
          '_id': '60573d99cf13b54d55284aac',
          'firstName': 'Test',
          'lastName': 'Test',
          'email': 'testlogin@mail.in',
          'image': null,
          'joinedOrganizations': [
            {
              'image': null,
              '_id': '60581ebccf13b54d55284afd',
              'name': 'Test',
              'admins': [
                {'_id': '60573d99cf13b54d55284aac'}
              ],
              'description': 'Test',
              'isPublic': true,
              'creator': {
                '_id': '60573d99cf13b54d55284aac',
                'firstName': 'Test',
                'lastName': 'Test'
              }
            }
          ],
          'createdOrganizations': [
            {'_id': '60581ebccf13b54d55284afd', 'name': 'Test'}
          ],
          'adminFor': [
            {
              '_id': '60581ebccf13b54d55284afd',
              'name': 'Test',
              'creator': {'firstName': 'Test', 'lastName': 'Test'}
            }
          ]
        }
      ];

      await tester.pumpWidget(
          createProfilePageScreen(
            isCreator: true,
            userDetails: joinedCreator,
          ),
          Duration(microseconds: 100));

      await testProfile(tester, true, true);

      await testOrganizationSetting(tester, true);

      await testSwitchOrganization(tester);

      await testLogout(tester);
    });

    testWidgets('When user is admin in current organization', (tester) async {
      List joinedAdmin = [
        {
          '_id': '60573d99cf13b54d55284aac',
          'firstName': 'Test',
          'lastName': 'Test',
          'email': 'testlogin@mail.in',
          'image': null,
          'joinedOrganizations': [
            {
              'image': null,
              '_id': '60581ebccf13b54d55284afd',
              'name': 'Test',
              'admins': [
                {'_id': '60573d99cf13b54d55284aac'}
              ],
              'description': 'Test',
              'isPublic': true,
              'creator': {
                '_id': '60573d99cf13b54d55284aac',
                'firstName': 'Test',
                'lastName': 'Test'
              }
            }
          ],
          'createdOrganizations': [
            {'_id': '60581ebccfA5GWHd55284afa', 'name': 'Test'}
          ],
          'adminFor': [
            {
              '_id': '60581ebccf13b54d55284afd',
              'name': 'Test',
              'creator': {'firstName': 'Test', 'lastName': 'Test'}
            }
          ]
        }
      ];

      await tester.pumpWidget(
          createProfilePageScreen(
            //admins and creator's have same UI hence passing isCreator = true
            isCreator: true,
            userDetails: joinedAdmin,
          ),
          Duration(microseconds: 100));

      await testProfile(tester, true, true);

      await testOrganizationSetting(tester, false);

      await testSwitchOrganization(tester);

      await testLogout(tester);

    });

    testWidgets('When user is member in current organization', (tester) async {
      List joinedMember = [
        {
          '_id': '60573d99cf13b54d55284aac',
          'firstName': 'Test',
          'lastName': 'Test',
          'email': 'testlogin@mail.in',
          'image': null,
          'joinedOrganizations': [
            {
              'image': null,
              '_id': '5f565e1edc1b6076634d3089',
              'name': 'test org',
              'admins': [
                {'_id': '5f565e04dc1b6076634d3088'}
              ],
              'description': 'test description',
              'isPublic': true,
              'creator': {
                '_id': '5f565e04dc1b6076634d3088',
                'firstName': 'test',
                'lastName': 'Test'
              }
            }
          ],
          'createdOrganizations': [],
          'adminFor': []
        }
      ];

      await tester.pumpWidget(
          createProfilePageScreen(
            isCreator: false,
            userDetails: joinedMember,
          ),
          Duration(microseconds: 100));

      await testProfile(tester, false, true);

      await testSwitchOrganization(tester);

      await testLogout(tester);

    });
  });
}
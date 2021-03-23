import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/pages/_pages.dart';

Widget createProfileScreen({bool isCreator, List userDetails}) => MaterialApp(
      home: ProfilePage(isCreator: isCreator, test: userDetails),
    );

void main() {
  group('Profile Page Widget Tests', () {

    //Test when there is error loading data
    testWidgets('When not able to fetch data from server', (tester) async {

      List notJoinedInAny = [];

      await tester.pumpWidget(
          createProfileScreen(
            isCreator: null,
            userDetails: notJoinedInAny,
          ),
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
          createProfileScreen(
            isCreator: false,
            userDetails: notJoinedInAny,
          ),
          Duration(microseconds: 100));

      //finding that the data is shown to user
      expect(find.byKey(Key('body')), findsOneWidget);
      //finding the update profile tile so that the user can update his profile
      expect(find.byKey(Key('Update Profile')), findsOneWidget);
      //finding the update join/create organization tile so that he can be a part of any organization
      expect(
          find.byKey(Key('Join or Create New Organization')), findsOneWidget);
      //finding the update logout tile so that the user can logout from the application
      expect(find.byKey(Key('Logout')), findsOneWidget);
    });
    testWidgets('When user is member in current organization', (tester) async {

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
          createProfileScreen(
            isCreator: true,
            userDetails: joinedCreator,
          ),
          Duration(microseconds: 100));

      expect(find.byKey(Key('Update Profile')), findsOneWidget);
      //finding the switch organization tile so can switch to any other organization from switch organization page
      expect(find.byKey(Key('Switch Organization')), findsOneWidget);
      //finding the join/create organization tile so that he can be a part of any organization
      expect(
          find.byKey(Key('Join or Create New Organization')), findsOneWidget);
      //finding the organization settings tile so that the user can change organization settings
      expect(find.byKey(Key('Organization Settings')), findsOneWidget);
      //finding the update logout tile so that the user can logout from the application
      expect(find.byKey(Key('Logout')), findsOneWidget);
    });

    testWidgets('When user is member in current organization', (tester) async {

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
          createProfileScreen(
            //admins and creator's have same UI hence passing isCreator = true
            isCreator: true,
            userDetails: joinedAdmin,
          ),
          Duration(microseconds: 100));

      expect(find.byKey(Key('Update Profile')), findsOneWidget);
      //finding the switch organization tile so can switch to any other organization from switch organization page
      expect(find.byKey(Key('Switch Organization')), findsOneWidget);
      //finding the join/create organization tile so that he can be a part of any organization
      expect(
          find.byKey(Key('Join or Create New Organization')), findsOneWidget);
      //finding the organization settings tile so that the user can change organization settings
      expect(find.byKey(Key('Organization Settings')), findsOneWidget);
      //finding the update logout tile so that the user can logout from the application
      expect(find.byKey(Key('Logout')), findsOneWidget);
    });

    testWidgets('When user is creator/admin in current organization',
        (tester) async {

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
          createProfileScreen(
            isCreator: false,
            userDetails: joinedMember,
          ),
          Duration(microseconds: 100));

      expect(find.byKey(Key('Update Profile')), findsOneWidget);
      //finding the switch organization tile so can switch to any other organization from switch organization page
      expect(find.byKey(Key('Switch Organization')), findsOneWidget);
      //finding the join/create organization tile so that he can be a part of any organization
      expect(
          find.byKey(Key('Join or Create New Organization')), findsOneWidget);
      //finding the leave organization tile so that the user can leave the current organization
      expect(find.byKey(Key('Leave This Organization')), findsOneWidget);
      //finding the update logout tile so that the user can logout from the application
      expect(find.byKey(Key('Logout')), findsOneWidget);
    });
  });
}

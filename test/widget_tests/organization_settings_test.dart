import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/pages/organization/organization_settings.dart';

Widget createProfileScreen({bool isCreator, List organization,bool public}) => MaterialApp(
  home: OrganizationSettings(creator: isCreator, organization: organization,public: public,),
);

void main() {
  group('Organization Page Widget Tests', ()
  {
    testWidgets(
        'When user is creator of the organization and organization is not public', (
        tester) async {
      List joinedCreator = [
        {
          'image': null,
          '_id': '60581ebccf13b54d55284afd',
          'name': 'Test',
          'admins': [
            {'_id': '60573d99cf13b54d55284aac'}
          ],
          'description': 'Test',
          'isPublic': false,
          'creator': {
            '_id': '60573d99cf13b54d55284aac',
            'firstName': 'Test',
            'lastName': 'Test'
          }
        }
      ];

      await tester.pumpWidget(
          createProfileScreen(
            public: false,
            isCreator: true,
            organization: joinedCreator,
          ),
          Duration(microseconds: 100));

      //finding the update organization tile so that the creator can update organization
      expect(find.byKey(Key('Update Organization')), findsOneWidget);
      //finding the Accept MemberShip Requests tile so that creator can accept member joining requests
      expect(find.byKey(Key('Accept MemberShip Requests')), findsOneWidget);
      //finding the Member(s) tile so that the creator can see all the members of the organization and can remove/make them admin
      expect(
          find.byKey(Key('Member(s)')), findsOneWidget);
      //finding the remove organization tile so that the creator can remove the organization
      expect(find.byKey(Key('Remove This Organization')), findsOneWidget);
    });

    testWidgets(
        'When user is creator of the organization and organization is public', (
        tester) async {
      List joinedCreator = [
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
      ];

      await tester.pumpWidget(
          createProfileScreen(
            public: false,
            isCreator: true,
            organization: joinedCreator,
          ),
          Duration(microseconds: 100));

      //finding the update organization tile so that the creator can update organization
      expect(find.byKey(Key('Update Organization')), findsOneWidget);
      //finding the Accept MemberShip Requests tile so that creator can accept member joining requests
      expect(
          find.byKey(Key('Member(s)')), findsOneWidget);
      //finding the remove organization tile so that the creator can remove the organization
      expect(find.byKey(Key('Remove This Organization')), findsOneWidget);
    });

    testWidgets('When user is admin of the organization and organization is  not public', (tester) async {
      List joinedCreator = [
        {
          'image': null,
          '_id': '60581ebccf13b54d55284afd',
          'name': 'Test',
          'admins': [
            {'_id': '60573d99cf13b54d55284aac'}
          ],
          'description': 'Test',
          'isPublic': false,
          'creator': {
            '_id': '60573d99cf13b54d55284aac',
            'firstName': 'Test',
            'lastName': 'Test'
          }
        }
      ];

      await tester.pumpWidget(
          createProfileScreen(
            public: false,
            isCreator: false,
            organization: joinedCreator,
          ),
          Duration(microseconds: 100));

      //finding the update organization tile so that the admin can update organization
      expect(find.byKey(Key('Update Organization')), findsOneWidget);
      //finding the Accept MemberShip Requests tile so that admin can accept member joining requests
      expect(find.byKey(Key('Accept MemberShip Requests')), findsOneWidget);
      //finding the Member(s) tile so that the admin can see all the members of the organization and can remove/make them admin
      expect(
          find.byKey(Key('Member(s)')), findsOneWidget);
      //finding the leave organization tile so that the admin can leave the organization
      expect(find.byKey(Key('Leave Organization')), findsOneWidget);
    });

    testWidgets('When user is admin of the organization and organization is public', (tester) async {
      List joinedCreator = [
        {
          'image': null,
          '_id': '60581ebccf13b54d55284afd',
          'name': 'Test',
          'admins': [
            {'_id': '60573d99cf13b54d55284aac'}
          ],
          'description': 'Test',
          'isPublic': false,
          'creator': {
            '_id': '60573d99cf13b54d55284aac',
            'firstName': 'Test',
            'lastName': 'Test'
          }
        }
      ];

      await tester.pumpWidget(
          createProfileScreen(
            public: false,
            isCreator: false,
            organization: joinedCreator,
          ),
          Duration(microseconds: 100));

      //finding the update organization tile so that the creator can update organization
      expect(find.byKey(Key('Update Organization')), findsOneWidget);
      //finding the Accept MemberShip Requests tile so that creator can accept member joining requests
      expect(
          find.byKey(Key('Member(s)')), findsOneWidget);
      //finding the leave organization tile so that the admin can leave the organization
      expect(find.byKey(Key('Leave Organization')), findsOneWidget);
    });
  });
}

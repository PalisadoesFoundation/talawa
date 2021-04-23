import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/members/member_details.dart';

Widget createProfileScreen(
        {String creatorId, List admins, Map member, Color color}) =>
    MultiProvider(
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
            home: MemberDetail(
          color: color,
          creatorId: creatorId,
          admins: admins,
          member: member,
        )));

void main() {
  group('Member Info Page Widget Tests', () {
    testWidgets('When member is creator of the organization ', (tester) async {
      final Map memberData = {
        '_id': '5f566b32dc1b6076634d30a0',
        'firstName': 'Arya',
        'lastName': 'Stark',
        'email': 'arya@stark.com',
        'image': null
      };
      final List adminsData = [
        {'_id': '5f566b32dc1b6076634d30a0'},
        {'_id': '5f566b32dsie6076634d30a0'}
      ];
      await tester.pumpWidget(
          createProfileScreen(
              admins: adminsData,
              creatorId: '5f566b32dc1b6076634d30a0',
              member: memberData,
              color: Colors.blue),
          const Duration(microseconds: 100));

      final privilegeFinder = find.text('User Privileges: Creator');
      //finding the privilege text widget
      expect(privilegeFinder, findsOneWidget);
    });

    testWidgets('When member is admin of the organization ', (tester) async {
      final Map memberData = {
        '_id': '5f566b32dc1b6076634d30a0',
        'firstName': 'Arya',
        'lastName': 'Stark',
        'email': 'arya@stark.com',
        'image': null
      };
      final List adminsData = [
        {'_id': '5f566b32dc1b6076634d30a0'},
        {'_id': '5f566badsie6076634d30a0'}
      ];
      await tester.pumpWidget(
          createProfileScreen(
              admins: adminsData,
              creatorId: '5f566b32dc1b60766ake30a0',
              member: memberData,
              color: Colors.blue),
          const Duration(microseconds: 100));

      final privilegeFinder = find.text('User Privileges: Admin');
      //finding the privilege text widget
      expect(privilegeFinder, findsOneWidget);
    });

    testWidgets('When member is not a creator/admin of the organization ',
        (tester) async {
      final Map memberData = {
        '_id': '5f566b32dc1b6076634d30a0',
        'firstName': 'Arya',
        'lastName': 'Stark',
        'email': 'arya@stark.com',
        'image': null
      };
      final List adminsData = [
        {'_id': '5f566b32dc2j5076634d30a0'},
        {'_id': '5f566badsie6076634d30a0'}
      ];
      await tester.pumpWidget(
          createProfileScreen(
              admins: adminsData,
              creatorId: '5f566b32dc1b60766ake30a0',
              member: memberData,
              color: Colors.blue),
          const Duration(microseconds: 100));

      final privilegeFinder = find.text('User Privileges: Member');
      //finding the privilege text widget
      expect(privilegeFinder, findsOneWidget);
    });
  });
}

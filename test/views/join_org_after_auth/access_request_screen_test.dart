import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/apptheme.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/access_request_view_model.dart';
import 'package:talawa/views/after_auth_screens/join_org_after_auth/access_request_screen.dart';

import 'access_request_screen_test.mocks.dart';

// Mock ViewModel
@GenerateMocks([AccessScreenViewModel])
class MockOrgInfo extends Mock implements OrgInfo{}
final locator = GetIt.instance;

bool isTap=false;

void main() {
  late MockAccessScreenViewModel mockViewModel=MockAccessScreenViewModel();
  final MockOrgInfo mockOrg = MockOrgInfo(); // You may customize this with actual data.

  setUp(() {
    locator.registerFactory(() => AccessScreenViewModel());
    locator.registerFactory(() => DataBaseMutationFunctions());
    locator.registerFactory(() => Queries());
    // mockViewModel=MockAccessScreenViewModel();
  });

  tearDown((){
    locator.unregister<AccessScreenViewModel>();
    locator.unregister<DataBaseMutationFunctions>();
    locator.unregister<Queries>();
  });

  group('SendAccessRequest Widget Tests', () {

    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SendAccessRequest(org: mockOrg),
        ),
      );
      await tester.pump();
      expect(find.byType(SendAccessRequest), findsOneWidget);
      expect(find.text("You need access"), findsOneWidget);
      expect(find.text("Request access, or switch to an account with access"), findsOneWidget);
      expect(find.text("Message (optional)"), findsOneWidget);
      expect(find.text("Request Access"), findsOneWidget);
    });

    testWidgets('Tap on Request Access button triggers sendMembershipRequest', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TextButton(
              onPressed: () {
                mockViewModel.sendMembershipRequest();
              },
              style:
              TextButton.styleFrom(backgroundColor: AppTheme.green),
              child: const Text(
                "Request Access",
                style: TextStyle(
                  color: AppTheme.white,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
      // Tap on the Request Access button
      expect(find.text("Request Access"),findsOneWidget);
      await tester.tap(find.byType(TextButton));
      // Verify that sendMembershipRequest is called
      verify(mockViewModel.sendMembershipRequest()).called(1);
    });

  });
}

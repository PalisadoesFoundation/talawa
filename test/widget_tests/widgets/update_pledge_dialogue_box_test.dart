// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/funds_view_models/fund_view_model.dart';
import 'package:talawa/widgets/update_pledge_dialogue_box.dart';

class MockFundViewModel extends Mock implements FundViewModel {
  @override
  String get donationCurrency => 'USD';

  @override
  String get donationCurrencySymbol => '\$';

  @override
  List<User> get orgMembersList => [
        User(
          id: '1',
          firstName: 'John',
          lastName: 'Doe',
        ),
        User(
          id: '2',
          firstName: 'Jane',
          lastName: 'Smith',
        ),
        User(
          id: '3',
          firstName: 'Bob',
          lastName: 'Johnson',
        ),
      ];
}

Widget createUpdatePledgeDialog({
  required Function(Map<String, dynamic>) onSubmit,
  required FundViewModel model,
  required Pledge pledge,
}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: Builder(
        builder: (context) => TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => UpdatePledgeDialog(
                onSubmit: onSubmit,
                model: model,
                pledge: pledge,
              ),
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    ),
  );
}

void main() {
  late MockFundViewModel mockModel;
  late Map<String, dynamic> submittedData;
  late Pledge testPledge;

  setUp(() {
    mockModel = MockFundViewModel();
    submittedData = {};
    testPledge = Pledge(
      id: '123',
      amount: 100,
      startDate: DateTime(2024, 1, 1),
      endDate: DateTime(2024, 12, 31),
      pledgers: [
        User(
          id: '1',
          firstName: 'John',
          lastName: 'Doe',
        ),
      ],
    );
  });

  group('UpdatePledgeDialog Widget Tests', () {
    testWidgets('Dialog shows up with correct initial state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Verify initial state
      expect(find.text('Update Pledge'), findsOneWidget);
      expect(find.text('Select Pledger:'), findsOneWidget);
      expect(find.text('100'), findsOneWidget);
      expect(find.text('USD'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.textContaining('Start: Jan 1, 2024'), findsOneWidget);
      expect(find.textContaining('End: Dec 31, 2024'), findsOneWidget);
    });

    testWidgets('Can add new pledgers from popup menu',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Open pledger selection menu
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Select a new pledger
      await tester.tap(find.text('Jane Smith').last);
      await tester.pumpAndSettle();

      // Verify both pledgers are shown
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Jane Smith'), findsOneWidget);
      expect(find.byType(Chip), findsNWidgets(2));
    });

    testWidgets('Can remove pledgers', (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Remove existing pledger
      await tester.tap(find.byIcon(Icons.cancel));
      await tester.pumpAndSettle();

      // Verify pledger is removed
      expect(find.byType(Chip), findsNothing);
    });

    testWidgets('Can update dates', (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Update start date
      await tester.tap(find.textContaining('Start:'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Update end date
      await tester.tap(find.textContaining('End:'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Verify dates are updated
      expect(find.textContaining('Start:'), findsOneWidget);
      expect(find.textContaining('End:'), findsOneWidget);
    });

    testWidgets('Update button is disabled when no changes are made',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Verify update button is disabled
      final updateButton = find.text('Update');
      expect(
        tester
            .widget<ElevatedButton>(
              find.ancestor(
                of: updateButton,
                matching: find.byType(ElevatedButton),
              ),
            )
            .onPressed,
        null,
      );
    });

    testWidgets('Update button is enabled when changes are made',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Verify initial state - update button should be disabled
      final initialUpdateButton = tester.widget<ElevatedButton>(
        find.byKey(const Key('update_btn')),
      );
      expect(initialUpdateButton.onPressed, null);

      // Change amount
      await tester.enterText(find.byKey(const Key('amount_field')), '200');
      await tester.pumpAndSettle();

      // Verify initial state - update button should be disabled
      final updateButton = tester.widget<ElevatedButton>(
        find.byKey(const Key('update_btn')),
      );
      expect(updateButton.onPressed, isNotNull);
    });

    testWidgets('Can submit valid form with updates',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Update amount
      await tester.enterText(find.byType(TextFormField), '200');
      await tester.pumpAndSettle();

      // Add new pledger
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Jane Smith').last);
      await tester.pumpAndSettle();

      // Submit form
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();

      // Verify form submission
      expect(submittedData.isEmpty, false);
      expect(submittedData['id'], '123');
      expect(submittedData['amount'], 200.0);
      expect(submittedData['users'], ['1', '2']);
    });

    testWidgets('Can cancel dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Cancel dialog
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Verify dialog is closed
      expect(find.text('Update Pledge'), findsNothing);
    });

    testWidgets('Shows error message when form is invalid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          pledge: testPledge,
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Remove all pledgers
      await tester.tap(find.byIcon(Icons.cancel));
      await tester.pumpAndSettle();

      // Clear amount
      await tester.enterText(find.byType(TextFormField), '');
      await tester.pumpAndSettle();

      // Try to submit
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();

      // Verify error message
      expect(find.text('Please fill all fields'), findsOneWidget);
    });

    group('_getChangedFields Tests', () {
      testWidgets('Returns only id when no changes are made',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          createUpdatePledgeDialog(
            onSubmit: (data) => submittedData = data,
            model: mockModel,
            pledge: testPledge,
          ),
        );
        await tester.pumpAndSettle();

        // Open dialog
        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        // Verify only id is in the changed fields
        expect(submittedData['id'], '123');
        expect(submittedData.length, 1);
      });

      testWidgets('Correctly identifies changed amount',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          createUpdatePledgeDialog(
            onSubmit: (data) => submittedData = data,
            model: mockModel,
            pledge: testPledge,
          ),
        );
        await tester.pumpAndSettle();

        // Open dialog
        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        // Change amount
        await tester.enterText(find.byKey(const Key('amount_field')), '200');
        await tester.pumpAndSettle();

        // Submit form
        await tester.tap(find.text('Update'));
        await tester.pumpAndSettle();

        // Verify changed fields
        expect(submittedData['id'], '123');
        expect(submittedData['amount'], 200.0);
        expect(submittedData.containsKey('currency'), false);
        expect(submittedData.containsKey('startDate'), false);
        expect(submittedData.containsKey('endDate'), false);
        expect(submittedData.containsKey('users'), false);
      });

      testWidgets('Correctly identifies changed dates',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          createUpdatePledgeDialog(
            onSubmit: (data) => submittedData = data,
            model: mockModel,
            pledge: testPledge,
          ),
        );
        await tester.pumpAndSettle();

        // Open dialog
        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        // Change start date
        await tester.tap(find.textContaining('Start:'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        // Change end date
        await tester.tap(find.textContaining('End:'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        // Submit form
        await tester.tap(find.text('Update'));
        await tester.pumpAndSettle();

        // Verify changed fields include dates
        expect(submittedData['id'], '123');
        expect(submittedData.containsKey('startDate'), true);
        expect(submittedData.containsKey('endDate'), true);
        expect(submittedData.containsKey('amount'), false);
        expect(submittedData.containsKey('currency'), false);
        expect(submittedData.containsKey('users'), false);
      });

      testWidgets('Correctly identifies changed pledgers',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          createUpdatePledgeDialog(
            onSubmit: (data) => submittedData = data,
            model: mockModel,
            pledge: testPledge,
          ),
        );
        await tester.pumpAndSettle();

        // Open dialog
        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        // Add new pledger
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Jane Smith').last);
        await tester.pumpAndSettle();

        // Submit form
        await tester.tap(find.text('Update'));
        await tester.pumpAndSettle();

        // Verify changed fields include users
        expect(submittedData['id'], '123');
        expect(submittedData['users'], ['1', '2']);
        expect(submittedData.containsKey('amount'), false);
        expect(submittedData.containsKey('currency'), false);
        expect(submittedData.containsKey('startDate'), false);
        expect(submittedData.containsKey('endDate'), false);
      });

      testWidgets('Correctly identifies multiple changes',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          createUpdatePledgeDialog(
            onSubmit: (data) => submittedData = data,
            model: mockModel,
            pledge: testPledge,
          ),
        );
        await tester.pumpAndSettle();

        // Open dialog
        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        // Change amount
        await tester.enterText(find.byKey(const Key('amount_field')), '200');
        await tester.pumpAndSettle();

        // Add new pledger
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Jane Smith').last);
        await tester.pumpAndSettle();

        // Change dates
        await tester.tap(find.textContaining('Start:'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        // Submit form
        await tester.tap(find.text('Update'));
        await tester.pumpAndSettle();

        // Verify all changed fields are included
        expect(submittedData['id'], '123');
        expect(submittedData['amount'], 200.0);
        expect(submittedData['users'], ['1', '2']);
        expect(submittedData.containsKey('startDate'), true);
        expect(submittedData.containsKey('currency'), false);
      });

      testWidgets('Handles invalid amount input gracefully',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          createUpdatePledgeDialog(
            onSubmit: (data) => submittedData = data,
            model: mockModel,
            pledge: testPledge,
          ),
        );
        await tester.pumpAndSettle();

        // Open dialog
        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        // Enter invalid amount
        await tester.enterText(
          find.byKey(const Key('amount_field')),
          'invalid',
        );
        await tester.pumpAndSettle();

        // Verify form validation prevents submission
        expect(find.text('Please enter an amount'), findsOneWidget);
      });
      group('_getChangedFields Tests', () {
        testWidgets('Correctly identifies changed amount',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            createUpdatePledgeDialog(
              onSubmit: (data) => submittedData = data,
              model: mockModel,
              pledge: testPledge,
            ),
          );
          await tester.pumpAndSettle();

          // Open dialog
          await tester.tap(find.text('Show Dialog'));
          await tester.pumpAndSettle();

          // Change amount
          await tester.enterText(find.byKey(const Key('amount_field')), '200');
          await tester.pumpAndSettle();

          // Submit form
          await tester.tap(find.text('Update'));
          await tester.pumpAndSettle();

          // Verify changed fields
          expect(submittedData['id'], '123');
          expect(submittedData['amount'], 200.0);
          expect(submittedData.containsKey('currency'), false);
          expect(submittedData.containsKey('startDate'), false);
          expect(submittedData.containsKey('endDate'), false);
          expect(submittedData.containsKey('users'), false);
        });
        testWidgets('Correctly identifies changed pledgers',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            createUpdatePledgeDialog(
              onSubmit: (data) => submittedData = data,
              model: mockModel,
              pledge: testPledge,
            ),
          );
          await tester.pumpAndSettle();

          // Open dialog
          await tester.tap(find.text('Show Dialog'));
          await tester.pumpAndSettle();

          // Add new pledger
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Jane Smith').last);
          await tester.pumpAndSettle();

          // Submit form
          await tester.tap(find.text('Update'));
          await tester.pumpAndSettle();

          // Verify changed fields include users
          expect(submittedData['id'], '123');
          expect(submittedData['users'], ['1', '2']);
          expect(submittedData.containsKey('amount'), false);
          expect(submittedData.containsKey('currency'), false);
          expect(submittedData.containsKey('startDate'), false);
          expect(submittedData.containsKey('endDate'), false);
        });

        testWidgets('Correctly identifies multiple changes',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            createUpdatePledgeDialog(
              onSubmit: (data) => submittedData = data,
              model: mockModel,
              pledge: testPledge,
            ),
          );
          await tester.pumpAndSettle();

          // Open dialog
          await tester.tap(find.text('Show Dialog'));
          await tester.pumpAndSettle();

          // Change amount
          await tester.enterText(find.byKey(const Key('amount_field')), '200');
          await tester.pumpAndSettle();

          // Add new pledger
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();
          await tester.tap(find.text('Jane Smith').last);
          await tester.pumpAndSettle();

          // Submit form
          await tester.tap(find.text('Update'));
          await tester.pumpAndSettle();

          // Verify all changed fields are included
          expect(submittedData['id'], '123');
          expect(submittedData['amount'], 200.0);
          expect(submittedData['users'], ['1', '2']);
          expect(submittedData.containsKey('currency'), false);
        });
      });
    });
  });
}

// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/funds_view_models/fund_view_model.dart';
import 'package:talawa/widgets/add_pledge_dialogue_box.dart';

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

Widget createAddPledgeDialog({
  required Function(Map<String, dynamic>) onSubmit,
  required FundViewModel model,
  required String campaignId,
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
              builder: (context) => AddPledgeDialog(
                onSubmit: onSubmit,
                model: model,
                campaignId: campaignId,
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

  setUp(() {
    mockModel = MockFundViewModel();
    submittedData = {};
  });

  group('AddPledgeDialog Widget Tests', () {
    testWidgets('Dialog shows up with correct initial state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          campaignId: '123',
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Verify initial state
      expect(find.text('Create Pledge'), findsOneWidget);
      expect(find.text('Select Pledger:'), findsOneWidget);
      expect(find.text('Select Start date'), findsOneWidget);
      expect(find.text('Select End date'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('USD'), findsOneWidget);
    });

    testWidgets('Can select pledgers from popup menu',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          campaignId: '123',
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Open pledger selection menu
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Select a pledger
      await tester.tap(find.text('John Doe').last);
      await tester.pumpAndSettle();

      // Verify pledger chip appears
      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('Can remove selected pledgers', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          campaignId: '123',
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Add a pledger
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('John Doe').last);
      await tester.pumpAndSettle();

      // Remove the pledger
      await tester.tap(find.byIcon(Icons.cancel));
      await tester.pumpAndSettle();

      // Verify pledger is removed
      expect(find.byType(Chip), findsNothing);
    });

    testWidgets('Can select dates', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          campaignId: '123',
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Select start date
      await tester.tap(find.text('Select Start date'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Verify start date is selected
      expect(find.text('Select Start date'), findsNothing);
      expect(find.textContaining('Start:'), findsOneWidget);

      // Select end date
      await tester.tap(find.text('Select End date'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Verify end date is selected
      expect(find.text('Select End date'), findsNothing);
      expect(find.textContaining('End:'), findsOneWidget);
    });

    testWidgets('Form validation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          campaignId: '123',
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Try to submit empty form
      await tester.tap(find.text('Create'));
      await tester.pumpAndSettle();

      // Verify error message
      expect(find.text('Please fill all fields'), findsOneWidget);
    });

    testWidgets('Can submit valid form', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          campaignId: '123',
        ),
      );
      await tester.pumpAndSettle();

      // Open dialog
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      // Fill form
      // Add pledger
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('John Doe').last);
      await tester.pumpAndSettle();

      // Enter amount
      await tester.enterText(find.byType(TextFormField), '100');

      // Select dates
      await tester.tap(find.text('Select Start date'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Select End date'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      // Submit form
      await tester.tap(find.text('Create'));
      await tester.pumpAndSettle();

      // Verify form submission
      expect(submittedData.isEmpty, false);
      expect(submittedData['campaignId'], '123');
      expect(submittedData['amount'], 100.0);
      expect(submittedData['userIds'], ['1']);
      expect(submittedData['currency'], 'USD');
    });

    testWidgets('Can cancel dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(
          onSubmit: (data) => submittedData = data,
          model: mockModel,
          campaignId: '123',
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
      expect(find.text('Create Pledge'), findsNothing);
    });
  });
}

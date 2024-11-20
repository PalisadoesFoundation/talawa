// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/pledge_card.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

Widget createPledgeCard({
  required Pledge pledge,
  VoidCallback? onUpdate,
  VoidCallback? onDelete,
}) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: PledgeCard(
        pledge: pledge,
        onUpdate: onUpdate ?? () {},
        onDelete: onDelete ?? () {},
      ),
    ),
  );
}

final mockPledge = Pledge(
  id: '1',
  amount: 1000,
  startDate: DateTime(2024, 1, 1),
  endDate: DateTime(2024, 12, 31),
  pledgers: [
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
    User(
      id: '4',
      firstName: 'Alice',
      lastName: 'Brown',
    ),
  ],
);

void main() {
  testSetupLocator();
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDownAll(() {
    unregisterServices();
  });
  group('PledgeCard Widget Tests', () {
    testWidgets('PledgeCard displays basic information correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(createPledgeCard(pledge: mockPledge));
      await tester.pumpAndSettle();

      // Verify header
      expect(find.text('Pledge Group'), findsOneWidget);

      // Verify amount information
      expect(find.text('Pledged'), findsOneWidget);
      expect(find.text('\$1000.00'), findsOneWidget);
      expect(find.text('Donated'), findsOneWidget);
      expect(find.text('\$0.00'), findsOneWidget);

      // Verify dates
      expect(find.text('Start Date'), findsOneWidget);
      expect(find.text('End Date'), findsOneWidget);
      expect(
        find.text(DateFormat('MMM d, y').format(DateTime(2024, 1, 1))),
        findsOneWidget,
      );
      expect(
        find.text(DateFormat('MMM d, y').format(DateTime(2024, 12, 31))),
        findsOneWidget,
      );
    });

    testWidgets('PledgeCard displays correct number of pledgers',
        (WidgetTester tester) async {
      await tester.pumpWidget(createPledgeCard(pledge: mockPledge));
      await tester.pumpAndSettle();

      // Verify pledgers section
      expect(find.text('Pledgers'), findsOneWidget);

      // Should show first 3 pledgers
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Jane Smith'), findsOneWidget);
      expect(find.text('Bob Johnson'), findsOneWidget);

      // Should show +1 more chip for the remaining pledger
      expect(find.text('+1 more'), findsOneWidget);
    });

    testWidgets('PledgeCard handles null dates correctly',
        (WidgetTester tester) async {
      final pledgeWithNullDates = Pledge(
        id: '1',
        amount: 1000,
        startDate: null,
        endDate: null,
        pledgers: [],
      );

      await tester.pumpWidget(createPledgeCard(pledge: pledgeWithNullDates));
      await tester.pumpAndSettle();

      expect(find.text('N/A'), findsNWidgets(2));
    });

    testWidgets('PledgeCard handles empty pledgers list',
        (WidgetTester tester) async {
      final pledgeWithNoPledgers = Pledge(
        id: '1',
        amount: 1000,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        pledgers: [],
      );

      await tester.pumpWidget(createPledgeCard(pledge: pledgeWithNoPledgers));
      await tester.pumpAndSettle();

      expect(find.byType(Chip), findsNothing);
    });

    testWidgets('Update and Delete buttons trigger callbacks',
        (WidgetTester tester) async {
      bool updatePressed = false;
      bool deletePressed = false;

      await tester.pumpWidget(
        createPledgeCard(
          pledge: mockPledge,
          onUpdate: () => updatePressed = true,
          onDelete: () => deletePressed = true,
        ),
      );
      await tester.pumpAndSettle();

      // Test Update button
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();
      expect(updatePressed, true);

      // Test Delete button
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      expect(deletePressed, true);
    });
  });
}

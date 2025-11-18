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
  pledger: User(
    id: '1',
    name: 'John Doe',
    image: null,
  ),
  note: 'Test note',
  creator: User(
    id: '2',
    name: 'Jane Smith',
    image: null,
  ),
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
      expect(find.text('Pledge'), findsOneWidget);

      // Verify amount information
      expect(find.text('Pledged'), findsOneWidget);
      expect(find.text('USD 1000.00'), findsOneWidget);
      expect(find.text('Donated'), findsOneWidget);
      expect(find.text('USD 0.00'), findsOneWidget);

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

      // Verify note
      expect(find.text('Note'), findsOneWidget);
      expect(find.text('Test note'), findsOneWidget);

      // Verify creator
      expect(find.textContaining('Creator: Jane Smith'), findsOneWidget);
    });

    testWidgets('PledgeCard displays pledger chip',
        (WidgetTester tester) async {
      await tester.pumpWidget(createPledgeCard(pledge: mockPledge));
      await tester.pumpAndSettle();
      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('PledgeCard handles null dates and note',
        (WidgetTester tester) async {
      final pledgeWithNullDates = Pledge(
        id: '1',
        amount: 1000,
        startDate: null,
        endDate: null,
        pledger: null,
        note: null,
        creator: null,
      );

      await tester.pumpWidget(createPledgeCard(pledge: pledgeWithNullDates));
      await tester.pumpAndSettle();

      expect(find.text('N/A'), findsNWidgets(2));
      expect(find.text('No note provided'), findsOneWidget);
      expect(find.textContaining('Creator: Unknown Creator'), findsOneWidget);
    });

    testWidgets('PledgeCard handles no pledger', (WidgetTester tester) async {
      final pledgeWithNoPledger = Pledge(
        id: '1',
        amount: 1000,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        pledger: null,
        note: 'Test note',
        creator: null,
      );

      await tester.pumpWidget(createPledgeCard(pledge: pledgeWithNoPledger));
      await tester.pumpAndSettle();

      expect(find.byType(Chip), findsNothing);
    });

    testWidgets('PledgeCard displays Unknown Pledger if pledger name is null',
        (WidgetTester tester) async {
      final pledgeWithUnknownPledger = Pledge(
        id: '2',
        amount: 500,
        startDate: DateTime(2024, 6, 1),
        endDate: DateTime(2024, 6, 30),
        pledger: User(id: '2', name: null, image: null),
        note: 'No name pledger',
        creator: null,
      );
      await tester
          .pumpWidget(createPledgeCard(pledge: pledgeWithUnknownPledger));
      await tester.pumpAndSettle();
      expect(find.text('Unknown Pledger'), findsOneWidget);
    });

    testWidgets('PledgeCard displays Unknown Creator if creator is null',
        (WidgetTester tester) async {
      final pledgeWithUnknownCreator = Pledge(
        id: '3',
        amount: 250,
        startDate: DateTime(2024, 7, 1),
        endDate: DateTime(2024, 7, 31),
        pledger: User(id: '3', name: 'Sam Smith', image: null),
        note: 'Test note',
        creator: null,
      );
      await tester
          .pumpWidget(createPledgeCard(pledge: pledgeWithUnknownCreator));
      await tester.pumpAndSettle();
      expect(find.textContaining('Creator: Unknown Creator'), findsOneWidget);
    });

    testWidgets('PledgeCard displays correct currency if set',
        (WidgetTester tester) async {
      final pledgeWithCurrency = Pledge(
        id: '4',
        amount: 300,
        startDate: DateTime(2024, 8, 1),
        endDate: DateTime(2024, 8, 31),
        pledger: User(id: '4', name: 'Alex Brown', image: null),
        note: 'Currency test',
        creator: User(id: '5', name: 'Chris Green', image: null),
        currency: 'EUR',
      );
      await tester.pumpWidget(createPledgeCard(pledge: pledgeWithCurrency));
      await tester.pumpAndSettle();
      expect(find.text('EUR 300.00'), findsOneWidget);
      expect(find.text('EUR 0.00'), findsOneWidget);
    });

    testWidgets(
        'PledgeCard does not show update/delete buttons for other users',
        (WidgetTester tester) async {
      final pledgeOtherUser = Pledge(
        id: '5',
        amount: 400,
        startDate: DateTime(2024, 9, 1),
        endDate: DateTime(2024, 9, 30),
        pledger: User(
          id: 'other',
          name: 'Other User',
          image: null,
        ),
        note: 'Other user',
        creator: null,
      );
      await tester.pumpWidget(createPledgeCard(pledge: pledgeOtherUser));
      await tester.pumpAndSettle();
      expect(find.text('Update'), findsNothing);
      expect(find.text('Delete'), findsNothing);
    });
  });
}

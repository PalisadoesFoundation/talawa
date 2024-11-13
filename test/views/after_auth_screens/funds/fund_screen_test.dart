// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/funds/fundraising_campaigns_screen.dart';
import 'package:talawa/views/after_auth_screens/funds/funds_screen.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createFundScreen() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: const FundScreen(),
    navigatorKey: locator<NavigationService>().navigatorKey,
    onGenerateRoute: router.generateRoute,
  );
}

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

  group('FundScreen Widget Tests', () {
    testWidgets('Check if FundScreen shows up', (tester) async {
      await tester.pumpWidget(createFundScreen());
      await tester.pumpAndSettle();

      expect(find.byType(FundScreen), findsOneWidget);
      expect(find.text('Funds'), findsOneWidget);
    });

    testWidgets('Test search functionality', (tester) async {
      final mockFundService = locator<FundService>();
      final mockFunds = [
        Fund(
          id: '1',
          name: 'Test Fund',
          creator: User(firstName: 'John', lastName: 'Doe'),
        ),
        Fund(
          id: '2',
          name: 'Fund 2',
          creator: User(firstName: 'John1', lastName: 'Doe2'),
        ),
      ];
      when(mockFundService.getFunds(orderBy: 'createdAt_DESC'))
          .thenAnswer((_) async => mockFunds);

      await tester.pumpWidget(createFundScreen());
      await tester.pumpAndSettle();

      // Find and interact with search field
      final searchField = find.byType(TextField).first;
      expect(searchField, findsOneWidget);

      await tester.enterText(searchField, 'Test');
      await tester.pumpAndSettle();

      // Verify that the filtered fund is displayed
      expect(find.text('Test Fund'), findsOneWidget);
      expect(find.text('Fund 2'), findsNothing);
    });

    testWidgets('Test sort dropdown functionality', (tester) async {
      await tester.pumpWidget(createFundScreen());
      await tester.pumpAndSettle();

      // Find dropdown
      final dropdownButton = find.byType(DropdownButton<String>);
      expect(dropdownButton, findsOneWidget);

      // Open dropdown
      await tester.tap(dropdownButton);
      await tester.pumpAndSettle();

      // Verify dropdown items
      expect(find.text('Newest'), findsWidgets);
      expect(find.text('Oldest'), findsOneWidget);
    });

    testWidgets('Test fund list view when empty', (tester) async {
      final mockFundService = locator<FundService>();
      when(mockFundService.getFunds(orderBy: 'createdAt_DESC'))
          .thenAnswer((_) async => []);
      await tester.pumpWidget(createFundScreen());
      await tester.pumpAndSettle();

      expect(find.text('No funds in this organization.'), findsOneWidget);
    });

    testWidgets('Test fund card interactions', (tester) async {
      final mockFundService = locator<FundService>();
      final mockFund = Fund(
        id: '1',
        name: 'Test Fund',
        creator: User(firstName: 'John', lastName: 'Doe'),
        createdAt: DateTime.now(),
      );

      when(
        mockFundService.getFunds(
          orderBy: 'createdAt_DESC',
        ),
      ).thenAnswer((_) async => [mockFund]);

      await tester.pumpWidget(createFundScreen());
      await tester.pumpAndSettle();

      // Find fund cards
      expect(find.byType(FundCard), findsWidgets);

      // Test navigate to campaigns screen
      await tester.tap(find.byIcon(Icons.campaign).first);
      await tester.pumpAndSettle();

      // Verify campaigns screen is displayed
      expect(find.byType(CampaignsScreen), findsOneWidget);
    });
  });
}

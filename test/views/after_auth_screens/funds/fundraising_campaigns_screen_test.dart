// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/funds/fund_pledges_screen.dart';
import 'package:talawa/views/after_auth_screens/funds/fundraising_campaigns_screen.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createCampaignsScreen() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: const CampaignsScreen(
      fundId: '1',
      fundName: 'Test Fund',
    ),
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

  group('CampaignsScreen Widget Tests', () {
    testWidgets('Check if CampaignsScreen shows up', (tester) async {
      await tester.pumpWidget(createCampaignsScreen());
      await tester.pumpAndSettle();

      expect(find.byType(CampaignsScreen), findsOneWidget);
      expect(find.text('Campaigns'), findsOneWidget);
    });

    testWidgets('Test search functionality', (tester) async {
      final mockFundService = locator<FundService>();
      final mockCampaign = [
        Campaign(
          id: '1',
          name: 'Test Campaign',
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 30)),
          fundingGoal: 1000.0,
        ),
      ];
      when(mockFundService.getCampaigns('1', orderBy: 'endDate_DESC'))
          .thenAnswer((_) async => mockCampaign);

      await tester.pumpWidget(createCampaignsScreen());
      await tester.pumpAndSettle();

      // Find and interact with search field
      final searchField = find.byType(TextField).first;
      expect(searchField, findsOneWidget);

      await tester.enterText(searchField, 'Test');
      await tester.pumpAndSettle();

      // Verify that the filtered campaign is displayed
      expect(find.text('Test Campaign'), findsOneWidget);
    });

    testWidgets('Test sort dropdown functionality', (tester) async {
      await tester.pumpWidget(createCampaignsScreen());
      await tester.pumpAndSettle();

      // Find dropdown
      final dropdownButton = find.byType(DropdownButton<String>);
      expect(dropdownButton, findsOneWidget);

      // Open dropdown
      await tester.tap(dropdownButton);
      await tester.pumpAndSettle();

      // Verify dropdown items
      expect(find.text('End Date (Latest)'), findsWidgets);
      expect(find.text('End Date (Earliest)'), findsOneWidget);
      expect(find.text('Amount (Highest)'), findsOneWidget);
      expect(find.text('Amount (Lowest)'), findsOneWidget);
    });

    testWidgets('Test campaign list view when empty', (tester) async {
      final mockFundService = locator<FundService>();

      when(mockFundService.getCampaigns('1', orderBy: 'endDate_DESC'))
          .thenAnswer((_) async => []);

      await tester.pumpWidget(createCampaignsScreen());
      await tester.pumpAndSettle();

      expect(find.text('No campaigns for this fund.'), findsOneWidget);
    });

    testWidgets('Test campaign card interactions', (tester) async {
      final mockFundService = locator<FundService>();
      final mockCampaign = Campaign(
        id: '1',
        name: 'Test Campaign',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 30)),
        fundingGoal: 1000.0,
      );

      when(
        mockFundService.getCampaigns(
          '1',
          orderBy: 'endDate_DESC',
        ),
      ).thenAnswer((_) async => [mockCampaign]);

      await tester.pumpWidget(createCampaignsScreen());
      await tester.pumpAndSettle();

      // Find campaign cards
      expect(find.byType(CampaignCard), findsWidgets);

      // Test navigate to pledges screen
      await tester.tap(find.byIcon(Icons.volunteer_activism).first);
      await tester.pumpAndSettle();

      // Verify pledges screen is displayed
      expect(find.byType(PledgesScreen), findsOneWidget);
    });
  });
}

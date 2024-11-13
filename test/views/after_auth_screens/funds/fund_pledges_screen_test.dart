// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/funds_view_models/fund_view_model.dart';
import 'package:talawa/views/after_auth_screens/funds/fund_pledges_screen.dart';
import 'package:talawa/widgets/pledge_card.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

// Helper function to create test campaign
Campaign getTestCampaign() {
  return Campaign(
    id: "1",
    name: "Test Campaign",
    fundingGoal: 1000.0,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
  );
}

// Helper function to create test pledges
List<Pledge> getTestPledges() {
  return [
    Pledge(
      id: "1",
      amount: 100,
      endDate: DateTime.now().add(const Duration(days: 15)),
      pledgers: [User(firstName: 'John', lastName: 'Doe')],
    ),
    Pledge(
      id: "2",
      amount: 200,
      endDate: DateTime.now().add(const Duration(days: 20)),
      pledgers: [User(firstName: 'Jane', lastName: 'Smith')],
    ),
  ];
}

Widget createPledgesScreen() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: PledgesScreen(campaign: getTestCampaign()),
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

  group('PledgesScreen Widget Tests', () {
    testWidgets('Check if PledgesScreen shows up', (tester) async {
      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      expect(find.byType(PledgesScreen), findsOneWidget);
      expect(find.text('Pledges for Test Campaign'), findsOneWidget);
    });

    testWidgets('Test tab buttons functionality', (tester) async {
      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      // Check if both tabs exist
      expect(find.text('Pledged'), findsOneWidget);
      expect(find.text('Raised'), findsOneWidget);

      // Test tab switching
      await tester.tap(find.text('Raised'));
      await tester.pumpAndSettle();

      // Verify color change or selection state
      final raisedButton = tester.widget<Container>(
        find
            .ancestor(
              of: find.text('Raised'),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(raisedButton.decoration, isA<BoxDecoration>());
    });

    testWidgets('Test search functionality', (tester) async {
      final mockFundViewModel = FundViewModel();
      // Setup mock data
      mockFundViewModel.allPledges.addAll(getTestPledges());

      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      // Find and interact with search field
      final searchField = find.byType(TextField).first;
      expect(searchField, findsOneWidget);

      await tester.enterText(searchField, 'John');
      await tester.pumpAndSettle();
      mockFundViewModel.allPledges.clear();
    });

    testWidgets('Test sort dropdown functionality', (tester) async {
      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      // Find dropdown
      final dropdownButton = find.byType(DropdownButton<String>);
      expect(dropdownButton, findsOneWidget);

      // Open dropdown
      await tester.tap(dropdownButton);
      await tester.pumpAndSettle();

      // Verify dropdown items
      expect(find.text('End Date (Latest)'), findsWidgets);
      expect(find.text('Amount (Highest)'), findsOneWidget);
    });

    testWidgets('Test add pledge functionality', (tester) async {
      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      // Find and tap FAB
      final fabButton = find.byType(FloatingActionButton);
      expect(fabButton, findsOneWidget);

      await tester.tap(fabButton);
      await tester.pumpAndSettle();

      // Verify dialog appears
      expect(find.text('Create Pledge'), findsOneWidget);
    });

    testWidgets('Test pledge list view when empty', (tester) async {
      final mockFundViewModel = FundViewModel();
      // Setup empty pledges
      mockFundViewModel.allPledges.clear();

      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      expect(find.text('No pledges found.'), findsOneWidget);
    });

    testWidgets('Test progress indicator display', (tester) async {
      final mockFundViewModel = FundViewModel();
      // Setup mock data with specific values
      mockFundViewModel.allPledges.addAll(getTestPledges());

      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      // Verify progress bar elements
      expect(find.byType(Stack), findsWidgets);
      expect(find.textContaining('%'), findsOneWidget);
      expect(find.textContaining('Goal: \$'), findsOneWidget);
    });

    testWidgets('Test pledge card interactions', (tester) async {
      final mockFundService = locator<FundService>();
      final mockPledges = [
        Pledge(
          id: '1',
          pledgers: [
            User(
              id: userConfig.currentUser.id,
              firstName: 'John',
              lastName: 'Doe',
            ),
          ],
          amount: 100,
        ),
      ];

      when(mockFundService.getPledgesByCampaign('1', orderBy: 'endDate_DESC'))
          .thenAnswer((_) async => mockPledges);
      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      // Find pledge cards
      expect(find.byType(PledgeCard), findsWidgets);

      // Test update pledge
      await tester.tap(find.byIcon(Icons.edit).first);
      await tester.pumpAndSettle();

      // Verify update dialog appears
      expect(find.text('Update Pledge'), findsOneWidget);
    });

    testWidgets('Test delete pledge confirmation', (tester) async {
      final mockFundService = locator<FundService>();
      final mockPledges = [
        Pledge(
          id: '1',
          pledgers: [
            User(
              id: userConfig.currentUser.id,
              firstName: 'John',
              lastName: 'Doe',
            ),
          ],
          amount: 100,
        ),
      ];

      when(mockFundService.getPledgesByCampaign('1', orderBy: 'endDate_DESC'))
          .thenAnswer((_) async => mockPledges);

      await tester.pumpWidget(createPledgesScreen());
      await tester.pumpAndSettle();

      // Find and tap delete button
      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pumpAndSettle();

      // Verify delete confirmation dialog
      expect(find.text('Delete Pledge'), findsOneWidget);
      expect(
        find.text('Are you sure you want to delete this pledge?'),
        findsOneWidget,
      );
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Delete'), findsWidgets);
    });
  });
}

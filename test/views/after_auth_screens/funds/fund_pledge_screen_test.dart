import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model/fund_view_model.dart';
import 'package:talawa/views/after_auth_screens/funds/fund_pledges_screen.dart';
import 'package:talawa/widgets/pledge_card.dart';
import 'package:talawa/widgets/update_pledge_dialogue_box.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';
import '../../../helpers/test_locator.dart';

void main() {
  late Campaign campaign;
  late List<Pledge> pledges;
  final GetIt getIt = GetIt.instance;
  late MockFundViewModel mockModel;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerServices();
    mockModel = MockFundViewModel();
    getIt.registerSingleton<FundViewModel>(mockModel);
  });
  setUp(() {
    campaign = Campaign(
      id: 'camp1',
      name: 'Test Campaign',
      startDate: DateTime.now().subtract(const Duration(days: 1)),
      endDate: DateTime.now().add(const Duration(days: 1)),
      currency: 'USD',
    );

    pledges = [
      Pledge(
        id: 'pledge1',
        amount: 100,
        note: 'First pledge',
        pledger: User(id: 'xzy1'), // Use the same ID as in test_helpers.dart
        creator: null,
        currency: 'USD',
      ),
      Pledge(
        id: 'pledge2',
        amount: 200,
        note: 'Second pledge',
        pledger: User(id: 'xzy1'), // Use the same ID as in test_helpers.dart
        creator: null,
        currency: 'USD',
      ),
    ];

    // Set up common mocks
    when(mockModel.fetchPledges(any)).thenAnswer((_) async {});
    when(mockModel.getCurrentOrgUsersList()).thenAnswer((_) async {});
    when(mockModel.deletePledge(any, any)).thenAnswer((_) async {});
  });

  Widget createScreen() {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizationsDelegate(isTest: true),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      home: Builder(
        builder: (context) => PledgesScreen(campaign: campaign),
      ),
    );
  }

  testWidgets('Shows loading indicator when fetching pledges', (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(true);
    when(mockModel.userPledges).thenReturn([]);
    await tester.pumpWidget(createScreen());
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Shows empty state when no pledges', (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn([]);
    await tester.pumpWidget(createScreen());
    await tester.pump();
    expect(find.text('There are no pledges you are part of'), findsOneWidget);
  });

  testWidgets('Shows pledge list when pledges exist', (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);
    await tester.pumpWidget(createScreen());
    await tester.pump();
    expect(find.byType(PledgeCard), findsNWidgets(2));
    expect(find.text('First pledge'), findsOneWidget);
    expect(find.text('Second pledge'), findsOneWidget);
  });

  testWidgets('Add pledge button opens dialog', (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);
    await tester.pumpWidget(createScreen());
    await tester.pump();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Create Pledge'), findsOneWidget);
  });

  testWidgets('Cannot add pledge before campaign start date', (tester) async {
    final futureCampaign = Campaign(
      id: 'camp2',
      name: 'Future Campaign',
      startDate: DateTime.now().add(const Duration(days: 2)),
      endDate: DateTime.now().add(const Duration(days: 10)),
      currency: 'USD',
    );
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('en'),
        home: PledgesScreen(campaign: futureCampaign),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    verify(
      navigationService.showTalawaErrorSnackBar(
        'Cannot add pledge before campaign start date',
        MessageType.error,
      ),
    );
  });

  testWidgets('Cannot add pledge after campaign end date', (tester) async {
    final pastCampaign = Campaign(
      id: 'camp3',
      name: 'Past Campaign',
      startDate: DateTime.now().subtract(const Duration(days: 10)),
      endDate: DateTime.now().subtract(const Duration(days: 1)),
      currency: 'USD',
    );
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('en'),
        home: PledgesScreen(campaign: pastCampaign),
      ),
    );
    await tester.pump();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    verify(
      navigationService.showTalawaErrorSnackBar(
        'Cannot add pledge after campaign end date',
        MessageType.error,
      ),
    );
  });
  testWidgets('Update pledge button exists and can be tapped', (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Verify update button exists
    expect(find.text('Update'), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.edit), findsAtLeastNWidgets(1));
  });
  testWidgets('Delete pledge button exists and can be tapped', (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Verify delete button exists
    expect(find.text('Delete'), findsAtLeastNWidgets(1));
    expect(find.byIcon(Icons.delete), findsAtLeastNWidgets(1));
  });
  testWidgets('Pledge cards show edit and delete buttons for user pledges',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Verify both update and delete buttons are present for user's pledges
    expect(find.text('Update'), findsNWidgets(2)); // One for each pledge
    expect(find.text('Delete'), findsNWidgets(2)); // One for each pledge
    expect(find.byIcon(Icons.edit), findsNWidgets(2));
    expect(find.byIcon(Icons.delete), findsNWidgets(2));
  });

  testWidgets('Screen layout and basic functionality work correctly',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Verify screen components
    expect(find.text('Pledges for Test Campaign'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(PledgeCard), findsNWidgets(2));
    expect(find.text('First pledge'), findsOneWidget);
    expect(find.text('Second pledge'), findsOneWidget);
  });

  testWidgets('FloatingActionButton shows add pledge dialog when tapped',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn([]);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Tap the FloatingActionButton
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify add pledge dialog appears
    expect(find.text('Create Pledge'), findsOneWidget);
  });

  testWidgets('Update and delete buttons are present for user pledges',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Verify both buttons exist for each pledge
    expect(find.text('Update'), findsNWidgets(2));
    expect(find.text('Delete'), findsNWidgets(2));

    // Verify icons are present
    expect(find.byIcon(Icons.edit), findsNWidgets(2));
    expect(find.byIcon(Icons.delete), findsNWidgets(2));
  });

  testWidgets('Screen shows correct title with campaign name', (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn([]);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Verify the app bar title includes campaign name
    expect(find.text('Pledges for Test Campaign'), findsOneWidget);
  });

  testWidgets('Update pledge dialog opens when update button is tapped',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Find and tap the first update button
    final updateButtons = find.text('Update');
    expect(updateButtons, findsNWidgets(2));

    await tester.tap(updateButtons.first);
    await tester.pumpAndSettle();

    // Verify update dialog appears
    expect(find.text('Update Pledge'), findsOneWidget);
  });

  testWidgets('Delete confirmation dialog opens when delete button is tapped',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Find and tap the first delete button
    final deleteButtons = find.text('Delete');
    expect(deleteButtons, findsNWidgets(2));

    await tester.tap(deleteButtons.first);
    await tester.pumpAndSettle();

    // Verify delete confirmation dialog appears
    expect(find.text("Delete Pledge"), findsOneWidget);
    expect(
      find.text('Are you sure you want to delete this pledge?'),
      findsOneWidget,
    );
    expect(find.text('Cancel'), findsOneWidget);
    expect(
      find.text('Delete'),
      findsAtLeastNWidgets(
        1,
      ),
    ); // At least one because there might be multiple delete buttons
  });

  testWidgets('Delete confirmation dialog - Cancel button works',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Tap delete button to open dialog
    await tester.tap(find.text('Delete').first);
    await tester.pumpAndSettle();

    // Verify dialog is open
    expect(find.text("Delete Pledge"), findsOneWidget);

    // Tap Cancel button
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    // Verify dialog is closed
    expect(find.text("Delete Pledge"), findsNothing);
  });

  testWidgets(
      'Delete confirmation dialog - Delete button calls model.deletePledge',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Tap delete button to open dialog
    await tester.tap(find.text('Delete').first);
    await tester.pumpAndSettle();

    // Find the delete button in the dialog (not the card)
    final dialogDeleteButton = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.text('Delete'),
    );

    await tester.tap(dialogDeleteButton);
    await tester.pumpAndSettle();

    // Verify deletePledge was called with correct parameters
    verify(mockModel.deletePledge('pledge1', 'camp1')).called(1);
  });

  testWidgets('Update pledge dialog contains UpdatePledgeDialog widget',
      (tester) async {
    when(mockModel.isFetchingPledges).thenReturn(false);
    when(mockModel.userPledges).thenReturn(pledges);

    await tester.pumpWidget(createScreen());
    await tester.pump();

    // Tap update button to open dialog
    await tester.tap(find.text('Update').first);
    await tester.pumpAndSettle();

    // Verify UpdatePledgeDialog widget appears
    expect(find.byType(UpdatePledgeDialog), findsOneWidget);
    expect(find.text('Update Pledge'), findsOneWidget);
  });

  tearDownAll(() async {
    await getIt.reset();
  });
}

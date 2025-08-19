import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';
import 'package:talawa/views/after_auth_screens/funds/fund_pledges_screen.dart';
import 'package:talawa/widgets/pledge_card.dart';

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
        pledger: null,
        creator: null,
        currency: 'USD',
      ),
      Pledge(
        id: 'pledge2',
        amount: 200,
        note: 'Second pledge',
        pledger: null,
        creator: null,
        currency: 'USD',
      ),
    ];
  });

  Widget createScreen() {
    return MaterialApp(
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
    when(fundViewModel.isFetchingPledges).thenReturn(false);
    when(fundViewModel.userPledges).thenReturn(pledges);
    await tester.pumpWidget(createScreen());
    await tester.pump();
    expect(find.byType(PledgeCard), findsNWidgets(2));
    expect(find.text('First pledge'), findsOneWidget);
    expect(find.text('Second pledge'), findsOneWidget);
  });

  testWidgets('Add pledge button opens dialog', (tester) async {
    when(fundViewModel.isFetchingPledges).thenReturn(false);
    when(fundViewModel.userPledges).thenReturn(pledges);
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
    await tester
        .pumpWidget(MaterialApp(home: PledgesScreen(campaign: futureCampaign)));
    await tester.pump();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(
      find.text('Cannot add pledge before campaign start date'),
      findsOneWidget,
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
    await tester
        .pumpWidget(MaterialApp(home: PledgesScreen(campaign: pastCampaign)));
    await tester.pump();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(
      find.text('Cannot add pledge after campaign end date'),
      findsOneWidget,
    );
  });
}

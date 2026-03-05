// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/widgets/update_pledge_dialogue_box.dart';

import '../helpers/test_helpers.mocks.dart';
import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFundViewModel mockModel;
  late Pledge pledge;

  setUpAll(() => setUpGoldenTests());

  tearDownAll(() => tearDownGoldenTests());

  setUp(() {
    mockModel = MockFundViewModel();
    pledge = Pledge(
      id: 'pledge1',
      amount: 500,
      note: 'Donate generously',
      campaign: Campaign(
        id: 'camp1',
        name: 'Annual Fund',
        currency: 'USD',
      ),
    );
    when(mockModel.updatePledge(any)).thenAnswer((_) async {});
  });

  Widget buildDialog({required ThemeMode themeMode}) {
    return themedWidget(
      Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (_) => UpdatePledgeDialog(
                pledge: pledge,
                model: mockModel,
              ),
            );
          });
          return const SizedBox.shrink();
        },
      ),
      themeMode: themeMode,
    );
  }

  group('UpdatePledgeDialog Golden Tests', () {
    testWidgets('initial_state - light', (WidgetTester tester) async {
      await tester.pumpWidget(buildDialog(themeMode: ThemeMode.light));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(UpdatePledgeDialog),
        matchesGoldenFile(
          goldenFileName('update_pledge_dialog', 'initial_state', 'light'),
        ),
      );
    });

    testWidgets('initial_state - dark', (WidgetTester tester) async {
      await tester.pumpWidget(buildDialog(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(UpdatePledgeDialog),
        matchesGoldenFile(
          goldenFileName('update_pledge_dialog', 'initial_state', 'dark'),
        ),
      );
    });

    testWidgets('empty_pledge - light', (WidgetTester tester) async {
      pledge = Pledge(
        id: 'pledge2',
        amount: null,
        note: null,
        campaign: Campaign(id: 'camp2', name: 'Spring Drive', currency: 'EUR'),
      );
      await tester.pumpWidget(buildDialog(themeMode: ThemeMode.light));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(UpdatePledgeDialog),
        matchesGoldenFile(
          goldenFileName('update_pledge_dialog', 'empty_pledge', 'light'),
        ),
      );
    });

    testWidgets('empty_pledge - dark', (WidgetTester tester) async {
      pledge = Pledge(
        id: 'pledge2',
        amount: null,
        note: null,
        campaign: Campaign(id: 'camp2', name: 'Spring Drive', currency: 'EUR'),
      );
      await tester.pumpWidget(buildDialog(themeMode: ThemeMode.dark));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(UpdatePledgeDialog),
        matchesGoldenFile(
          goldenFileName('update_pledge_dialog', 'empty_pledge', 'dark'),
        ),
      );
    });
  });
}

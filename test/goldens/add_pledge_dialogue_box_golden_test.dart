import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/add_pledge_dialogue_box.dart';

import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    SizeConfig().test();
  });

  group('Golden Tests for Add Pledge Dialog', () {
    late MockFundViewModel mockFundViewModel;
    late Campaign testCampaign;
    late List<User> testOrgMembers;

    setUp(() {
      mockFundViewModel = MockFundViewModel();
      testCampaign = Campaign(
        id: 'camp1',
        name: 'Test Campaign',
        currency: 'USD',
      );
      testOrgMembers = [
        User(
          id: '1',
          name: 'Alice Williams',
        ),
        User(
          id: '2',
          name: 'Charlie Brown',
        ),
      ];
      when(mockFundViewModel.orgMembersList).thenReturn(testOrgMembers);
    });

    // Golden test (standard Flutter format)
    testWidgets('AddPledgeDialog light theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          Builder(
            builder: (context) => TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddPledgeDialog(
                    model: mockFundViewModel,
                    campaign: testCampaign,
                  ),
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
          ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      final dialogFinder = find.byType(AlertDialog);
      expect(dialogFinder, findsOneWidget);

      await expectLater(
        dialogFinder,
        matchesGoldenFile('goldens/add_pledge_dialogue_box_light.png'),
      );
    });

    // Golden test (standard Flutter format)
    testWidgets('AddPledgeDialog dark theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          Builder(
            builder: (context) => TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddPledgeDialog(
                    model: mockFundViewModel,
                    campaign: testCampaign,
                  ),
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
          ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      final dialogFinder = find.byType(AlertDialog);
      expect(dialogFinder, findsOneWidget);

      await expectLater(
        dialogFinder,
        matchesGoldenFile('goldens/add_pledge_dialogue_box_dark.png'),
      );
    });
  });
}

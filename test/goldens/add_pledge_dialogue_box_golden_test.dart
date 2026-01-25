// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/widgets/add_pledge_dialogue_box.dart';

import '../helpers/test_helpers.mocks.dart';
import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFundViewModel mockModel;
  late Campaign campaign;
  late List<User> orgMembers;
  late Size originalSize;
  late double originalDpr;

  setUpAll(() {
    // Lock surface size and pixel ratio for consistent rendering across platforms
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    final view = binding.platformDispatcher.views.first;

    originalSize = view.physicalSize;
    originalDpr = view.devicePixelRatio;
    view.physicalSize = const Size(1080, 1920);
    view.devicePixelRatio = 1.0;
  });

  tearDownAll(() {
    final view = TestWidgetsFlutterBinding.ensureInitialized()
        .platformDispatcher
        .views
        .first;
    view.physicalSize = originalSize;
    view.devicePixelRatio = originalDpr;
  });

  setUp(() {
    mockModel = MockFundViewModel();
    campaign = Campaign(id: 'camp1', name: 'Test Campaign', currency: 'USD');
    orgMembers = [
      User(
        id: '1',
        name: 'John Doe',
      ),
      User(
        id: '2',
        name: 'Jane Smith',
      ),
      User(
        id: '3',
        name: 'Bob Johnson',
      ),
    ];
    when(mockModel.orgMembersList).thenReturn(orgMembers);
  });

  Widget createAddPledgeDialogForGolden({
    required ThemeMode themeMode,
  }) {
    return themedWidget(
      Builder(
        builder: (context) {
          // Show dialog immediately for golden test
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) => AddPledgeDialog(
                model: mockModel,
                campaign: campaign,
              ),
            );
          });
          return Container();
        },
      ),
      themeMode: themeMode,
    );
  }

  group('AddPledgeDialog Golden Tests', () {
    testWidgets('add_pledge_dialog initial state - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialogForGolden(themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AddPledgeDialog),
        matchesGoldenFile(
          goldenFileName('add_pledge_dialog', 'initial_state', 'light'),
        ),
      );
    });

    testWidgets('add_pledge_dialog initial state - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialogForGolden(themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AddPledgeDialog),
        matchesGoldenFile(
          goldenFileName('add_pledge_dialog', 'initial_state', 'dark'),
        ),
      );
    });

    testWidgets('add_pledge_dialog with pledger selected - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialogForGolden(themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      // Select a pledger
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('John Doe').last);
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AddPledgeDialog),
        matchesGoldenFile(
          goldenFileName('add_pledge_dialog', 'with_pledger', 'light'),
        ),
      );
    });

    testWidgets('add_pledge_dialog with pledger selected - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialogForGolden(themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();

      // Select a pledger
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('John Doe').last);
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AddPledgeDialog),
        matchesGoldenFile(
          goldenFileName('add_pledge_dialog', 'with_pledger', 'dark'),
        ),
      );
    });

    testWidgets('add_pledge_dialog with filled form - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialogForGolden(themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      // Select a pledger
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Jane Smith').last);
      await tester.pumpAndSettle();

      // Fill in the form
      await tester.enterText(
        find.byType(TextFormField).at(0),
        'Pledge for community development',
      );
      await tester.enterText(find.byType(TextFormField).at(1), '500');
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AddPledgeDialog),
        matchesGoldenFile(
          goldenFileName('add_pledge_dialog', 'filled_form', 'light'),
        ),
      );
    });

    testWidgets('add_pledge_dialog popup menu open - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialogForGolden(themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      // Open the popup menu
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('add_pledge_dialog', 'popup_menu_open', 'light'),
        ),
      );
    });
  });
}

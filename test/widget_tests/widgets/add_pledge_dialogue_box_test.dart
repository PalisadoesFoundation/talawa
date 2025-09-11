// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';
import 'package:talawa/widgets/add_pledge_dialogue_box.dart';

import '../../helpers/test_helpers.mocks.dart';

Widget createAddPledgeDialog({
  required FundViewModel model,
  required Campaign campaign,
}) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('en'),
    home: Scaffold(
      body: Builder(
        builder: (context) => TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddPledgeDialog(
                model: model,
                campaign: campaign,
              ),
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    ),
  );
}

void main() {
  late MockFundViewModel mockModel;
  late Campaign campaign;
  late List<User> orgMembers;

  setUp(() {
    mockModel = MockFundViewModel();
    campaign = Campaign(id: 'camp1', name: 'Test Campaign', currency: 'USD');
    orgMembers = [
      User(id: '1', firstName: 'John', lastName: 'Doe'),
      User(id: '2', firstName: 'Jane', lastName: 'Smith'),
    ];
    when(mockModel.orgMembersList).thenReturn(orgMembers);
  });

  group('AddPledgeDialog Widget Tests', () {
    testWidgets('Dialog shows up with correct initial state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(model: mockModel, campaign: campaign),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      expect(find.text('Create Pledge'), findsOneWidget);
      expect(find.text('Select Pledger:'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
    });

    testWidgets('Can select pledger from popup menu',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(model: mockModel, campaign: campaign),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('John Doe').last);
      await tester.pumpAndSettle();
      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('Form validation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(model: mockModel, campaign: campaign),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Create'));
      await tester.pump();
      expect(find.text('Please fill all fields'), findsOneWidget);
      verifyNever(mockModel.createPledge(any));
    });

    testWidgets('Can submit valid form', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(model: mockModel, campaign: campaign),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.text('John Doe').last);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(1), '100');
      await tester.tap(find.text('Create'));
      await tester.pumpAndSettle();
      verify(
        mockModel.createPledge(
          argThat(
            predicate<Map<String, dynamic>>((data) {
              return data['amount'] == 100.0 &&
                  data['campaignId'] == 'camp1' &&
                  data['pledgerId'] == '1';
            }),
          ),
        ),
      ).called(1);
    });

    testWidgets('Can cancel dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        createAddPledgeDialog(model: mockModel, campaign: campaign),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Create Pledge'), findsNothing);
    });
  });
}

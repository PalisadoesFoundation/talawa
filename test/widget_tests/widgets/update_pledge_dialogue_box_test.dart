// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';
import 'package:talawa/widgets/update_pledge_dialogue_box.dart';

import '../../helpers/test_helpers.mocks.dart';

Widget createUpdatePledgeDialog({
  required FundViewModel model,
  required Pledge pledge,
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
              builder: (context) => UpdatePledgeDialog(
                model: model,
                pledge: pledge,
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
  late Pledge pledge;

  setUp(() {
    mockModel = MockFundViewModel();
    campaign = Campaign(id: 'camp1', name: 'Test Campaign', currency: 'USD');
    pledge = Pledge(
      id: 'pledge1',
      amount: 123,
      note: 'Initial note',
      campaign: campaign,
    );
  });
  tearDown(() {});

  group('UpdatePledgeDialog Widget Tests', () {
    testWidgets('Dialog shows up with correct initial state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(model: mockModel, pledge: pledge),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      expect(find.text('Update Pledge'), findsOneWidget);
      expect(find.text('Initial note'), findsOneWidget);
      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('Note'), findsOneWidget);
    });

    testWidgets('Form validation works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(model: mockModel, pledge: pledge),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(1), '');
      await tester.tap(find.text('Update'));
      await tester.pump();
      expect(find.text('Please fill all fields'), findsOneWidget);
      verifyNever(mockModel.updatePledge(any));
    });

    testWidgets('Can submit valid form', (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(model: mockModel, pledge: pledge),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(1), '456');
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();
      verify(
        mockModel.updatePledge(
          argThat(
            predicate<Map<String, dynamic>>((data) {
              return data['id'] == 'pledge1' &&
                  data['amount'] == 456.0 &&
                  data['note'] == 'Initial note';
            }),
          ),
        ),
      ).called(1);
    });

    testWidgets('Can cancel dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        createUpdatePledgeDialog(model: mockModel, pledge: pledge),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Update Pledge'), findsNothing);
    });
  });
}

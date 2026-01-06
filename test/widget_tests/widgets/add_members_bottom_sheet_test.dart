import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/widgets/add_members_bottom_sheet.dart';

import '../../helpers/test_locator.dart';

class MockCreateEventViewModel extends Mock implements CreateEventViewModel {
  @override
  Map<String, bool> memberCheckedMap = {};

  @override
  Future<List<User>> getCurrentOrgUsersList() {
    return super.noSuchMethod(
      Invocation.method(#getCurrentOrgUsersList, []),
      returnValue: Future.value(<User>[]),
      returnValueForMissingStub: Future.value(<User>[]),
    ) as Future<List<User>>;
  }

  @override
  void buildUserList() {
    super.noSuchMethod(
      Invocation.method(#buildUserList, []),
      returnValueForMissingStub: null,
    );
  }
}

void main() {
  late MockCreateEventViewModel mockModel;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
  });

  setUp(() {
    mockModel = MockCreateEventViewModel();
  });

  Widget createWidgetUnderTest() {
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
          builder: (context) {
            return TextButton(
              onPressed: () {
                EventBottomSheet().addUserBottomSheet(
                  context: context,
                  model: mockModel,
                );
              },
              child: const Text('Open Sheet'),
            );
          },
        ),
      ),
    );
  }

  testWidgets('Add Members Bottom Sheet renders and functions correctly',
      (WidgetTester tester) async {
    // Setup data
    final user1 = User(id: '1', name: 'John Doe');
    final user2 = User(id: '2', name: 'Jane Smith');
    final users = [user1, user2];

    when(mockModel.getCurrentOrgUsersList()).thenAnswer((_) async => users);
    mockModel.memberCheckedMap['1'] = false;
    mockModel.memberCheckedMap['2'] = true;

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Open the bottom sheet
    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    // Verify title
    expect(find.text('Add Members'), findsOneWidget);

    // Verify users are listed
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Jane Smith'), findsOneWidget);

    // Verify checkboxes
    final checkbox1 = tester.widget<CheckboxListTile>(
      find.widgetWithText(CheckboxListTile, 'John Doe'),
    );
    expect(checkbox1.value, false);

    final checkbox2 = tester.widget<CheckboxListTile>(
      find.widgetWithText(CheckboxListTile, 'Jane Smith'),
    );
    expect(checkbox2.value, true);

    // Tap a checkbox
    await tester.tap(find.widgetWithText(CheckboxListTile, 'John Doe'));
    await tester.pump();

    // Verify map update
    expect(mockModel.memberCheckedMap['1'], true);

    // Tap Done button
    final doneButton = find.byKey(const Key('text_btn_ambs1'));
    expect(doneButton, findsOneWidget);
    await tester.tap(doneButton);
    await tester.pumpAndSettle();

    // Verify buildUserList called
    verify(mockModel.buildUserList()).called(1);

    // Verify sheet closed
    expect(find.text('Add Members'), findsNothing);
  });
}

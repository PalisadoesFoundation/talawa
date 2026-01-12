import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/widgets/add_members_bottom_sheet.dart';

import '../helpers/test_locator.dart';
import 'golden_test_helpers.dart';

class MockCreateEventViewModelForGolden extends Mock
    implements CreateEventViewModel {
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
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    SizeConfig().test();
  });

  group('Golden Tests for Add Members Bottom Sheet', () {
    late MockCreateEventViewModelForGolden mockViewModel;
    late List<User> testUsers;

    setUp(() {
      mockViewModel = MockCreateEventViewModelForGolden();
      testUsers = [
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
      when(mockViewModel.getCurrentOrgUsersList())
          .thenAnswer((_) async => testUsers);
      mockViewModel.memberCheckedMap['1'] = false;
      mockViewModel.memberCheckedMap['2'] = true;
      mockViewModel.memberCheckedMap['3'] = false;
    });

    // Golden test (standard Flutter format)
    testWidgets('AddMembersBottomSheet light theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          Builder(
            builder: (context) {
              return TextButton(
                onPressed: () {
                  EventBottomSheet().addUserBottomSheet(
                    context: context,
                    model: mockViewModel,
                  );
                },
                child: const Text('Open Sheet'),
              );
            },
          ),
          ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Add Members'), findsOneWidget);

      final addMembersText = find.text('Add Members');
      final bottomSheetFinder = find.ancestor(
        of: addMembersText,
        matching: find.byType(ClipRRect),
      );
      expect(bottomSheetFinder, findsOneWidget);

      await expectLater(
        bottomSheetFinder,
        matchesGoldenFile('goldens/add_members_bottom_sheet_light.png'),
      );
    });

    // Golden test (standard Flutter format)
    testWidgets('AddMembersBottomSheet dark theme golden',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        themed(
          Builder(
            builder: (context) {
              return TextButton(
                onPressed: () {
                  EventBottomSheet().addUserBottomSheet(
                    context: context,
                    model: mockViewModel,
                  );
                },
                child: const Text('Open Sheet'),
              );
            },
          ),
          ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Add Members'), findsOneWidget);

      final addMembersText = find.text('Add Members');
      final bottomSheetFinder = find.ancestor(
        of: addMembersText,
        matching: find.byType(ClipRRect),
      );
      expect(bottomSheetFinder, findsOneWidget);

      await expectLater(
        bottomSheetFinder,
        matchesGoldenFile('goldens/add_members_bottom_sheet_dark.png'),
      );
    });
  });
}

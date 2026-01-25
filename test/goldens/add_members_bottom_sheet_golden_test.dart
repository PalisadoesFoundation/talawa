// ignore_for_file: talawa_api_doc
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/widgets/add_members_bottom_sheet.dart';

import '../helpers/test_helpers.mocks.dart';
import 'golden_test_helpers.dart';

void main() {
  late MockCreateEventViewModel mockModel;
  late List<User> mockUsers;

  setUp(() {
    mockModel = MockCreateEventViewModel();
    mockUsers = [
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
      User(
        id: '4',
        name: 'Alice Williams',
      ),
    ];

    when(mockModel.getCurrentOrgUsersList()).thenAnswer((_) async => mockUsers);
    when(mockModel.memberCheckedMap).thenReturn({
      '1': false,
      '2': false,
      '3': false,
      '4': false,
    });
  });

  Widget createBottomSheetForGolden({
    required ThemeMode themeMode,
    List<User>? users,
    Map<String, bool>? checkedMap,
    Future<List<User>>? usersFuture,
  }) {
    final usersToUse = users ?? mockUsers;
    final checkedMapToUse = checkedMap ??
        {
          '1': false,
          '2': false,
          '3': false,
          '4': false,
        };

    // Only re-stub if usersFuture is not provided (allows loading state)
    if (usersFuture != null) {
      when(mockModel.getCurrentOrgUsersList()).thenAnswer((_) => usersFuture);
    } else {
      when(mockModel.getCurrentOrgUsersList())
          .thenAnswer((_) async => usersToUse);
    }
    when(mockModel.memberCheckedMap).thenReturn(checkedMapToUse);

    return themedWidget(
      Builder(
        builder: (context) {
          // Show bottom sheet immediately for golden test
          WidgetsBinding.instance.addPostFrameCallback((_) {
            EventBottomSheet().addUserBottomSheet(
              context: context,
              model: mockModel,
            );
          });
          return Container();
        },
      ),
      themeMode: themeMode,
    );
  }

  group('EventBottomSheet (Add Members) Golden Tests', () {
    testWidgets('add_members_bottom_sheet with members - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createBottomSheetForGolden(themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('add_members_bottom_sheet', 'with_members', 'light'),
        ),
      );
    });

    testWidgets('add_members_bottom_sheet with members - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createBottomSheetForGolden(themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('add_members_bottom_sheet', 'with_members', 'dark'),
        ),
      );
    });

    testWidgets('add_members_bottom_sheet with selected members - light theme',
        (WidgetTester tester) async {
      final checkedMap = {
        '1': true,
        '2': false,
        '3': true,
        '4': false,
      };

      await tester.pumpWidget(
        createBottomSheetForGolden(
          themeMode: ThemeMode.light,
          checkedMap: checkedMap,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'add_members_bottom_sheet',
            'with_selected',
            'light',
          ),
        ),
      );
    });

    testWidgets('add_members_bottom_sheet empty state - light theme',
        (WidgetTester tester) async {
      when(mockModel.getCurrentOrgUsersList()).thenAnswer((_) async => []);

      await tester.pumpWidget(
        createBottomSheetForGolden(
          themeMode: ThemeMode.light,
          users: [],
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('add_members_bottom_sheet', 'empty_state', 'light'),
        ),
      );
    });

    testWidgets('add_members_bottom_sheet loading state - light theme',
        (WidgetTester tester) async {
      // Create a future that never completes to simulate loading
      final loadingFuture = Completer<List<User>>().future;

      await tester.pumpWidget(
        createBottomSheetForGolden(
          themeMode: ThemeMode.light,
          usersFuture: loadingFuture,
        ),
      );
      await tester.pump(); // Only pump once to show loading state

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('add_members_bottom_sheet', 'loading_state', 'light'),
        ),
      );
    });
  });
}

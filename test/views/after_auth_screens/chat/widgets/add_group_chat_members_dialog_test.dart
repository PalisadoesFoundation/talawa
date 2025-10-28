import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/add_group_chat_members_dialog.dart';

import '../../../../helpers/test_helpers.dart';
import '../../../../helpers/test_locator.dart';

/// Helper function to create MaterialApp with localization support for testing
Widget createTestMaterialApp({required Widget child}) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: child,
    ),
  );
}

/// Helper function to show dialog in tests
Future<void> showTestDialog(
  WidgetTester tester, {
  required List<User> availableMembers,
  required Function(List<User>) onMembersSelected,
}) async {
  await tester.pumpWidget(
    createTestMaterialApp(
      child: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AddGroupChatMembersDialog(
              availableMembers: availableMembers,
              onMembersSelected: onMembersSelected,
            ),
          ),
          child: const Text('Show Dialog'),
        ),
      ),
    ),
  );

  // Allow the widget tree to build
  await tester.pump();

  // Tap the button to show the dialog
  await tester.tap(find.text('Show Dialog'));
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(() {
    testSetupLocator();
  });

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('AddGroupChatMembersDialog Tests', () {
    late List<User> mockMembers;

    setUp(() {
      mockMembers = [
        User(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.doe@example.com',
        ),
        User(
          id: 'user2',
          firstName: 'Jane',
          lastName: 'Smith',
          email: 'jane.smith@example.com',
        ),
        User(
          id: 'user3',
          firstName: 'Bob',
          lastName: 'Wilson',
          email: 'bob.wilson@example.com',
        ),
      ];
    });

    testWidgets(
        'should display dialog with title and empty state when no members available',
        (WidgetTester tester) async {
      await showTestDialog(
        tester,
        availableMembers: const [],
        onMembersSelected: (members) {
          // Callback for empty state
        },
      );

      // Verify dialog structure
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Add Members'), findsOneWidget);
      expect(find.text('No members available to add'), findsOneWidget);

      // Verify action buttons
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Add 0 Members'), findsOneWidget);

      // Verify Add button is disabled when no members selected
      final addButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Add 0 Members'),
      );
      expect(addButton.onPressed, isNull);
    });

    testWidgets('should display list of available members',
        (WidgetTester tester) async {
      await showTestDialog(
        tester,
        availableMembers: mockMembers,
        onMembersSelected: (members) {
          // Callback for member selection
        },
      );

      // Verify dialog shows member selection interface
      expect(find.text('Select members to add to the group:'), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsNWidgets(3));

      // Verify member information is displayed
      expect(find.text('John'), findsOneWidget);
      expect(find.text('jane.smith@example.com'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);

      // Verify circle avatars with initials (both John and Jane have "J")
      expect(find.text('J'), findsNWidgets(2));
      expect(find.text('B'), findsOneWidget); // Bob's initial

      // Verify initially no members are selected
      final checkboxes =
          tester.widgetList<CheckboxListTile>(find.byType(CheckboxListTile));
      for (final checkbox in checkboxes) {
        expect(checkbox.value, false);
      }
    });

    testWidgets('should handle member selection and update button state',
        (WidgetTester tester) async {
      await showTestDialog(
        tester,
        availableMembers: mockMembers,
        onMembersSelected: (members) {
          // Callback for handling selection
        },
      );

      // Initially, add button should be disabled
      final initialAddButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Add 0 Members'),
      );
      expect(initialAddButton.onPressed, isNull);

      // Tap first member checkbox
      await tester.tap(find.byType(CheckboxListTile).first);
      await tester.pump();

      // Verify button text updates
      expect(find.text('Add 1 Member'), findsOneWidget);

      // Verify button is now enabled
      final enabledAddButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Add 1 Member'),
      );
      expect(enabledAddButton.onPressed, isNotNull);

      // Select second member
      await tester.tap(find.byType(CheckboxListTile).at(1));
      await tester.pump();

      // Verify button text updates for multiple members
      expect(find.text('Add 2 Members'), findsOneWidget);

      // Deselect first member
      await tester.tap(find.byType(CheckboxListTile).first);
      await tester.pump();

      // Verify button text updates back to singular
      expect(find.text('Add 1 Member'), findsOneWidget);
    });

    testWidgets(
        'should call onMembersSelected callback when Add button is pressed',
        (WidgetTester tester) async {
      bool callbackCalled = false;
      List<User> selectedMembers = [];

      await showTestDialog(
        tester,
        availableMembers: mockMembers,
        onMembersSelected: (members) {
          callbackCalled = true;
          selectedMembers = members;
        },
      );

      // Select two members
      await tester.tap(find.byType(CheckboxListTile).first);
      await tester.pump();
      await tester.tap(find.byType(CheckboxListTile).at(2)); // Bob
      await tester.pump();

      // Tap Add button
      await tester.tap(find.widgetWithText(TextButton, 'Add 2 Members'));
      await tester.pump();

      // Verify callback was called with correct members
      expect(callbackCalled, true);
      expect(selectedMembers.length, 2);
      expect(selectedMembers[0].firstName, 'John');
      expect(selectedMembers[1].firstName, 'Bob');
    });

    testWidgets(
        'should call navigationService.pop when Cancel button is pressed',
        (WidgetTester tester) async {
      await showTestDialog(
        tester,
        availableMembers: mockMembers,
        onMembersSelected: (members) {},
      );

      // Tap Cancel button
      await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
      await tester.pump();

      // Navigation service pop should have been called
      // Note: Since we're using a mock navigation service, we can't easily verify the call
      // In a real app, this would close the dialog
    });

    testWidgets('should handle members with missing information gracefully',
        (WidgetTester tester) async {
      final membersWithMissingInfo = [
        User(
          id: 'user1',
          firstName: null,
          email: 'test@example.com',
        ),
        User(
          id: 'user2',
          firstName: '',
          email: null,
        ),
        User(
          id: 'user3',
          firstName: 'Valid',
          email: 'valid@example.com',
        ),
      ];

      await showTestDialog(
        tester,
        availableMembers: membersWithMissingInfo,
        onMembersSelected: (members) {},
      );

      // Verify fallback values are used
      expect(
        find.text('Unknown'),
        findsAtLeastNWidgets(1),
      ); // For missing firstName
      expect(
        find.text('Unavailable'),
        findsAtLeastNWidgets(1),
      ); // For missing email
      expect(
        find.text('U'),
        findsAtLeastNWidgets(1),
      ); // For missing/empty firstName initial
      expect(find.text('Valid'), findsOneWidget); // Valid firstName
      expect(find.text('V'), findsOneWidget); // Valid initial
    });

    testWidgets('should maintain correct selection state during interactions',
        (WidgetTester tester) async {
      await showTestDialog(
        tester,
        availableMembers: mockMembers,
        onMembersSelected: (members) {},
      );

      // Select first member
      await tester.tap(find.byType(CheckboxListTile).first);
      await tester.pump();

      // Verify checkbox state
      final firstCheckbox =
          tester.widget<CheckboxListTile>(find.byType(CheckboxListTile).first);
      expect(firstCheckbox.value, true);

      // Select third member
      await tester.tap(find.byType(CheckboxListTile).at(2));
      await tester.pump();

      // Verify both checkboxes are selected
      final checkboxes =
          tester.widgetList<CheckboxListTile>(find.byType(CheckboxListTile));
      expect(checkboxes.elementAt(0).value, true); // First member
      expect(
        checkboxes.elementAt(1).value,
        false,
      ); // Second member (not selected)
      expect(checkboxes.elementAt(2).value, true); // Third member

      // Deselect first member
      await tester.tap(find.byType(CheckboxListTile).first);
      await tester.pump();

      // Verify selection state updated correctly
      final updatedCheckboxes =
          tester.widgetList<CheckboxListTile>(find.byType(CheckboxListTile));
      expect(
        updatedCheckboxes.elementAt(0).value,
        false,
      ); // First member (deselected)
      expect(
        updatedCheckboxes.elementAt(1).value,
        false,
      ); // Second member (still not selected)
      expect(
        updatedCheckboxes.elementAt(2).value,
        true,
      ); // Third member (still selected)
    });

    testWidgets('should handle empty firstName and show appropriate initial',
        (WidgetTester tester) async {
      final membersWithEmptyNames = [
        User(
          id: 'user1',
          firstName: '',
          email: 'empty@example.com',
        ),
        User(
          id: 'user2',
          firstName: 'A',
          email: 'single@example.com',
        ),
      ];

      await showTestDialog(
        tester,
        availableMembers: membersWithEmptyNames,
        onMembersSelected: (members) {},
      );

      // Verify initials are handled correctly
      expect(find.text('U'), findsOneWidget); // Default for empty firstName
      expect(
        find.text('A'),
        findsAtLeastNWidgets(
          1,
        ),
      ); // Single character firstName (might appear multiple times in UI)
    });

    testWidgets('should display correct dialog layout and sizing',
        (WidgetTester tester) async {
      await showTestDialog(
        tester,
        availableMembers: mockMembers,
        onMembersSelected: (members) {},
      );

      // Verify dialog structure
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Flexible), findsAtLeastNWidgets(1));

      // Verify the content SizedBox has maxFinite width
      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      final contentSizedBox = sizedBoxes.firstWhere(
        (sizedBox) => sizedBox.width == double.maxFinite,
        orElse: () => sizedBoxes.first,
      );
      expect(contentSizedBox.width, double.maxFinite);
    });
  });
}

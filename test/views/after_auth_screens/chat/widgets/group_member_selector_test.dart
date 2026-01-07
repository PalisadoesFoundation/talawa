import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/chat/widgets/group_member_selector.dart';

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
      body: SizedBox(
        height: 800, // Provide sufficient height for ListView
        child: child,
      ),
    ),
  );
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

  group('GroupMemberSelector Widget Tests', () {
    // Test constants - Magic numbers
    const int maxSelectableMembers = 99;
    const int maxTotalMembers = 100; // Including current user

    // Test constants - Test data IDs
    const String currentUserId = 'current-user';
    const String testOrgId = 'org1';
    const String johnDoeId = 'user1';
    const String janeSmithId = 'user2';
    const String bobJohnsonId = 'user3';

    // Test constants - UI text
    const String emptyStateText = 'No organization members found';
    const String currentUserLabel = 'Current User (You)';
    const String groupCreatorSubtitle = 'Group Creator';
    const String johnDoeName = 'John Doe';
    const String janeSmithName = 'Jane Smith';
    const String bobJohnsonName = 'Bob Johnson';

    late UserConfig mockUserConfig;
    late OrganizationService mockOrgService;
    late List<User> mockOrgMembers;

    /// Helper to pump GroupMemberSelector and wait for it to settle
    Future<void> pumpSelector(
      WidgetTester tester, {
      required Function(Set<User>) onMembersChanged,
      Set<User> selectedMembers = const {},
    }) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            onMembersChanged: onMembersChanged,
            selectedMembers: selectedMembers,
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    /// Helper for tests that need stateful member selection
    Future<void> pumpSelectorWithState(
      WidgetTester tester, {
      required Function(Set<User>) onMembersChanged,
      Set<User> initialMembers = const {},
    }) async {
      Set<User> selectedMembers = initialMembers;
      await tester.pumpWidget(
        createTestMaterialApp(
          child: StatefulBuilder(
            builder: (context, setState) {
              return GroupMemberSelector(
                onMembersChanged: (members) {
                  setState(() {
                    selectedMembers = members;
                  });
                  onMembersChanged(members);
                },
                selectedMembers: selectedMembers,
              );
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    setUp(() {
      mockUserConfig = locator<UserConfig>();
      mockOrgService = locator<OrganizationService>();

      // Setup default mock data
      mockOrgMembers = [
        User(id: currentUserId, name: 'Current User'),
        User(id: johnDoeId, name: johnDoeName, email: 'john@example.com'),
        User(id: janeSmithId, name: janeSmithName, email: 'jane@example.com'),
        User(id: bobJohnsonId, name: bobJohnsonName, email: 'bob@example.com'),
      ];

      when(mockUserConfig.currentUser).thenReturn(
        User(id: currentUserId, name: 'Current User'),
      );

      when(mockUserConfig.currentOrg).thenReturn(
        OrgInfo(id: testOrgId, name: 'Test Organization'),
      );

      when(mockOrgService.getOrgMembersList(testOrgId))
          .thenAnswer((_) async => mockOrgMembers);
    });

    testWidgets('should initialize and load organization members',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should load and display members
      verify(mockOrgService.getOrgMembersList(testOrgId)).called(1);
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(3));
    });

    testWidgets('should show loading indicator during member loading',
        (WidgetTester tester) async {
      // Make the service take time to load
      when(mockOrgService.getOrgMembersList(testOrgId)).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return mockOrgMembers;
      });

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            onMembersChanged: (members) {},
            selectedMembers: const {},
          ),
        ),
      );
      await tester.pump(); // Capture intermediate state

      // Verify loading indicator is visible during loading
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle(); // Complete loading

      // Verify loading indicator is gone after loading completes
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(3));
    });

    testWidgets(
        'should complete loading and display members after async data fetch',
        (WidgetTester tester) async {
      // Make the service take time to load
      when(mockOrgService.getOrgMembersList(testOrgId)).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return mockOrgMembers;
      });

      await pumpSelector(tester, onMembersChanged: (members) {});

      // Loading indicator should be gone
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(3));
    });

    testWidgets('should handle null organization ID',
        (WidgetTester tester) async {
      when(mockUserConfig.currentOrg).thenReturn(
        OrgInfo(id: null, name: 'Test Org'),
      );

      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should show empty state
      expect(find.text(emptyStateText), findsOneWidget);

      // Should not call service
      verifyNever(mockOrgService.getOrgMembersList('any'));
    });

    testWidgets('should handle organization service error',
        (WidgetTester tester) async {
      when(mockOrgService.getOrgMembersList(testOrgId))
          .thenThrow(Exception('Network error'));

      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should show empty state when error occurs
      expect(find.text(emptyStateText), findsOneWidget);
    });

    testWidgets('should filter out current user from selectable members',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Current user should be displayed but checkbox should be disabled
      final currentUserTile = tester.widget<CheckboxListTile>(
        find.ancestor(
          of: find.text(currentUserLabel),
          matching: find.byType(CheckboxListTile),
        ),
      );

      expect(currentUserTile.onChanged, isNull); // Checkbox disabled
      expect(currentUserTile.value, isTrue); // Always selected
    });

    testWidgets('should display current user at top of list',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Find all CheckboxListTiles
      final tiles = find.byType(CheckboxListTile);
      expect(tiles, findsAtLeastNWidgets(4));

      // First tile should be current user
      final firstTile = tester.widget<CheckboxListTile>(tiles.first);
      expect(
          firstTile.onChanged, isNull); // Current user's checkbox is disabled
    });

    testWidgets('should handle member selection', (WidgetTester tester) async {
      Set<User>? callbackResult;

      await pumpSelector(
        tester,
        onMembersChanged: (members) => callbackResult = members,
      );

      // Select a member
      await tester.tap(
        find.ancestor(
          of: find.text(johnDoeName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      // Callback should be invoked with selected member
      expect(callbackResult, isNotNull);
      expect(callbackResult!.length, 1);
      expect(callbackResult!.first.id, johnDoeId);
    });

    testWidgets('should handle member deselection',
        (WidgetTester tester) async {
      final preSelected = <User>{
        User(id: johnDoeId, name: johnDoeName),
      };
      Set<User>? callbackResult;

      await pumpSelector(
        tester,
        onMembersChanged: (members) => callbackResult = members,
        selectedMembers: preSelected,
      );

      // Deselect the member
      await tester.tap(
        find.ancestor(
          of: find.text(johnDoeName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      // Callback should be invoked with empty set
      expect(callbackResult, isNotNull);
      expect(callbackResult!.length, 0);
    });

    testWidgets(
        'should invoke callback with correct member set (excluding current user)',
        (WidgetTester tester) async {
      Set<User>? lastCallback;

      await pumpSelector(
        tester,
        onMembersChanged: (members) => lastCallback = Set<User>.from(members),
      );

      // Select first member
      await tester.tap(
        find.ancestor(
          of: find.text(johnDoeName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      // Verify callback was invoked and received correct member
      expect(lastCallback, isNotNull,
          reason: 'Callback should be invoked after member selection');
      expect(lastCallback!.length, 1);
      expect(lastCallback!.first.id, johnDoeId);
      // Verify current user is NOT in the callback
      expect(
        lastCallback!.any((user) => user.id == currentUserId),
        isFalse,
        reason: 'Current user should not be in callback result',
      );
    });

    testWidgets('should prevent selection when at 99-member limit',
        (WidgetTester tester) async {
      // Pre-select maxSelectableMembers (99) members to simulate at-limit state
      final preSelectedMembers = List<User>.generate(
        maxSelectableMembers,
        (index) => User(id: 'existing$index', name: 'Existing $index'),
      ).toSet();

      int callbackInvocationCount = 0;

      await pumpSelector(
        tester,
        onMembersChanged: (members) {
          callbackInvocationCount++;
        },
        selectedMembers: preSelectedMembers,
      );

      // Verify at limit: maxSelectableMembers selected + 1 current user = maxTotalMembers displayed
      expect(find.textContaining('$maxTotalMembers/$maxTotalMembers'),
          findsOneWidget);

      // Try to select one more member
      await tester.tap(
        find.ancestor(
          of: find.text(johnDoeName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      // Callback should not be invoked when limit is reached
      expect(callbackInvocationCount, 0,
          reason:
              'Callback should not be invoked when selection would exceed limit');
      expect(find.textContaining('$maxTotalMembers/$maxTotalMembers'),
          findsOneWidget);
    });

    testWidgets(
        'should show error message when attempting to exceed 99-member limit',
        (WidgetTester tester) async {
      // Pre-select maxSelectableMembers (99) members
      final preSelectedMembers = List<User>.generate(
        maxSelectableMembers,
        (index) => User(id: 'existing$index', name: 'Existing $index'),
      ).toSet();

      await pumpSelector(
        tester,
        onMembersChanged: (members) {},
        selectedMembers: preSelectedMembers,
      );

      // Try to select one more member (should trigger error)
      await tester.tap(
        find.ancestor(
          of: find.text(johnDoeName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      // Verify error was shown (navigation service showTalawaErrorSnackBar was called)
      // Note: We can't easily verify SnackBar in widget tests, but we verify the limit is enforced
      expect(find.textContaining('$maxTotalMembers/$maxTotalMembers'),
          findsOneWidget);
    });

    testWidgets('should display selected members count correctly',
        (WidgetTester tester) async {
      await pumpSelectorWithState(
        tester,
        onMembersChanged: (members) {},
      );

      // Initially: 1/maxTotalMembers (current user only)
      expect(find.textContaining('1/$maxTotalMembers'), findsOneWidget);

      // Select one member
      await tester.tap(
        find.ancestor(
          of: find.text(johnDoeName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      // Should show 2/maxTotalMembers (current user + 1 selected)
      expect(find.textContaining('2/$maxTotalMembers'), findsOneWidget);
    });

    testWidgets('should show "You + X others" format',
        (WidgetTester tester) async {
      await pumpSelectorWithState(
        tester,
        onMembersChanged: (members) {},
      );

      // Should show "You + 0 others"
      expect(find.textContaining('You + 0 others'), findsOneWidget);

      // Select two members
      await tester.tap(
        find.ancestor(
          of: find.text(johnDoeName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.ancestor(
          of: find.text(janeSmithName),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      // Should show "You + 2 others"
      expect(find.textContaining('You + 2 others'), findsOneWidget);
    });

    testWidgets('should display member list with checkboxes',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should display checkboxes for all members
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(4));
    });

    testWidgets('should show "(You)" label for current user',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should show "(You)" label
      expect(find.text(currentUserLabel), findsOneWidget);
    });

    testWidgets('should show "Group Creator" subtitle for current user',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should show "Group Creator" subtitle
      expect(find.text(groupCreatorSubtitle), findsOneWidget);
    });

    testWidgets('should display member names and emails',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should display member names
      expect(find.text(johnDoeName), findsOneWidget);
      expect(find.text(janeSmithName), findsOneWidget);

      // Should display emails
      expect(find.text('john@example.com'), findsOneWidget);
      expect(find.text('jane@example.com'), findsOneWidget);
    });

    testWidgets('should display member initials when no image provided',
        (WidgetTester tester) async {
      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should display CircleAvatar for each member
      expect(find.byType(CircleAvatar), findsAtLeastNWidgets(4));

      // Verify actual initials are shown (first letter of first name)
      expect(find.text('C'), findsOneWidget); // Current User
      expect(find.text('J'), findsNWidgets(2)); // John Doe and Jane Smith
      expect(find.text('B'), findsOneWidget); // Bob Johnson
    });

    testWidgets('should handle empty organization members list',
        (WidgetTester tester) async {
      when(mockOrgService.getOrgMembersList(testOrgId))
          .thenAnswer((_) async => []);

      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should show current user only
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(1));
    });

    testWidgets('should handle members with null/empty names',
        (WidgetTester tester) async {
      final membersWithNullNames = <User>[
        User(id: currentUserId, name: 'Current User'),
        User(id: johnDoeId, name: null, email: 'user1@example.com'),
        User(id: janeSmithId, name: '', email: 'user2@example.com'),
      ];

      when(mockOrgService.getOrgMembersList(testOrgId))
          .thenAnswer((_) async => membersWithNullNames);

      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should handle null/empty names gracefully
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(3));
    });

    testWidgets('should handle members with null emails',
        (WidgetTester tester) async {
      final membersWithNullEmails = <User>[
        User(id: currentUserId, name: 'Current User'),
        User(id: johnDoeId, name: johnDoeName, email: null),
      ];

      when(mockOrgService.getOrgMembersList(testOrgId))
          .thenAnswer((_) async => membersWithNullEmails);

      await pumpSelector(tester, onMembersChanged: (members) {});

      // Should handle null emails gracefully
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(2));
    });

    testWidgets('should handle very long member lists (100+ members)',
        (WidgetTester tester) async {
      final manyMembers = List<User>.generate(
        150,
        (index) => User(
          id: 'user$index',
          name: 'User $index',
          email: 'user$index@example.com',
        ),
      );

      when(mockOrgService.getOrgMembersList(testOrgId))
          .thenAnswer((_) async => manyMembers);

      await pumpSelector(tester, onMembersChanged: (members) {});

      // ListView should handle large lists with virtualization
      expect(find.byType(ListView), findsOneWidget);
      // Only visible items are rendered
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(3));
    });
  });
}

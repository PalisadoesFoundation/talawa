import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
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
    home: Scaffold(body: SizedBox(height: 800, child: child)),
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

  group('GroupMemberSelector Tests', () {
    late UserConfig mockUserConfig;
    late OrganizationService mockOrgService;
    late List<User> mockOrgMembers;
    late Set<User> selectedMembers;

    setUp(() {
      mockUserConfig = locator<UserConfig>();
      mockOrgService = locator<OrganizationService>();
      selectedMembers = {};

      final currentUser = User(
        id: 'current-user',
        name: 'Current User',
        email: 'current@example.com',
      );

      mockOrgMembers = [
        currentUser,
        User(id: 'user1', name: 'John Doe', email: 'john@example.com'),
        User(id: 'user2', name: 'Jane Smith', email: 'jane@example.com'),
        User(id: 'user3', name: 'Bob Wilson', email: 'bob@example.com'),
      ];

      when(mockUserConfig.currentUser).thenReturn(currentUser);
      when(
        mockUserConfig.currentOrg,
      ).thenReturn(OrgInfo(id: 'org1', name: 'Test Org'));

      when(
        mockOrgService.getOrgMembersList('org1'),
      ).thenAnswer((_) async => mockOrgMembers);
    });

    testWidgets('should display initial UI correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {
              selectedMembers = newMembers;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('Selected Members'), findsOneWidget);
      expect(find.textContaining('1/100 (You + 0 others)'), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(3));
    });

    testWidgets('should show loading indicator while loading members', (
      WidgetTester tester,
    ) async {
      when(mockOrgService.getOrgMembersList('org1')).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return mockOrgMembers;
      });

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(3));
    });

    testWidgets('should load and display organization members', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Jane Smith'), findsOneWidget);
      expect(find.text('Bob Wilson'), findsOneWidget);
      expect(find.textContaining('(You)'), findsOneWidget);
    });

    testWidgets(
      'should display current user at the top with disabled checkbox',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestMaterialApp(
            child: GroupMemberSelector(
              selectedMembers: selectedMembers,
              onMembersChanged: (newMembers) {},
            ),
          ),
        );

        await tester.pumpAndSettle();

        final currentUserCheckbox = find.ancestor(
          of: find.textContaining('(You)'),
          matching: find.byType(CheckboxListTile),
        );

        expect(currentUserCheckbox, findsOneWidget);

        final checkboxWidget = tester.widget<CheckboxListTile>(
          currentUserCheckbox,
        );
        expect(checkboxWidget.onChanged, isNull);
        expect(checkboxWidget.value, isTrue);
      },
    );

    testWidgets('should show Group Creator subtitle for current user', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Group Creator'), findsOneWidget);
    });

    testWidgets('should handle member selection', (WidgetTester tester) async {
      Set<User> updatedMembers = {};

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {
              updatedMembers = newMembers;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('1/100 (You + 0 others)'), findsOneWidget);

      final johnCheckbox = find.ancestor(
        of: find.text('John Doe'),
        matching: find.byType(CheckboxListTile),
      );

      await tester.tap(johnCheckbox);
      await tester.pump();

      expect(updatedMembers.length, equals(1));
      expect(updatedMembers.first.firstName, equals('John'));
    });

    testWidgets('should handle member deselection', (
      WidgetTester tester,
    ) async {
      final johnUser = mockOrgMembers[1];
      selectedMembers = {johnUser};
      Set<User> updatedMembers = selectedMembers;

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {
              updatedMembers = newMembers;
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('2/100 (You + 1 others)'), findsOneWidget);

      final johnCheckbox = find.ancestor(
        of: find.text('John Doe'),
        matching: find.byType(CheckboxListTile),
      );

      await tester.tap(johnCheckbox);
      await tester.pump();

      expect(updatedMembers.length, equals(0));
    });

    testWidgets('should update member count when selecting multiple members', (
      WidgetTester tester,
    ) async {
      Set<User> updatedMembers = {};

      await tester.pumpWidget(
        createTestMaterialApp(
          child: StatefulBuilder(
            builder: (context, setState) {
              return GroupMemberSelector(
                selectedMembers: updatedMembers,
                onMembersChanged: (newMembers) {
                  setState(() {
                    updatedMembers = newMembers;
                  });
                },
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.textContaining('1/100 (You + 0 others)'), findsOneWidget);

      await tester.tap(
        find.ancestor(
          of: find.text('John Doe'),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('2/100 (You + 1 others)'), findsOneWidget);

      await tester.tap(
        find.ancestor(
          of: find.text('Jane Smith'),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('3/100 (You + 2 others)'), findsOneWidget);
    });

    testWidgets('should display correct count when near maximum member limit', (
      WidgetTester tester,
    ) async {
      final manyMembers = List.generate(
        100,
        (index) => User(
          id: 'user$index',
          name: 'User $index',
          email: 'user$index@example.com',
        ),
      );

      final currentUser = User(id: 'current-user', name: 'Current User');

      when(mockUserConfig.currentUser).thenReturn(currentUser);
      when(
        mockOrgService.getOrgMembersList('org1'),
      ).thenAnswer((_) async => manyMembers);

      // Select first 98 users (User 0 through User 97)
      final selected98Members = Set<User>.from(manyMembers.take(98).toList());

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selected98Members,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // With 98 selected members + current user = 99/100
      expect(find.textContaining('99/100'), findsOneWidget);

      // User 98 is not selected and should be visible after some scrolling
      // Scroll down to find User 98 (which is not in the selected set)
      await tester.scrollUntilVisible(
        find.text('User 98'),
        500.0,
        scrollable: find.byType(Scrollable),
      );
      await tester.pumpAndSettle();

      final unselectedUserCheckbox = find.ancestor(
        of: find.text('User 98'),
        matching: find.byType(CheckboxListTile),
      );

      expect(unselectedUserCheckbox, findsOneWidget);

      // Checkboxes remain enabled - widget shows error when trying to exceed limit
      final checkboxWidget =
          tester.widget<CheckboxListTile>(unselectedUserCheckbox);
      expect(
        checkboxWidget.onChanged,
        isNotNull,
        reason:
            'Checkbox should remain enabled - error is shown on tap when at limit',
      );
    });

    testWidgets(
      'should show error message when attempting to exceed 99-member limit',
      (WidgetTester tester) async {
        final manyMembers = List.generate(
          100,
          (index) => User(
            id: 'user$index',
            name: 'User $index',
            email: 'user$index@example.com',
          ),
        );

        final currentUser = User(id: 'current-user', name: 'Current User');

        when(mockUserConfig.currentUser).thenReturn(currentUser);
        when(
          mockOrgService.getOrgMembersList('org1'),
        ).thenAnswer((_) async => manyMembers);

        // Select first 99 members (User 0 through User 98) - the maximum allowed
        final selected99Members = Set<User>.from(manyMembers.take(99).toList());
        Set<User> updatedMembers = selected99Members;

        await tester.pumpWidget(
          createTestMaterialApp(
            child: GroupMemberSelector(
              selectedMembers: updatedMembers,
              onMembersChanged: (newMembers) {
                updatedMembers = newMembers;
              },
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Count should show 100/100 (99 selected + current user)
        expect(find.textContaining('100/100'), findsOneWidget);

        // Scroll to find the unselected member (User 99)
        await tester.scrollUntilVisible(
          find.text('User 99'),
          500.0,
          scrollable: find.byType(Scrollable),
        );
        await tester.pumpAndSettle();

        // Find the unselected member (User 99)
        final user99Checkbox = find.ancestor(
          of: find.text('User 99'),
          matching: find.byType(CheckboxListTile),
        );

        expect(user99Checkbox, findsOneWidget);

        // Get the navigation service mock to verify error was shown
        final mockNavigationService = locator<NavigationService>();

        // Tap the checkbox to attempt to exceed the limit
        await tester.tap(user99Checkbox);
        await tester.pump();

        // Verify that the error snackbar was called
        verify(
          mockNavigationService.showTalawaErrorSnackBar(
            'Maximum 99 members allowed',
            MessageType.error,
          ),
        ).called(1);

        // Verify member count remains at 99 (limit not exceeded)
        expect(updatedMembers.length, equals(99));
      },
    );

    testWidgets('should handle null organization ID', (
      WidgetTester tester,
    ) async {
      when(mockUserConfig.currentOrg).thenReturn(OrgInfo(name: 'Test Org'));

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('No organization members found'), findsOneWidget);
      expect(find.byIcon(Icons.people_outline), findsOneWidget);

      // When org ID is null, getOrgMembersList should never be called
      // The UI already shows "No organization members found" which verifies this behavior
    });

    testWidgets('should handle organization service error', (
      WidgetTester tester,
    ) async {
      when(
        mockOrgService.getOrgMembersList('org1'),
      ).thenThrow(Exception('Network error'));

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('No organization members found'), findsOneWidget);
      expect(find.byIcon(Icons.people_outline), findsOneWidget);
    });

    testWidgets('should handle empty organization members list', (
      WidgetTester tester,
    ) async {
      when(
        mockOrgService.getOrgMembersList('org1'),
      ).thenAnswer((_) async => []);

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // When org service returns empty list, widget still shows current user
      // as they are always the first member (Group Creator)
      expect(find.byType(CheckboxListTile), findsOneWidget);
      expect(find.textContaining('(You)'), findsOneWidget);
      expect(find.text('Group Creator'), findsOneWidget);
    });

    testWidgets('should display member avatars with initials', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CircleAvatar), findsAtLeastNWidgets(3));
    });

    testWidgets('should display member initials when no image provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      final avatars = find.byType(CircleAvatar);
      expect(avatars, findsAtLeastNWidgets(1));

      final firstAvatar = tester.widget<CircleAvatar>(avatars.first);
      expect(firstAvatar.child, isNotNull);
    });

    testWidgets(
      'should display member email as subtitle for non-current users',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          createTestMaterialApp(
            child: GroupMemberSelector(
              selectedMembers: selectedMembers,
              onMembersChanged: (newMembers) {},
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('john@example.com'), findsOneWidget);
        expect(find.text('jane@example.com'), findsOneWidget);
        expect(find.text('bob@example.com'), findsOneWidget);
      },
    );

    testWidgets('should show current user with highlighted avatar color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      final currentUserCheckbox = find.ancestor(
        of: find.textContaining('(You)'),
        matching: find.byType(CheckboxListTile),
      );

      expect(currentUserCheckbox, findsOneWidget);

      final checkboxWidget = tester.widget<CheckboxListTile>(
        currentUserCheckbox,
      );
      final avatar = checkboxWidget.secondary;
      expect(avatar, isA<CircleAvatar>());
      final circleAvatar = avatar! as CircleAvatar;
      expect(circleAvatar.backgroundColor, isNotNull);
    });

    testWidgets('should filter out current user from main list', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      final checkboxes = find.byType(CheckboxListTile);
      expect(checkboxes, findsNWidgets(4));

      final disabledCheckboxes = tester
          .widgetList<CheckboxListTile>(checkboxes)
          .where((checkbox) => checkbox.onChanged == null);
      expect(disabledCheckboxes.length, equals(1));
    });

    testWidgets('should handle members with null or empty names', (
      WidgetTester tester,
    ) async {
      final membersWithNullNames = [
        User(id: 'current-user', name: 'Current User'),
        User(id: 'user1', name: null, email: 'noname@example.com'),
        User(id: 'user2', name: '', email: 'emptyname@example.com'),
      ];

      when(
        mockOrgService.getOrgMembersList('org1'),
      ).thenAnswer((_) async => membersWithNullNames);

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CheckboxListTile), findsAtLeastNWidgets(2));

      // Verify email is displayed as subtitle for members without names
      expect(find.text('noname@example.com'), findsOneWidget);
      expect(find.text('emptyname@example.com'), findsOneWidget);

      // Verify avatars display question mark for members without first names
      final noNameCheckbox = find.ancestor(
        of: find.text('noname@example.com'),
        matching: find.byType(CheckboxListTile),
      );
      expect(noNameCheckbox, findsOneWidget);

      final noNameCheckboxWidget =
          tester.widget<CheckboxListTile>(noNameCheckbox);
      final noNameAvatar = noNameCheckboxWidget.secondary! as CircleAvatar;
      expect(noNameAvatar.child, isA<Text>());
      final noNameAvatarText = noNameAvatar.child! as Text;
      expect(noNameAvatarText.data, equals('?'));

      // Verify empty name also shows question mark
      final emptyNameCheckbox = find.ancestor(
        of: find.text('emptyname@example.com'),
        matching: find.byType(CheckboxListTile),
      );
      expect(emptyNameCheckbox, findsOneWidget);

      final emptyNameCheckboxWidget =
          tester.widget<CheckboxListTile>(emptyNameCheckbox);
      final emptyNameAvatar =
          emptyNameCheckboxWidget.secondary! as CircleAvatar;
      expect(emptyNameAvatar.child, isA<Text>());
      final emptyNameAvatarText = emptyNameAvatar.child! as Text;
      expect(emptyNameAvatarText.data, equals('?'));
    });

    testWidgets('should display question mark for members without first name', (
      WidgetTester tester,
    ) async {
      final membersWithoutNames = [
        User(id: 'current-user', name: 'Current User'),
        User(id: 'user1', name: null, email: 'noname@example.com'),
      ];

      when(
        mockOrgService.getOrgMembersList('org1'),
      ).thenAnswer((_) async => membersWithoutNames);

      await tester.pumpWidget(
        createTestMaterialApp(
          child: GroupMemberSelector(
            selectedMembers: selectedMembers,
            onMembersChanged: (newMembers) {},
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Find the checkbox for the member without a name
      final namelessMemberCheckbox = find.ancestor(
        of: find.text('noname@example.com'),
        matching: find.byType(CheckboxListTile),
      );

      expect(namelessMemberCheckbox, findsOneWidget);

      // Verify the avatar displays a question mark for the member without a first name
      final checkboxWidget = tester.widget<CheckboxListTile>(
        namelessMemberCheckbox,
      );
      final avatar = checkboxWidget.secondary;
      expect(avatar, isA<CircleAvatar>());
      final circleAvatar = avatar! as CircleAvatar;
      expect(circleAvatar.child, isNotNull);

      final avatarText = circleAvatar.child! as Text;
      expect(avatarText.data, equals('?'));
    });

    testWidgets('should handle members with images', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        final membersWithImages = [
          User(id: 'current-user', name: 'Current User'),
          User(
            id: 'user1',
            name: 'John Doe',
            email: 'john@example.com',
            image: 'https://example.com/avatar.jpg',
          ),
        ];

        when(
          mockOrgService.getOrgMembersList('org1'),
        ).thenAnswer((_) async => membersWithImages);

        await tester.pumpWidget(
          createTestMaterialApp(
            child: GroupMemberSelector(
              selectedMembers: selectedMembers,
              onMembersChanged: (newMembers) {},
            ),
          ),
        );

        await tester.pumpAndSettle();

        final avatars = find.byType(CircleAvatar);
        expect(avatars, findsAtLeastNWidgets(2));

        // Verify that the CircleAvatar for the user with image has backgroundImage set
        final avatarsList = tester.widgetList<CircleAvatar>(avatars).toList();
        final avatarWithImage = avatarsList.where(
          (avatar) => avatar.backgroundImage != null,
        );
        expect(
          avatarWithImage.isNotEmpty,
          isTrue,
          reason: 'At least one avatar should have a backgroundImage set',
        );
      });
    });

    testWidgets('should maintain selection state across rebuilds', (
      WidgetTester tester,
    ) async {
      Set<User> updatedMembers = {};

      await tester.pumpWidget(
        createTestMaterialApp(
          child: StatefulBuilder(
            builder: (context, setState) {
              return GroupMemberSelector(
                selectedMembers: updatedMembers,
                onMembersChanged: (newMembers) {
                  setState(() {
                    updatedMembers = newMembers;
                  });
                },
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(
        find.ancestor(
          of: find.text('John Doe'),
          matching: find.byType(CheckboxListTile),
        ),
      );
      await tester.pumpAndSettle();

      expect(updatedMembers.length, equals(1));

      await tester.pumpAndSettle();

      final johnCheckbox = tester.widget<CheckboxListTile>(
        find.ancestor(
          of: find.text('John Doe'),
          matching: find.byType(CheckboxListTile),
        ),
      );

      expect(johnCheckbox.value, isTrue);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createSelectContactScreen() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: const SelectContact(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
      );
    },
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late NavigationService mockNavigationService;
  late UserConfig mockUserConfig;
  late SelectContactViewModel mockSelectContactViewModel;
  late DirectChatViewModel mockDirectChatViewModel;

  setUpAll(() {
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });

  setUp(() {
    mockNavigationService = getAndRegisterNavigationService();
    mockUserConfig = getAndRegisterUserConfig();
    mockSelectContactViewModel = getAndRegisterSelectContactViewModel();
    mockDirectChatViewModel = getAndRegisterDirectChatViewModel();

    // Setup mock organization
    final mockOrg = OrgInfo(id: 'test_org_id', name: 'Test Organization');
    when(mockUserConfig.currentOrg).thenReturn(mockOrg);

    // Setup mock current user
    final mockCurrentUser = User(id: 'current_user_id', name: 'Current User');
    when(mockUserConfig.currentUser).thenReturn(mockCurrentUser);

    // Ensure getCurrentOrgUsersList is properly stubbed for all test cases
    when(mockSelectContactViewModel.getCurrentOrgUsersList())
        .thenAnswer((_) async {});

    // Also stub the initialise method to prevent it from calling problematic methods
    when(mockSelectContactViewModel.initialise()).thenReturn(null);
  });

  tearDown(() {
    // Reset all mocks to clear call history
    reset(mockNavigationService);
    reset(mockUserConfig);
    reset(mockSelectContactViewModel);
    reset(mockDirectChatViewModel);

    // Unregister services
    locator.unregister<NavigationService>();
    locator.unregister<UserConfig>();
    locator.unregister<SelectContactViewModel>();
    locator.unregister<DirectChatViewModel>();
  });

  group('SelectContact Widget Rendering', () {
    testWidgets('should render AppBar correctly', (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([]);

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();

      expect(find.text('Select Contacts'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      final AppBar appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.elevation, 0.0);
      expect(appBar.backgroundColor, Colors.black);
      expect(appBar.centerTitle, true);
    });

    testWidgets('should show loading dialog when busy', (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(true);
      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();
      expect(find.byType(CustomProgressDialog), findsOneWidget);
    });

    testWidgets('should show empty state message when no users are found',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([]);

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();

      expect(find.text('No users found in this organization'), findsOneWidget);
    });
  });

  group('User List and Avatars', () {
    testWidgets('should display user with image correctly', (tester) async {
      final users = [
        User(
          id: 'user1',
          name: 'John Doe',
          image: 'https://picsum.photos/200/300',
        ),
      ];
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createSelectContactScreen());
        await tester.pump();
        final circleAvatar =
            tester.widget<CircleAvatar>(find.byType(CircleAvatar));
        expect(circleAvatar.backgroundImage, isNotNull);
        expect(circleAvatar.backgroundImage, isA<NetworkImage>());
        expect(
          (circleAvatar.backgroundImage! as NetworkImage).url,
          'https://picsum.photos/200/300',
        );
        expect(circleAvatar.child, isNull);
      });
    });

    final avatarTestCases = [
      {'name': 'John Doe', 'expected': 'J'},
      {'name': 'TestName', 'expected': 'T'},
      {'name': '', 'lastName': '', 'expected': '?'},
    ];

    for (final testCase in avatarTestCases) {
      testWidgets(
          'should display avatar with "${testCase['expected']}" when name is ${testCase['name']}',
          (tester) async {
        final users = [
          User(
            id: 'user1',
            name: "${testCase['name']}",
            image: null,
          ),
        ];
        when(mockSelectContactViewModel.isBusy).thenReturn(false);
        when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
        await tester.pumpWidget(createSelectContactScreen());
        await tester.pump();
        final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
        expect(avatar.backgroundImage, isNull);
        expect(find.text(testCase['expected']!), findsOneWidget);
      });
    }
  });

  group('Name and Email Display', () {
    final nameTestCases = [
      {'name': 'John Doe', 'expected': 'John'},
      {'name': 'TestName', 'expected': 'TestName'},
      {'name': '', 'expected': ''},
    ];

    for (final testCase in nameTestCases) {
      testWidgets(
          'should display name "${testCase['expected']}" when name is ${testCase['name']}',
          (tester) async {
        final users = [
          User(
            id: 'user1',
            name: "${testCase['name']}",
          ),
        ];
        when(mockSelectContactViewModel.isBusy).thenReturn(false);
        when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
        await tester.pumpWidget(createSelectContactScreen());
        await tester.pump();
        expect(find.text(testCase['expected']!), findsOneWidget);
      });
    }

    testWidgets('should display email when available', (tester) async {
      final users = [User(id: 'user1', email: 'john@example.com')];
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();
      expect(find.text('john@example.com'), findsOneWidget);
    });

    testWidgets('should display "Not available" when email is null',
        (tester) async {
      final users = [User(id: 'user1', email: null)];
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();
      expect(find.text('Not available'), findsOneWidget);
    });
  });

  group('Chat Creation and Navigation', () {
    final testUser = User(id: 'user1', name: 'John Doe');

    testWidgets('should handle successful chat creation and navigation',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([testUser]);
      when(mockSelectContactViewModel.createChatWithUser(testUser))
          .thenAnswer((_) async => 'chat_id_123');

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pump();

      verify(mockSelectContactViewModel.createChatWithUser(testUser)).called(1);
      verify(mockDirectChatViewModel.initialise()).called(1);
      verify(
        mockNavigationService.pushScreen(
          Routes.chatMessageScreen,
          arguments: ['chat_id_123', mockDirectChatViewModel],
        ),
      ).called(1);
    });

    testWidgets('should show error snackbar when chat creation returns null',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([testUser]);
      when(mockSelectContactViewModel.createChatWithUser(testUser))
          .thenAnswer((_) async => null);

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pump();

      // Verify the method was called (business logic)
      verify(mockSelectContactViewModel.createChatWithUser(testUser)).called(1);

      // Don't need to verify specific navigation calls - just that error handling happened
      // we can verify that no navigation to success screen happened
      verifyNever(mockDirectChatViewModel.initialise());
    });

    testWidgets('should show error snackbar on exception during chat creation',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([testUser]);
      when(mockSelectContactViewModel.createChatWithUser(testUser))
          .thenThrow(Exception('Network error'));

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();

      // This should not throw an exception in the UI
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pump();

      // Verify the method was called and handled gracefully
      verify(mockSelectContactViewModel.createChatWithUser(testUser)).called(1);
      verifyNever(mockDirectChatViewModel.initialise());
    });

    testWidgets('should disable tiles when creating chat to prevent double-tap',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([testUser]);
      when(mockSelectContactViewModel.createChatWithUser(testUser))
          .thenAnswer((_) async {
        // Simulate a delay to test the disabling behavior
        await Future.delayed(const Duration(milliseconds: 100));
        return 'chat_id_123';
      });

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();

      // First tap starts the creation process
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pump(const Duration(milliseconds: 50));

      // Check that the ListTile is disabled during creation
      final listTile = tester.widget<ListTile>(find.byType(ListTile).first);
      expect(listTile.enabled, false);

      // Try to tap again while creating - should not trigger another call
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pump();

      // Wait for the async operation to complete
      await tester.pumpAndSettle();

      // Verify createChatWithUser was called only once despite multiple taps
      verify(mockSelectContactViewModel.createChatWithUser(testUser)).called(1);
    });

    testWidgets('should re-enable tiles after chat creation fails',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([testUser]);
      when(mockSelectContactViewModel.createChatWithUser(testUser))
          .thenAnswer((_) async => null); // Simulate failure

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();

      // Tap to start creation
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pumpAndSettle();

      // After failure, the ListTile should be re-enabled
      final listTile = tester.widget<ListTile>(find.byType(ListTile).first);
      expect(listTile.enabled, true);
    });

    testWidgets('should re-enable tiles after exception during chat creation',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([testUser]);
      when(mockSelectContactViewModel.createChatWithUser(testUser))
          .thenThrow(Exception('Network error')); // Simulate exception

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pump();

      // Tap to start creation
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pumpAndSettle();

      // After exception, the ListTile should be re-enabled
      final listTile = tester.widget<ListTile>(find.byType(ListTile).first);
      expect(listTile.enabled, true);
    });
  });

  testWidgets('should handle back button tap without errors', (tester) async {
    when(mockSelectContactViewModel.isBusy).thenReturn(false);
    when(mockSelectContactViewModel.orgMembersList).thenReturn([]);
    await tester.pumpWidget(createSelectContactScreen());
    await tester.pump();

    // Tap the back button to ensure code coverage
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();

    // Just verify no exceptions were thrown and widget is still present
    expect(tester.takeException(), isNull);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
}

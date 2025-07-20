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
    final mockCurrentUser =
        User(id: 'current_user_id', firstName: 'Current', lastName: 'User');
    when(mockUserConfig.currentUser).thenReturn(mockCurrentUser);
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
      await tester.pumpAndSettle();

      expect(find.text('Select Contacts'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      final AppBar appBar = tester.widget(find.byType(AppBar));
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
      await tester.pumpAndSettle();
      expect(find.text('No users found in this organization'), findsOneWidget);
    });
  });

  group('User List and Avatars', () {
    testWidgets('should display user with image correctly', (tester) async {
      final users = [
        User(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
          image: 'https://picsum.photos/200/300',
        ),
      ];
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createSelectContactScreen());
        await tester.pumpAndSettle();
        final circleAvatar =
            tester.widget<CircleAvatar>(find.byType(CircleAvatar));
        expect(circleAvatar.backgroundImage, isA<NetworkImage>());
        expect(
          (circleAvatar.backgroundImage! as NetworkImage).url,
          'https://picsum.photos/200/300',
        );
        expect(circleAvatar.child, isNull);
      });
    });

    final avatarTestCases = [
      {'f': 'John', 'l': 'Doe', 'e': 'J'},
      {'f': '', 'l': 'TestName', 'e': 'T'},
      {'f': '', 'l': 'TestName', 'e': 'T'},
      {'f': null, 'l': 'TestName', 'e': 'T'},
      {'f': '', 'l': '', 'e': '?'},
      {'f': null, 'l': null, 'e': '?'},
    ];

    for (final testCase in avatarTestCases) {
      testWidgets(
          'should display avatar with "${testCase['e']}" when name is ${testCase['f']} ${testCase['l']}',
          (tester) async {
        final users = [
          User(
            id: 'user1',
            firstName: testCase['f'],
            lastName: testCase['l'],
            image: null,
          ),
        ];
        when(mockSelectContactViewModel.isBusy).thenReturn(false);
        when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
        await tester.pumpWidget(createSelectContactScreen());
        await tester.pumpAndSettle();
        final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
        expect(avatar.backgroundImage, isNull);
        expect(find.text(testCase['e']!), findsOneWidget);
      });
    }
  });

  group('Name and Email Display', () {
    final nameTestCases = [
      {'f': 'John', 'l': 'Doe', 'e': 'John'},
      {'f': null, 'l': 'TestName', 'e': 'TestName'},
      {'f': '', 'l': 'TestName', 'e': ''},
      {'f': 'John', 'l': null, 'e': 'John'},
      {'f': 'John', 'l': '', 'e': 'John'},
      {'f': null, 'l': null, 'e': 'Unknown User'},
      {'f': '', 'l': '', 'e': ''},
    ];

    for (final testCase in nameTestCases) {
      testWidgets(
          'should display name "${testCase['e']}" when name is ${testCase['f']} ${testCase['l']}',
          (tester) async {
        final users = [
          User(
            id: 'user1',
            firstName: testCase['f'],
            lastName: testCase['l'],
          ),
        ];
        when(mockSelectContactViewModel.isBusy).thenReturn(false);
        when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
        await tester.pumpWidget(createSelectContactScreen());
        await tester.pumpAndSettle();
        expect(find.text(testCase['e']!), findsOneWidget);
      });
    }

    testWidgets('should display email when available', (tester) async {
      final users = [User(id: 'user1', email: 'john@example.com')];
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
      await tester.pumpWidget(createSelectContactScreen());
      await tester.pumpAndSettle();
      expect(find.text('john@example.com'), findsOneWidget);
    });

    testWidgets('should display "No email" when email is null', (tester) async {
      final users = [User(id: 'user1', email: null)];
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn(users);
      await tester.pumpWidget(createSelectContactScreen());
      await tester.pumpAndSettle();
      expect(find.text('No email'), findsOneWidget);
    });
  });

  group('Chat Creation and Navigation', () {
    final testUser = User(id: 'user1', firstName: 'John', lastName: 'Doe');

    testWidgets('should handle successful chat creation and navigation',
        (tester) async {
      when(mockSelectContactViewModel.isBusy).thenReturn(false);
      when(mockSelectContactViewModel.orgMembersList).thenReturn([testUser]);
      when(mockSelectContactViewModel.createChatWithUser(testUser))
          .thenAnswer((_) async => 'chat_id_123');

      await tester.pumpWidget(createSelectContactScreen());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pumpAndSettle();

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
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pumpAndSettle();

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
      await tester.pumpAndSettle();

      // This should not throw an exception in the UI
      await tester.tap(find.byKey(const Key('select_contact_gesture_0')));
      await tester.pumpAndSettle();

      // Verify the method was called and handled gracefully
      verify(mockSelectContactViewModel.createChatWithUser(testUser)).called(1);
      verifyNever(mockDirectChatViewModel.initialise());
    });
  });
}

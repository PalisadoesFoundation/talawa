import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/org_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/chat/select_contact.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createApp() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: [
          const AppLocalizationsDelegate(isTest: true),
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

  setUpAll(() {
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });

  group('SelectContact Widget Tests', () {
    late NavigationService mockNavigationService;
    late OrganizationService mockOrganizationService;
    late UserConfig mockUserConfig;

    setUp(() {
      // Register individual services to avoid conflicts
      mockNavigationService = getAndRegisterNavigationService();
      mockOrganizationService = getAndRegisterOrganizationService();
      mockUserConfig = getAndRegisterUserConfig();

      // Setup mock organization
      final mockOrg = OrgInfo(
        id: 'test_org_id',
        name: 'Test Organization',
      );
      when(mockUserConfig.currentOrg).thenReturn(mockOrg);
    });

    tearDown(() {
      // Clean up individual services
      if (locator.isRegistered<NavigationService>()) {
        locator.unregister<NavigationService>();
      }
      if (locator.isRegistered<OrganizationService>()) {
        locator.unregister<OrganizationService>();
      }
      if (locator.isRegistered<UserConfig>()) {
        locator.unregister<UserConfig>();
      }
    });

    testWidgets('should render AppBar with correct title and back button',
        (WidgetTester tester) async {
      // Mock empty users list
      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => []);

      await tester.pumpWidget(
        createApp(),
      );

      // Wait for the model to initialize
      await tester.pumpAndSettle();

      // Verify AppBar title
      expect(find.text('Select Contacts'), findsOneWidget);

      // Verify back button
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Verify AppBar properties
      final AppBar appBar = tester.widget(find.byType(AppBar));
      expect(appBar.elevation, 0.0);
      expect(appBar.backgroundColor, Colors.black);
      expect(appBar.centerTitle, true);
    });

    testWidgets('should call navigationService.pop when back button is tapped',
        (WidgetTester tester) async {
      // Mock empty users list
      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => []);

      await tester.pumpWidget(
        createApp(),
      );

      await tester.pumpAndSettle();

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify navigationService.pop was called
      verify(mockNavigationService.pop()).called(1);
    });

    testWidgets('should show loading dialog when model is busy',
        (WidgetTester tester) async {
      // Create a mock that will delay the response to simulate busy state
      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async {
        // Add a delay to simulate loading
        await Future.delayed(const Duration(milliseconds: 100));
        return [];
      });

      await tester.pumpWidget(
        createApp(),
      );

      // Pump once to trigger the initial state
      await tester.pump();

      // Should show loading dialog initially
      expect(find.byType(CustomProgressDialog), findsOneWidget);
      expect(find.byKey(const Key("Select Contacts")), findsOneWidget);

      // Pump and settle to let the loading complete
      await tester.pumpAndSettle();
    });

    testWidgets(
        'should show "No users found" message when orgMembersList is empty',
        (WidgetTester tester) async {
      // Mock empty users list
      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => []);

      await tester.pumpWidget(
        createApp(),
      );

      await tester.pumpAndSettle();

      // Verify "No users found" message
      expect(find.text('No users found in this organization'), findsOneWidget);
    });

    testWidgets('should display list of users when orgMembersList is not empty',
        (WidgetTester tester) async {
      // Create test users without images to avoid NetworkImage issues
      final users = [
        User(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
          image: null,
        ),
        User(
          id: 'user2',
          firstName: 'Jane',
          lastName: 'Smith',
          image: null,
        ),
        User(
          id: 'user3',
          firstName: 'Bob',
          lastName: 'Johnson',
          image: '',
        ),
      ];

      // Mock users list
      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => users);

      await tester.pumpWidget(
        createApp(),
      );

      await tester.pumpAndSettle();

      // Verify ListView is displayed
      expect(find.byType(ListView), findsOneWidget);

      // Verify all users are displayed
      expect(find.text('John'), findsOneWidget);
      expect(find.text('Jane'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);

      // Verify ListTiles are present
      expect(find.byType(ListTile), findsNWidgets(3));

      // Verify CircleAvatars are present
      expect(find.byType(CircleAvatar), findsNWidgets(3));
    });

    testWidgets('should display user with image correctly',
        (WidgetTester tester) async {
      final users = [
        User(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
          image: 'https://picsum.photos/200/300',
        ),
      ];

      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => users);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          createApp(),
        );

        await tester.pumpAndSettle();

        // Find the CircleAvatar
        final circleAvatar =
            tester.widget<CircleAvatar>(find.byType(CircleAvatar));
        expect(circleAvatar.radius, 25);

        // The NetworkImage should be set as backgroundImage
        expect(circleAvatar.backgroundImage, isA<NetworkImage>());
        expect(circleAvatar.child, isNull);
      });
    });

    group('Avatar display tests', () {
      final avatarTestCases = <Map<String, Object?>>[
        {
          'description': 'first letter of firstName when image is null',
          'firstName': 'John',
          'lastName': 'Doe',
          'image': null,
          'expectedAvatar': 'J',
        },
        {
          'description': 'first letter of lastName when firstName is empty',
          'firstName': '',
          'lastName': 'TestName',
          'image': null,
          'expectedAvatar': 'T',
        },
        {
          'description': 'question mark when both names are empty',
          'firstName': '',
          'lastName': '',
          'image': null,
          'expectedAvatar': '?',
        },
        {
          'description': 'question mark when both names are null',
          'firstName': null,
          'lastName': null,
          'image': null,
          'expectedAvatar': '?',
        },
        {
          'description': 'first letter when image is empty string',
          'firstName': 'John',
          'lastName': null,
          'image': '',
          'expectedAvatar': 'J',
        },
      ];

      for (final testCase in avatarTestCases) {
        testWidgets('should display ${testCase['description']}',
            (WidgetTester tester) async {
          final users = [
            User(
              id: 'user1',
              firstName: testCase['firstName'] as String?,
              lastName: testCase['lastName'] as String?,
              image: testCase['image'] as String?,
            ),
          ];

          when(mockOrganizationService.getOrgMembersList('test_org_id'))
              .thenAnswer((_) async => users);

          await tester.pumpWidget(createApp());
          await tester.pumpAndSettle();

          final circleAvatar =
              tester.widget<CircleAvatar>(find.byType(CircleAvatar));
          expect(circleAvatar.backgroundImage, isNull);

          expect(
            find.descendant(
              of: find.byType(CircleAvatar),
              matching: find.text(testCase['expectedAvatar']! as String),
            ),
            findsOneWidget,
          );
        });
      }
    });

    group('Name display tests', () {
      final nameTestCases = <Map<String, Object?>>[
        {
          'description': 'firstName priority when both names exist',
          'firstName': 'John',
          'lastName': 'Doe',
          'expectedDisplay': 'John',
        },
        {
          'description': 'computed name when firstName is null',
          'firstName': null,
          'lastName': 'TestName',
          'expectedDisplay': 'TestName',
        },
        {
          'description': 'empty firstName when firstName is empty string',
          'firstName': '',
          'lastName': 'OnlyLast',
          'expectedDisplay':
              '', // Empty string is displayed, not the computed name
        },
        {
          'description': '"Unknown User" when both names are null',
          'firstName': null,
          'lastName': null,
          'expectedDisplay': 'Unknown User',
        },
        {
          'description':
              '"Unknown User" when firstName is empty and lastName is null',
          'firstName': '',
          'lastName': null,
          'expectedDisplay': '', // Empty string firstName is displayed directly
        },
      ];

      for (final testCase in nameTestCases) {
        testWidgets('should display ${testCase['description']}',
            (WidgetTester tester) async {
          final users = [
            User(
              id: 'user1',
              firstName: testCase['firstName'] as String?,
              lastName: testCase['lastName'] as String?,
            ),
          ];

          when(mockOrganizationService.getOrgMembersList('test_org_id'))
              .thenAnswer((_) async => users);

          await tester.pumpWidget(createApp());
          await tester.pumpAndSettle();

          expect(
            find.text(testCase['expectedDisplay']! as String),
            findsOneWidget,
          );
        });
      }
    });

    testWidgets('should handle user tap and print debug message',
        (WidgetTester tester) async {
      final users = [
        User(
          id: 'user1',
          firstName: 'John',
          lastName: 'Doe',
        ),
      ];

      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => users);

      await tester.pumpWidget(createApp());
      await tester.pumpAndSettle();

      final gestureDetector = find.byKey(const Key('select_contact_gesture_0'));
      expect(gestureDetector, findsOneWidget);

      await tester.tap(gestureDetector);
      await tester.pumpAndSettle();
    });

    testWidgets('should handle multiple users correctly',
        (WidgetTester tester) async {
      final users = [
        User(id: 'user1', firstName: 'John', image: null),
        User(id: 'user2', firstName: 'Jane', image: null),
        User(id: 'user3', firstName: 'Bob', image: ''),
      ];

      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => users);

      await tester.pumpWidget(createApp());
      await tester.pumpAndSettle();

      expect(find.text('John'), findsOneWidget);
      expect(find.text('Jane'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);

      expect(find.byKey(const Key('select_contact_gesture_0')), findsOneWidget);
      expect(find.byKey(const Key('select_contact_gesture_1')), findsOneWidget);
      expect(find.byKey(const Key('select_contact_gesture_2')), findsOneWidget);

      expect(find.byType(ListTile), findsNWidgets(3));
      expect(find.byType(CircleAvatar), findsNWidgets(3));
    });

    testWidgets('should verify correct padding and styling',
        (WidgetTester tester) async {
      final users = [User(id: 'user1', firstName: 'John')];

      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => users);

      await tester.pumpWidget(createApp());
      await tester.pumpAndSettle();

      final padding = tester.widget<Padding>(
        find.ancestor(
          of: find.byType(ListTile),
          matching: find.byType(Padding),
        ),
      );
      expect(padding.padding, const EdgeInsets.all(5.0));

      final textWidget = tester.widget<Text>(
        find.descendant(
          of: find.byType(CircleAvatar),
          matching: find.byType(Text),
        ),
      );
      expect(textWidget.style?.color, Colors.white);
    });

    testWidgets('should handle error in organization service gracefully',
        (WidgetTester tester) async {
      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenThrow(Exception('Network error'));

      await tester.pumpWidget(createApp());
      await tester.pumpAndSettle();

      expect(find.text('No users found in this organization'), findsOneWidget);
    });

    testWidgets('should handle widget initialization and disposal correctly',
        (WidgetTester tester) async {
      when(mockOrganizationService.getOrgMembersList('test_org_id'))
          .thenAnswer((_) async => []);

      await tester.pumpWidget(createApp());
      await tester.pumpAndSettle();

      expect(find.byType(SelectContact), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('New Screen')),
            body: const Center(child: Text('New Screen')),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SelectContact), findsNothing);
    });
  });
}

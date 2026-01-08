import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

class MockUserConfig extends Mock implements UserConfig {
  @override
  User get currentUser => User(
        id: 'xyz1',
        authToken: 'testtoken',
        joinedOrganizations: [
          OrgInfo(
            id: 'xyz1',
            name: 'Test Org',
          ),
        ],
      );
  @override
  OrgInfo get currentOrg => OrgInfo(
        id: 'xyz1',
        name: 'Test Org',
      );
  @override
  Future<bool> updateUser(User updatedUserDetails) {
    if (updatedUserDetails.id == 'xyz1') {
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  void saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {}
}

/// Mock UserConfig for testing membershipRequests navigation path
class MockUserConfigWithMembershipRequests extends Mock implements UserConfig {
  @override
  User get currentUser => User(
        id: 'xyz-membership',
        authToken: 'testtoken',
        joinedOrganizations: [], // Empty - user hasn't joined any org
        membershipRequests: ['org1', 'org2'], // Has pending requests
      );
  @override
  OrgInfo get currentOrg => OrgInfo(
        id: 'xyz1',
        name: 'Test Org',
      );
  @override
  Future<bool> updateUser(User updatedUserDetails) {
    return Future.value(true); // Always return true for this test
  }

  @override
  void saveCurrentOrgInHive(OrgInfo saveOrgAsCurrent) {}
}

var mockSignUpData = {
  'signUp': {
    'authenticationToken': 'testtoken',
    'refreshToken': 'testtoken',
    'user': {
      'id': 'xyz1',
      'name': 'Test User',
      'avatarURL': 'https://example.com/avatar.png',
      'emailAddress': 'testuser@gmail.com',
      'organizationsWhereMember': {
        'edges': [
          {
            'node': {
              'id': 'xyz1',
              'name': 'Test Org',
              'addressLine1': '123 Main St',
              'addressLine2': 'Suite 100',
              'avatarMimeType': 'image/png',
              'avatarURL': 'https://example.com/org_avatar.png',
              'postalCode': '12345',
              'countryCode': 'US',
              'description': 'A test organization',
              'members': {
                'edges': [
                  {
                    'node': {
                      'name': 'John Doe',
                      'role': 'admin',
                    },
                  },
                  {
                    'node': {
                      'name': 'Jane Smith',
                      'role': 'member',
                    },
                  }
                ],
              },
            },
          }
        ],
      },
    },
  },
};

class SignUpMock extends StatelessWidget {
  const SignUpMock({required this.formKey, super.key});

  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(
        key: formKey,
        child: Container(),
      ),
      navigatorKey: navigationService.navigatorKey,
    );
  }
}

void main() {
  setUpAll(() {
    testSetupLocator();
    getAndRegisterNavigationService();
    getAndRegisterDatabaseMutationFunctions();
    getAndRegisterGraphQLClient();
    try {
      locator.unregister<UserConfig>();
    } catch (e) {
      // UserConfig registered, which is expected
    }
    locator.registerLazySingleton<UserConfig>(() => MockUserConfig());
  });
  group("Testing initialise()", () {
    testWidgets('Check if initialise() is working fine', (tester) async {
      final model = SignupDetailsViewModel();
      // Creating a test MaterialApp to provide a BuildContext
      await tester.pumpWidget(
        SignUpMock(
          formKey: GlobalKey<FormState>(),
        ),
      );

      await tester.runAsync(() async {
        model.initialise(
          OrgInfo(
            id: "1",
            name: "Test Org",
          ),
        );
      });
      await tester.pumpAndSettle();

      expect(model.greeting, isNotEmpty);
      expect(model.greeting, isNotNull);
    });
  });
  group('SignupDetailsViewModel Test -', () {
    late SignupDetailsViewModel model;

    setUp(() {
      model = SignupDetailsViewModel();
    });
    testWidgets('Check if signup() works fine and register user successfully',
        (tester) async {
      final org = OrgInfo(
        id: "xyz1",
        name: "Test Org",
      );
      final queryResult = QueryResult(
        options: QueryOptions(
          document: gql(
            queries.registerUser('', '', '', org.id),
          ),
        ),
        data: mockSignUpData,
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      ).thenAnswer((_) async => queryResult);

      await tester.runAsync(() async {
        await tester.pumpWidget(SignUpMock(formKey: model.formKey));
        model.initialise(org);
        await model.signUp();
      });

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      );

      verify(
        navigationService.removeAllAndPush(
          Routes.mainScreen,
          Routes.splashScreen,
          arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: true),
        ),
      ).called(1);
    });

    testWidgets('Check if signup() handling error when graphql mutation fails',
        (tester) async {
      final org = OrgInfo(
        id: "xyz1",
        name: "Test Org",
      );
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      ).thenThrow(
        Exception(
          'GraphQL mutation failed',
        ),
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(SignUpMock(formKey: model.formKey));
        model.initialise(org);
        await model.signUp();
      });

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      );

      verify(
        navigationService.showTalawaErrorSnackBar(
          'Something went wrong',
          MessageType.error,
        ),
      ).called(1);
    });
    testWidgets(
        'Check if signup() is working fine when user is not save and/or token not refreshed',
        (tester) async {
      final org = OrgInfo(
        id: "xyz2",
        name: "Test Org",
      );
      final modifiedSignUpData =
          jsonDecode(jsonEncode(mockSignUpData)) as Map<String, dynamic>;
      final signUpMap = modifiedSignUpData['signUp'] as Map<String, dynamic>;
      final userMap = signUpMap['user'] as Map<String, dynamic>;
      userMap['id'] = 'xyz2';
      final queryResult = QueryResult(
        options: QueryOptions(
          document: gql(
            queries.registerUser('', '', '', org.id),
          ),
        ),
        data: modifiedSignUpData,
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      ).thenAnswer((_) async => queryResult);

      await tester.runAsync(() async {
        await tester.pumpWidget(SignUpMock(formKey: model.formKey));
        model.initialise(org);
        await model.signUp();
      });

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      );
      await tester.pumpAndSettle(); // or pumpAndSettle() if needed
      verify(
        navigationService.showTalawaErrorSnackBar(
          TalawaErrors.userNotFound,
          MessageType.error,
        ),
      ).called(1);
      verifyNever(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        ),
      );
      verifyNever(
        navigationService.removeAllAndPush(
          Routes.mainScreen,
          Routes.splashScreen,
          arguments: isA<MainScreenArgs>()
              .having(
                (mainScreenArgs) => mainScreenArgs.mainScreenIndex,
                "main screen index",
                0,
              )
              .having(
                (mainScreenArgs) => mainScreenArgs.fromSignUp,
                "from sign up",
                true,
              ),
        ),
      );
    });

    testWidgets(
        'Check if signup() works fine when process of register user throws exception',
        (tester) async {
      final org = OrgInfo(
        id: "xyz1",
        name: "Test Org",
      );

      final queryResult = QueryResult(
        options: QueryOptions(
          document: gql(
            queries.registerUser('', '', '', org.id),
          ),
        ),
        data: null,
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      ).thenAnswer(
        (_) async => queryResult,
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(SignUpMock(formKey: model.formKey));
        model.initialise(org);
        await model.signUp();
      });

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      );
      verifyNever(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        ),
      );
      verifyNever(
        navigationService.removeAllAndPush(
          Routes.mainScreen,
          Routes.splashScreen,
          arguments: isA<MainScreenArgs>()
              .having(
                (mainScreenArgs) => mainScreenArgs.mainScreenIndex,
                "main screen index",
                0,
              )
              .having(
                (mainScreenArgs) => mainScreenArgs.fromSignUp,
                "from sign up",
                true,
              ),
        ),
      );
    });
  });

  group('Testing membershipRequests navigation', () {
    testWidgets(
        'Check if signup() navigates to waitingScreen when user has membershipRequests',
        (tester) async {
      // First, unregister the existing UserConfig and register our new mock
      try {
        locator.unregister<UserConfig>();
      } catch (e) {
        // Expected
      }
      locator.registerLazySingleton<UserConfig>(
        () => MockUserConfigWithMembershipRequests(),
      );

      final model = SignupDetailsViewModel();

      final org = OrgInfo(
        id: "xyz-membership",
        name: "Test Org",
      );

      // Create mock data for user with membership requests
      final mockSignUpDataWithMembershipRequests = {
        'signUp': {
          'authenticationToken': 'testtoken',
          'refreshToken': 'testtoken',
          'user': {
            'id': 'xyz-membership',
            'name': 'Test User',
            'avatarURL': 'https://example.com/avatar.png',
            'emailAddress': 'testuser@gmail.com',
            'organizationsWhereMember': {
              'edges': [], // No joined organizations
            },
            'organizationsMembershipRequestFromUser': {
              'edges': [
                {
                  'node': {
                    'organization': {
                      'id': 'org1',
                      'name': 'Pending Org 1',
                    },
                  },
                },
              ],
            },
          },
        },
      };

      final queryResult = QueryResult(
        options: QueryOptions(
          document: gql(
            queries.registerUser('', '', '', org.id),
          ),
        ),
        data: mockSignUpDataWithMembershipRequests,
        source: QueryResultSource.network,
      );

      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      ).thenAnswer((_) async => queryResult);

      await tester.runAsync(() async {
        await tester.pumpWidget(SignUpMock(formKey: model.formKey));
        model.initialise(org);
        await model.signUp();
      });

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', org.id),
        ),
      );

      // Verify navigation to waitingScreen
      verify(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
          arguments: '-1',
        ),
      ).called(1);

      // Clean up - restore original mock
      locator.unregister<UserConfig>();
      locator.registerLazySingleton<UserConfig>(() => MockUserConfig());
    });
  });

  group('Testing storingCredentialsInSecureStorage()', () {
    test('Should handle exception while storing email and password', () async {
      final model = SignupDetailsViewModel();

      String log = "";

      /// Always get exception as no plugin  is registered for storing credentials using secure storage
      await runZonedGuarded(
        () async {
          model.email.text = "test.user@example.com";
          model.password.text = "password123";
          await model.storingCredentialsInSecureStorage();
        },
        (error, stack) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains("Failed to save credentials:"));
          expect(stack, isNotNull);
        },
        zoneSpecification: ZoneSpecification(
          print: (self, parent, zone, line) {
            log = line;
          },
        ),
      );
      expect(
        log,
        contains("Failed to save credentials:"),
      );
    });
  });
  tearDownAll(() {
    locator.reset();
    unregisterServices();
  });
}

// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

bool empty = true;
bool userSaved = true;
bool userRegistrationRequired = false;

final data = {
  'signUp': {
    'user': {
      'id': 'xzy1',
      'name': 'Test User',
      'emailAddress': 'testuser@gmail.com',
    },
    'authenticationToken': 'testtoken',
    'refreshToken': 'testtoken',
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

OrgInfo get org => OrgInfo(
      id: 'id',
      name: 'test org 3',
      userRegistrationRequired: userRegistrationRequired,
    );

void main() {
  testSetupLocator();
  setUp(() async {
    registerServices();
    locator<Queries>();
    userSaved = true;
    empty = true;
    userRegistrationRequired = false;
    await locator.unregister<UserConfig>();
    locator.registerSingleton<UserConfig>(MockUserConfig());
    FlutterSecureStorage.setMockInitialValues(
      {"userEmail": "mocked_value", "userPassword": "mocked_value"},
    );
  });
  // tearDown(() async {
  //   await locator.unregister<Queries>();
  // });

  group('SignupDetailsViewModel Test -', () {
    testWidgets(
        'Check if signup() is working fine when credentials are invalid',
        (tester) async {
      final model = SignupDetailsViewModel();
      model.selectedOrganization = OrgInfo(id: "");
      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser("", "", "", "", ""),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(
              PostQueries().addLike(),
            ),
          ),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      await model.signUp();

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
        'Check if signup() is working fine when user is not save and/or token not refreshed',
        (tester) async {
      userSaved = false;

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(
          document: gql(queries.registerUser('', '', '', '', org.id)),
        ),
      );
      when(graphqlConfig.getToken()).thenAnswer((_) async => false);
      final query = queries.registerUser(
        '',
        '',
        '',
        '',
        org.id,
      );
      when(
        databaseFunctions.gqlAuthMutation(
          queries.sendMembershipRequest(org.id!),
        ),
      ).thenAnswer((realInvocation) async {
        final sendMemberReqData = {
          "sendMembershipRequest": {
            "organization": {
              "id": "org123",
              "name": "Tech Innovators",
              "userRegistrationRequired": true,
            },
          },
        };
        return QueryResult(
          source: QueryResultSource.network,
          data: sendMemberReqData,
          options: QueryOptions(document: gql(query)),
        );
      });
      when(databaseFunctions.gqlNonAuthMutation(query))
          .thenAnswer((_) async => result);

      // Test for user not saved and user token not refreshed
      await model.signUp();
      verifyNever(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        ),
      );

      // Test for user saved and user token not refreshed
      userSaved = true;
      await model.signUp();
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

      // Test for user not saved and user token refreshed
      userSaved = false;
      when(graphqlConfig.getToken()).thenAnswer((_) async => true);
      await model.signUp();
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
      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      when(graphqlConfig.getToken()).thenAnswer((_) async => true);
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', '', org.id),
        ),
      ).thenThrow(Exception());

      await model.signUp();

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', '', org.id),
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
    test('Should handle exception while storing data', () async {
      final model = SignupDetailsViewModel();
      FlutterSecureStorage.setMockInitialValues(
        {"userEmail": "test@example.com", "userPassword": "password123"},
      );
      final mockSecureStorage = MockFlutterSecureStorage();
      model.secureStorage = mockSecureStorage;

      String log = "";

      await runZonedGuarded(
        () async {
          await model.storingCredentialsInSecureStorage();
        },
        (error, stack) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains("Storing error"));
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
        contains("Storing error"),
      );
    });
  });
}

class MockUserConfig extends Mock implements UserConfig {
  @override
  User get currentUser => User(
        joinedOrganizations: empty ? [] : [org],
      );

  @override
  Future<dynamic> updateUserJoinedOrg(List<OrgInfo> orgs) {
    return Future.value(2);
  }

  @override
  dynamic saveCurrentOrgInHive(OrgInfo org) {
    return null;
  }

  @override
  Future<bool> updateUser(User user) async => userSaved;

  @override
  Future<dynamic> updateUserMemberRequestOrg(List<OrgInfo> orgs) async => null;
}

/// Mock Class for Flutter Secure Storage for error detection.
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {
  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) {
    if (key == "userEmail" || key == "userPassword") {
      throw Exception("Storing error");
    }
    return Future.value(null);
  }

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) {
    if (key == "userEmail" || key == "userPassword") {
      throw Exception("Unable to read");
    }
    return Future.value(null);
  }
}

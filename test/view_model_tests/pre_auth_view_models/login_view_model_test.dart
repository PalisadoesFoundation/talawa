// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
// import 'package:talawa/locator.dart';
// import 'package:talawa/constants/routing_constants.dart';
// import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';
// import 'package:talawa/utils/queries.dart';
// import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';

// import '../../helpers/test_helpers.dart';

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

final data = {
  'signIn': {
    'user': {
      'id': 'xzy1',
      'name': 'Test User',
      'emailAddress': 'testuser@gmail.com',
    },
    'authenticationToken': 'testtoken',
    'refreshToken': 'testtoken',
  },
};

bool empty = false;

Future<void> main() async {
  // setupFirebaseMocks();
  // await Firebase.initializeApp();
  // FirebaseMessagingPlatform.instance = kMockMessagingPlatform;

  testSetupLocator();
  registerServices();
  FlutterSecureStorage.setMockInitialValues(
    {"userEmail": "mocked_value", "userPassword": "mocked_value"},
  );

  group('LoginViewModel Test -', () {
    testWidgets(
        'Check if login() is working fine when organisation is not empty',
        (tester) async {
      getAndRegisterUserConfig();

      final model = LoginViewModel();

      await tester.pumpWidget(
        Form(
          key: model.formKey,
          child: Container(),
        ),
      );

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(document: gql(queries.loginUser('', ''))),
      );

      when(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')))
          .thenAnswer((_) async => result);

      await tester.runAsync(() async {
        await model.login();
      });
      await tester.pumpAndSettle();
      expect(model.validate, AutovalidateMode.disabled);
      verify(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')));
    });
    testWidgets('Check if login() is working fine when organisation empty',
        (tester) async {
      empty = true;
      getAndRegisterUserConfig();

      final model = LoginViewModel();

      await tester.pumpWidget(
        Form(
          key: model.formKey,
          child: Container(),
        ),
      );

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(document: gql(queries.loginUser('', ''))),
      );

      when(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')))
          .thenAnswer((_) async => result);
      await tester.runAsync(() async {
        await model.login();
      });
      await tester.pumpAndSettle();
      expect(model.validate, AutovalidateMode.disabled);
      verify(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')));
    });
    testWidgets('Check if login() is working fine when invalid credentials',
        (tester) async {
      reset(navigationService);
      final model = LoginViewModel();

      await tester.pumpWidget(
        Form(
          key: model.formKey,
          child: Container(),
        ),
      );

      when(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')))
          .thenAnswer(
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

      await tester.runAsync(() async {
        await model.login();
      });
      await tester.pumpAndSettle();
      expect(model.validate, AutovalidateMode.disabled);
      verify(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')));
      verifyNever(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        ),
      );
    });
    testWidgets('Check if login() is working fine when throws error',
        (tester) async {
      final model = LoginViewModel();

      await tester.pumpWidget(
        Form(
          key: model.formKey,
          child: Container(),
        ),
      );

      when(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')))
          .thenThrow(Exception());

      await tester.runAsync(() async {
        await model.login();
      });
      await tester.pumpAndSettle();
      expect(model.validate, AutovalidateMode.disabled);
      verify(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')));
    });

    test("Check if prev user is fetched correctly with success", () async {
      final model = LoginViewModel();
      FlutterSecureStorage.setMockInitialValues(
        {"userEmail": "test@example.com", "userPassword": "password123"},
      );
      await model.fetchPrevUser();

      expect(model.prevUserEmail, "test@example.com");
      expect(model.prevUserPassword, "password123");
    });

    test("Check if fetching previous user result in error", () async {
      final model = LoginViewModel();
      FlutterSecureStorage.setMockInitialValues(
        {"userEmail": "test@example.com", "userPassword": "password123"},
      );
      final mockSecureStorage = MockFlutterSecureStorage();
      model.secureStorage = mockSecureStorage;

      String log = "";

      await runZonedGuarded(
        () async {
          await model.fetchPrevUser();
        },
        (error, stack) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains("Unable to read"));
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
        contains("Unable to read"),
      );
    });
    test('Should handle exception while storing data', () async {
      final model = LoginViewModel();
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
        joinedOrganizations: empty
            ? []
            : [
                OrgInfo(
                  id: '3',
                  name: 'test org 3',
                  userRegistrationRequired: false,
                ),
              ],
      );

  @override
  Future<bool> updateUser(User user) async => true;
}

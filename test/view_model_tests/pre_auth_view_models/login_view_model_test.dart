// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

// import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

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
import 'package:talawa/services/secure_storage_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';

import '../../helpers/fake_secure_storage_service.dart';
import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';
// import 'package:talawa/utils/queries.dart';
// import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';

// import '../../helpers/test_helpers.dart';

/// Mock Class for SecureStorageService for error detection.
class ThrowingSecureStorageService extends FakeSecureStorageService {
  @override
  Future<String?> readToken(String key) {
    return Future.error(Exception("Unable to read"));
  }

  @override
  Future<void> writeToken(String key, String value) {
    return Future.error(Exception("Storing error"));
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
  TestWidgetsFlutterBinding.ensureInitialized();
  // setupFirebaseMocks();
  // await Firebase.initializeApp();
  // FirebaseMessagingPlatform.instance = kMockMessagingPlatform;

  testSetupLocator();
  registerServices();

  await locator<SecureStorageService>().writeToken("userEmail", "mocked_value");
  await locator<SecureStorageService>()
      .writeToken("userPassword", "mocked_value");

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
      await locator<SecureStorageService>()
          .writeToken("userEmail", "test@example.com");
      await locator<SecureStorageService>()
          .writeToken("userPassword", "password123");
      final model = LoginViewModel();
      await model.fetchPrevUser();

      expect(model.prevUserEmail, "test@example.com");
      expect(model.prevUserPassword, "password123");
    });

    test("Check if fetching previous user result in error", () async {
      final throwingStorage = ThrowingSecureStorageService();
      locator.registerSingleton<SecureStorageService>(throwingStorage);
      addTearDown(() {
        locator.registerSingleton<SecureStorageService>(
            FakeSecureStorageService());
      });

      final model = LoginViewModel();
      // model.secureStorage = mockSecureStorage; // Removed assignment

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
      final throwingStorage = ThrowingSecureStorageService();
      locator.registerSingleton<SecureStorageService>(throwingStorage);
      addTearDown(() {
        locator.registerSingleton<SecureStorageService>(
            FakeSecureStorageService());
      });

      final model = LoginViewModel();
      // model.secureStorage = mockSecureStorage; // Removed assignment

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

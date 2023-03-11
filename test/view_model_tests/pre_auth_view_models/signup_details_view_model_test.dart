// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';

import '../../helpers/test_helpers.dart';

bool empty = true;
bool userSaved = true;
bool isPublic = true;
final data = {
  'signUp': {
    'user': {
      '_id': 'xzy1',
      'firstName': 'Test',
      'lastName': 'User',
      'email': 'testuser@gmail.com',
    },
    'accessToken': 'testtoken',
    'refreshToken': 'testtoken',
  },
};

class SignUpMock extends StatelessWidget {
  const SignUpMock({required this.formKey, Key? key}) : super(key: key);

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
      id: '3',
      name: 'test org 3',
      isPublic: isPublic,
      creatorInfo: User(firstName: 'test', lastName: '1'),
    );

void main() {
  setUp(() async {
    locator.registerSingleton(Queries());
    registerServices();
    await locator.unregister<UserConfig>();
    userSaved = true;
    empty = true;
    isPublic = true;
  });
  tearDown(() async {
    await locator.unregister<Queries>();
  });

  group('SignupDetailsViewModel Test -', () {
    testWidgets(
        'Check if signup() is working fine when selected organization is not empty and public',
        (tester) async {
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(
          document: gql(queries.registerUser('', '', '', '')),
        ),
      );
      when(graphqlConfig.getToken()).thenAnswer((_) async => true);
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      ).thenAnswer((_) async => result);
      when(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)))
          .thenAnswer((realInvocation) async {
        final data = {
          'joinPublicOrganization': {
            'joinedOrganizations': [],
          },
        };

        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(document: gql(queries.joinOrgById(org.id!))),
        );
      });
      empty = false;

      await model.signUp();

      expect(model.validate, AutovalidateMode.disabled);

      verify(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)));
      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      );
      verify(
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
        'Check if signup() is working fine when credentials are invalid',
        (tester) async {
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      ).thenAnswer((_) async => null);

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
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(
          document: gql(queries.registerUser('', '', '', '')),
        ),
      );
      when(graphqlConfig.getToken()).thenAnswer((_) async => false);
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      ).thenAnswer((_) async => result);

      // Test for user not saved and user token not refreshed
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
        'Check if signup() is working fine when selected organization is not public',
        (tester) async {
      isPublic = false;
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(
          document: gql(queries.registerUser('', '', '', '')),
        ),
      );
      when(graphqlConfig.getToken()).thenAnswer((_) async => true);
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      ).thenAnswer((_) async => result);
      when(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      ).thenAnswer((realInvocation) async {
        final data = {
          'sendMembershipRequest': {
            'organization': <String, dynamic>{},
          },
        };

        return QueryResult(
          source: QueryResultSource.network,
          data: data,
          options: QueryOptions(
            document: gql(queries.sendMembershipRequest(org.id!)),
          ),
        );
      });
      empty = false;

      await model.signUp();

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      );
      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      );
      verify(
        navigationService.removeAllAndPush(
          Routes.waitingScreen,
          Routes.splashScreen,
        ),
      );
    });
    testWidgets(
        'Check if signup() works fine when process of register user throws exception',
        (tester) async {
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      when(graphqlConfig.getToken()).thenAnswer((_) async => true);
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      ).thenThrow(Exception());

      await model.signUp();

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
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
    testWidgets(
        'Check if signup() works fine when process of user joining org throws exception',
        (tester) async {
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(
          document: gql(queries.registerUser('', '', '', '')),
        ),
      );
      when(graphqlConfig.getToken()).thenAnswer((_) async => true);
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      ).thenAnswer((_) async => result);
      when(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)))
          .thenThrow(Exception());

      await model.signUp();

      expect(model.validate, AutovalidateMode.disabled);

      verify(databaseFunctions.gqlAuthMutation(queries.joinOrgById(org.id!)));
      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
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
    testWidgets(
        'Check if signup() is working fine when process of send membership request throws exception',
        (tester) async {
      isPublic = false;
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = SignupDetailsViewModel();

      await tester.pumpWidget(SignUpMock(formKey: model.formKey));

      model.initialise(org);

      final result = QueryResult(
        source: QueryResultSource.network,
        data: data,
        options: QueryOptions(
          document: gql(queries.registerUser('', '', '', '')),
        ),
      );
      when(graphqlConfig.getToken()).thenAnswer((_) async => true);
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
        ),
      ).thenAnswer((_) async => result);
      when(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      ).thenThrow(Exception());
      empty = false;

      await model.signUp();

      expect(model.validate, AutovalidateMode.disabled);

      verify(
        databaseFunctions
            .gqlAuthMutation(queries.sendMembershipRequest(org.id!)),
      );
      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', ''),
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

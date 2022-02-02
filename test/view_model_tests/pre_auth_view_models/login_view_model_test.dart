import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/login_view_model.dart';

import '../../helpers/test_helpers.dart';

final data = {
  'login': {
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

bool empty = false;

void main() {
  setUp(() async {
    locator.registerSingleton(Queries());
    registerServices();
    await locator.unregister<UserConfig>();
  });
  tearDown(() async {
    await locator.unregister<Queries>();
  });

  group('LoginViewModel Test -', () {
    testWidgets(
        'Check if login() is working fine when organisation is not empty',
        (tester) async {
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = LoginViewModel();

      await tester.pumpWidget(
        Form(
          key: model.formKey,
          child: Container(),
        ),
      );

      final result = QueryResult(source: null, data: data);

      when(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')))
          .thenAnswer((_) async => result);

      await model.login();

      expect(model.validate, AutovalidateMode.disabled);

      verify(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')));
    });
    testWidgets('Check if login() is working fine when organisation empty',
        (tester) async {
      empty = true;
      locator.registerSingleton<UserConfig>(MockUserConfig());

      final model = LoginViewModel();

      await tester.pumpWidget(
        Form(
          key: model.formKey,
          child: Container(),
        ),
      );

      final result = QueryResult(source: null, data: data);

      when(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')))
          .thenAnswer((_) async => result);

      await model.login();

      expect(model.validate, AutovalidateMode.disabled);

      verify(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')));
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

      await model.login();

      expect(model.validate, AutovalidateMode.disabled);

      verify(databaseFunctions.gqlNonAuthMutation(queries.loginUser('', '')));
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
                  isPublic: true,
                  creatorInfo: User(firstName: 'test', lastName: '1'),
                ),
              ],
      );

  @override
  Future<bool> updateUser(User user) async => true;
}

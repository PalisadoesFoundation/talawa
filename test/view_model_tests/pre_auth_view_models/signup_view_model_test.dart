import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/pre_auth_view_models/signup_details_view_model.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';
import 'signup_details_view_model_test.dart';

OrgInfo get org => OrgInfo(
      id: 'organization-id',
      name: 'test org 3',
    );
void main() {
  group('SignupDetailsViewModel Navigation Tests -', () {
    setUp(() async {
      registerServices();
      getAndRegisterGraphqlConfig();
    });
    setUpAll(() async {
      testSetupLocator();
    });
    testWidgets(
        'Should navigate to main screen when userSaved and tokenRefreshed are true',
        (tester) async {
      final model = SignupDetailsViewModel();
      final mockUserConfig = getAndRegisterUserConfig();
      await tester.pumpWidget(SignUpMock(formKey: model.formKey));
      model.initialise(org);
      final queries = Queries();
      final result = QueryResult(
        source: QueryResultSource.network,
        data: {
          'signUp': {
            'authenticationToken': 'test-authentication-token',
            'user': {
              'id': 'user-id',
              'name': 'Test User',
              'avatarURL': null,
              'emailAddress': 'testuser@gmail.com',
              'organizationsWhereMember': {
                'edges': [
                  {
                    'node': {
                      'id': 'organization-id',
                      'name': 'test org 3',
                      'addressLine1': '123 Test Street',
                      'addressLine2': 'Suite 789',
                      'avatarMimeType': null,
                      'avatarURL': null,
                      'postalCode': '10001',
                      'countryCode': 'us',
                      'description':
                          'An organization created for testing purposes.',
                    },
                  },
                ],
              },
            },
          },
        },
        options: QueryOptions(
          document: gql(queries.registerUser('', '', '', '', org.id!)),
        ),
      );
      when(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', '', org.id!),
        ),
      ).thenAnswer((_) async => result);
      when(
        mockUserConfig.updateUser(
          User.fromJson(
            result.data!['signUp'] as Map<String, dynamic>,
            fromOrg: true,
          ),
        ),
      ).thenAnswer((_) async => true);
      print(
        await mockUserConfig.updateUser(
          User.fromJson(
            result.data!['signUp'] as Map<String, dynamic>,
            fromOrg: true,
          ),
        ),
      );

      when(graphqlConfig.getToken()).thenAnswer((_) async => true);

      await tester.runAsync(() async {
        model.signUp();
      });

      expect(mockUserConfig.currentUser.firstName, 'Test');
      expect(mockUserConfig.currentUser.lastName, 'User');
      expect(mockUserConfig.currentUser.email, 'testuser@gmail.com');
      expect(
        mockUserConfig.currentUser.joinedOrganizations?[0].name,
        'test org 3',
      );
      verify(
        databaseFunctions.gqlNonAuthMutation(
          queries.registerUser('', '', '', '', org.id!),
        ),
      ).called(1);
      verify(graphqlConfig.getToken()).called(1);
    });
  });
}

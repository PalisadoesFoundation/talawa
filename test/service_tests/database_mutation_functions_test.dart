import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

/// Tests database_mutations_functions.dart.
///
/// more_info_if_required
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() async {
  late DataBaseMutationFunctions functionsClass;

  const userNotAuthenticated =
      GraphQLError(message: 'User is not authenticated');

  const userNotAuthenticatedrand =
      GraphQLError(message: 'User is not authenticatedrand');
  const userNotFound = GraphQLError(message: 'User not found');
  const refreshAccessTokenExpiredException = GraphQLError(
    message:
        'Access Token has expired. Please refresh session.: Undefined location',
  );

  final testOrg = OrgInfo.fromJson({
    'image': 'sampleimg',
    'id': 'XYZ',
    'name': 'Sample1',
    'userRegistrationRequired': false,
    'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
  });

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    registerServices();
    functionsClass = DataBaseMutationFunctions();
    functionsClass.init();
    functionsClass.initClientNonAuth();
    AppConnectivity.isOnline = true;
  });

  group('Database Mutation Functions Tests', () {
    testWidgets('Widget Testing 1', (tester) async {
      final String query = Queries().fetchOrgById('XYZ');

      when(locator<GraphQLClient>().query(QueryOptions(document: gql(query))))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: OperationException(
            graphqlErrors: [userNotAuthenticated],
            linkException: UnknownException(
              userNotAuthenticated,
              StackTrace.current,
            ),
          ),
          source: QueryResultSource.network,
        ),
      );

      await functionsClass.gqlNonAuthQuery(query);

      tester.binding.addPostFrameCallback((_) {
        navigationService.showTalawaErrorSnackBar(
          "Server not running/wrong url",
          MessageType.error,
        );
      });

      await tester.pump();
    });

    testWidgets('Widget Testing 2', (tester) async {
      final String query = Queries().fetchOrgById('XYZ');

      when(locator<GraphQLClient>().query(QueryOptions(document: gql(query))))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: OperationException(
            graphqlErrors: [userNotAuthenticatedrand],
          ),
          source: QueryResultSource.network,
        ),
      );

      await functionsClass.gqlNonAuthQuery(query);

      tester.binding.addPostFrameCallback((_) {
        navigationService.showTalawaErrorSnackBar(
          "Something went wrong!",
          MessageType.error,
        );
      });

      await tester.pump();
    });

    test('Testing gqlAuthQuery function without exception', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(
        locator<GraphQLClient>().query(
          QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
          data: {
            'organizations': [
              {
                'id': 'XYZ',
                'image': 'sampleimg',
                'name': 'Sample1',
                'userRegistrationRequired': false,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthQuery(query);
      final org = OrgInfo.fromJson(
        (res.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.userRegistrationRequired, testOrg.userRegistrationRequired);
    });

    test('Testing gqlAuthQuery with false exception', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(
        locator<GraphQLClient>().query(
          QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
          exception: OperationException(graphqlErrors: [userNotFound]),
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthQuery(query);
      expect(res.data, null);
    });

    test('Testing gqlAuthQuery with true exception', () async {
      final String query = Queries().fetchOrgById('XYZ');
      final String query2 = Queries().refreshToken('abc');
      final String query3 = Queries().refreshToken('xyz');

      userConfig.currentUser.refreshToken = 'abc';

      /// Returns the exception to be thrown in case of refresh token expired
      ///
      /// more_info_if_required
      ///
      /// **params**:
      ///   None
      ///
      /// **returns**:
      /// * `Map<String, OperationException>`: Map of exception to be thrown
      Map<String, OperationException> exp2() {
        if (userConfig.currentUser.refreshToken == 'abc') {
          userConfig.currentUser.refreshToken = 'xyz';
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotAuthenticated],
            ),
          });
        } else {
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotFound],
            ),
          });
        }
      }

      when(
        locator<GraphQLClient>().query(
          QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
          exception: exp2()['val'],
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(
            document: gql(query2),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query2),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(
            document: gql(query3),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(
            document: gql(query3),
            fetchPolicy: FetchPolicy.networkOnly,
          ),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthQuery(query);
      expect(res.data, null);
    });

    test('Test for gql auth mutation', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'organizations': [
              {
                'id': 'XYZ',
                'image': 'sampleimg',
                'name': 'Sample1',
                'userRegistrationRequired': false,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthMutation(query);
      final org = OrgInfo.fromJson(
        (res.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.userRegistrationRequired, testOrg.userRegistrationRequired);
    });

    test('Test for gql auth mutation with false exception', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: OperationException(graphqlErrors: [userNotFound]),
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthMutation(query);
      expect(res.data, null);
    });

    test('Test for gql auth mutation with true exception', () async {
      final String query = Queries().fetchOrgById('XYZ');
      final String query2 = Queries().refreshToken('abc');
      final String query3 = Queries().refreshToken('xyz');

      userConfig.currentUser.refreshToken = 'abc';

      /// Returns the exception to be thrown in case of refresh token expired
      ///
      /// more_info_if_required
      ///
      /// **params**:
      ///   None
      ///
      /// **returns**:
      /// * `Map<String, OperationException>`: Map of exception to be thrown
      Map<String, OperationException> exp2() {
        if (userConfig.currentUser.refreshToken == 'abc') {
          userConfig.currentUser.refreshToken = 'xyz';
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotAuthenticated],
            ),
          });
        } else {
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotFound],
            ),
          });
        }
      }

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query)),
          exception: exp2()['val'],
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query2))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query2)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query3))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query3)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthMutation(query);
      expect(res.data, null);
    });

    test('Test for gql non auth query', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(locator<GraphQLClient>().query(QueryOptions(document: gql(query))))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'organizations': [
              {
                'id': 'XYZ',
                'image': 'sampleimg',
                'name': 'Sample1',
                'userRegistrationRequired': false,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthQuery(query);
      final org = OrgInfo.fromJson(
        (res.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.userRegistrationRequired, testOrg.userRegistrationRequired);
    });

    test('Test for gql non auth mutation', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'organizations': [
              {
                'id': 'XYZ',
                'image': 'sampleimg',
                'name': 'Sample1',
                'userRegistrationRequired': false,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthMutation(query);
      final org = OrgInfo.fromJson(
        (res.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.userRegistrationRequired, testOrg.userRegistrationRequired);
    });

    test('Test for gql non auth mutation with false exception', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: OperationException(graphqlErrors: [userNotFound]),
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthMutation(query);
      expect(res.data, null);
    });

    test('Test for gql non auth mutation with true exception', () async {
      final String query = Queries().fetchOrgById('XYZ');
      final String query2 = Queries().refreshToken('abc');
      final String query3 = Queries().refreshToken('xyz');

      userConfig.currentUser.refreshToken = 'abc';

      /// Returns the exception to be thrown in case of refresh token expired
      ///
      /// more_info_if_required
      ///
      /// **params**:
      ///   None
      ///
      /// **returns**:
      /// * `Map<String, OperationException>`: Map of exception to be thrown
      Map<String, OperationException> exp2() {
        if (userConfig.currentUser.refreshToken == 'abc') {
          userConfig.currentUser.refreshToken = 'xyz';
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotAuthenticated],
            ),
          });
        } else {
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotFound],
            ),
          });
        }
      }

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query)),
          exception: exp2()['val'],
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query2))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query2)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query3))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query3)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthMutation(query);
      expect(res.data, null);
    });

    test('Test for refresh access token', () async {
      final String query = Queries().refreshToken('reftok123');

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'refreshToken': {
              'accessToken': 'acctok123',
              'refreshToken': 'reftok123',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.refreshAccessToken('reftok123');
      verify(
        userConfig.updateAccessToken(
          accessToken: 'acctok123',
          refreshToken: 'reftok123',
        ),
      );
      verify(databaseFunctions.init());
      expect(res, true);
    });

    test('Test for refresh access token with false exception', () async {
      final String query = Queries().refreshToken('reftok123');

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: OperationException(graphqlErrors: [userNotFound]),
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.refreshAccessToken('reftok123');
      verify(navigationService.pop());
      expect(res, false);
    });

    test('Test for refresh access token with true exception', () async {
      final String query = Queries().refreshToken('x');
      final String query2 = Queries().refreshToken('abc');
      final String query3 = Queries().refreshToken('xyz');

      userConfig.currentUser.refreshToken = 'abc';

      /// Returns the exception to be thrown in case of refresh token expired
      ///
      /// more_info_if_required
      ///
      /// **params**:
      ///   None
      ///
      /// **returns**:
      /// * `Map<String, OperationException>`: Map of exception to be thrown
      Map<String, OperationException> exp2() {
        if (userConfig.currentUser.refreshToken == 'abc') {
          userConfig.currentUser.refreshToken = 'xyz';
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotAuthenticated],
            ),
          });
        } else {
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotFound],
            ),
          });
        }
      }

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query)),
          exception: exp2()['val'],
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query2))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query2)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query3))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: MutationOptions(document: gql(query3)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.refreshAccessToken('x');
      expect(res, false);
    });

    test('Test for gql non auth query with link exception', () async {
      final String query = Queries().fetchOrgById('XYZ');

      when(locator<GraphQLClient>().query(QueryOptions(document: gql(query))))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: OperationException(
            graphqlErrors: [userNotFound],
            linkException: UnknownException(
              userNotFound,
              StackTrace.current,
            ),
          ),
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthQuery(query);
      expect(res.data, null);
    });

    test('Test for gql non auth query with true exception', () async {
      final String query = Queries().fetchOrgById('XYZ');
      final String query2 = Queries().refreshToken('abc');
      final String query3 = Queries().refreshToken('xyz');

      userConfig.currentUser.refreshToken = 'abc';

      /// Returns the exception to be thrown in case of refresh token expired
      ///
      /// more_info_if_required
      ///
      /// **params**:
      ///   None
      ///
      /// **returns**:
      /// * `Map<String, OperationException>`: Map of exception to be thrown
      Map<String, OperationException> exp2() {
        if (userConfig.currentUser.refreshToken == 'abc') {
          userConfig.currentUser.refreshToken = 'xyz';
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [refreshAccessTokenExpiredException],
            ),
          });
        } else {
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotFound],
            ),
          });
        }
      }

      when(locator<GraphQLClient>().query(QueryOptions(document: gql(query))))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: exp2()['val'],
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query2))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query2)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query3))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query3)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthQuery(query);
      expect(res.data, null);
    });
    test('Test for gql non auth query with false exception', () async {
      final String query = Queries().fetchOrgById('XYZ');
      final String query2 = Queries().refreshToken('abc');
      final String query3 = Queries().refreshToken('xyz');

      userConfig.currentUser.refreshToken = 'abc';

      /// Returns the exception to be thrown in case of refresh token expired
      ///
      /// more_info_if_required
      ///
      /// **params**:
      ///   None
      ///
      /// **returns**:
      /// * `Map<String, OperationException>`: Map of exception to be thrown
      Map<String, OperationException> exp2() {
        if (userConfig.currentUser.refreshToken == 'abc') {
          userConfig.currentUser.refreshToken = 'xyz';
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotAuthenticated],
            ),
          });
        } else {
          return Map<String, OperationException>.from({
            'val': OperationException(
              graphqlErrors: [userNotFound],
            ),
          });
        }
      }

      when(locator<GraphQLClient>().query(QueryOptions(document: gql(query))))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: exp2()['val'],
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query2))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query2)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      when(
        locator<GraphQLClient>().mutate(MutationOptions(document: gql(query3))),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query3)),
          data: {
            'refreshToken': {
              'accessToken': 'testtoken',
              'refreshToken': 'testtoken',
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthQuery(query);
      expect(res.data, null);
    });
  });
}

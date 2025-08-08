import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/utils/chat_queries.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
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
void main() {
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

  const wrongCredentials = GraphQLError(message: 'Invalid credentials');

  const organizationNotFound = GraphQLError(message: 'Organization not found');

  const memberRequestExist =
      GraphQLError(message: 'Membership Request already exists');

  const notifFeatureNotInstalled = GraphQLError(
    message:
        'Failed to determine project ID: Error while making request: getaddrinfo ENOTFOUND metadata.google.internal. Error code: ENOTFOUND',
  );

  const emailAccountPresent =
      GraphQLError(message: 'Email address already exists');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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

    test('fetchOrgById test in case of successful results', () async {
      when(locator<GraphqlConfig>().clientToQuery()).thenAnswer(
        (_) => locator<GraphQLClient>(),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(
            document: gql(queries.fetchOrgById('XYZ')),
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(queries.fetchOrgById('XYZ'))),
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

      final org = await functionsClass.fetchOrgById('XYZ') as OrgInfo;

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.userRegistrationRequired, testOrg.userRegistrationRequired);
    });

    test('fetchOrgById test in case of exception', () async {
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
        locator<GraphQLClient>().mutate(
          MutationOptions(document: gql(query)),
        ),
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

      final res = await functionsClass.fetchOrgById('XYZ');
      expect(res, false);
    });

    test('Testing wrong credential error', () async {
      when(locator<GraphqlConfig>().clientToQuery()).thenAnswer(
        (_) => locator<GraphQLClient>(),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(
            document: gql(
              queries.fetchOrgById('XYZ'),
            ),
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(queries.fetchOrgById('XYZ'))),
          exception: OperationException(graphqlErrors: [wrongCredentials]),
          source: QueryResultSource.network,
        ),
      );

      final org = await functionsClass.fetchOrgById('XYZ');
      expect(org, false);
    });

    test('Testing organization not found error', () async {
      when(locator<GraphqlConfig>().clientToQuery()).thenAnswer(
        (_) => locator<GraphQLClient>(),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(
            document: gql(
              queries.fetchOrgById('XYZ'),
            ),
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(queries.fetchOrgById('XYZ'))),
          exception: OperationException(graphqlErrors: [organizationNotFound]),
          source: QueryResultSource.network,
        ),
      );

      final org = await functionsClass.fetchOrgById('XYZ');
      expect(org, false);
    });

    test('Testing memberRequestExist error', () async {
      when(locator<GraphqlConfig>().clientToQuery()).thenAnswer(
        (_) => locator<GraphQLClient>(),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(
            document: gql(queries.fetchOrgById('XYZ')),
          ),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(queries.fetchOrgById('XYZ'))),
          exception: OperationException(graphqlErrors: [memberRequestExist]),
          source: QueryResultSource.network,
        ),
      );

      final org = await functionsClass.fetchOrgById('XYZ');
      expect(org, false);
    });

    test('Testing emailAccountPresent error', () async {
      when(locator<GraphqlConfig>().clientToQuery()).thenAnswer(
        (_) => locator<GraphQLClient>(),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(document: gql(queries.fetchOrgById('XYZ'))),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(queries.fetchOrgById('XYZ'))),
          exception: OperationException(
            graphqlErrors: [emailAccountPresent],
          ),
          source: QueryResultSource.network,
        ),
      );

      final org = await functionsClass.fetchOrgById('XYZ');
      expect(org, false);
    });

    test('Testing notifFeatureNotInstalled error', () async {
      when(locator<GraphqlConfig>().clientToQuery()).thenAnswer(
        (_) => locator<GraphQLClient>(),
      );

      when(
        locator<GraphQLClient>().mutate(
          MutationOptions(document: gql(queries.fetchOrgById('XYZ'))),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(queries.fetchOrgById('XYZ'))),
          exception: OperationException(
            graphqlErrors: [notifFeatureNotInstalled],
          ),
          source: QueryResultSource.network,
        ),
      );

      final org = await functionsClass.fetchOrgById('XYZ');
      expect(org, false);
    });

    test('Testing gqlAuthQuery function without exception', () async {
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');
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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');
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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');
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
      final String query = Queries().fetchOrgDetailsById('XYZ');

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
      final String query = Queries().fetchOrgDetailsById('XYZ');
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
      final String query = Queries().fetchOrgDetailsById('XYZ');
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

    group('gqlAuthSubscription Tests', () {
      const String testSubscription = '''
        subscription chatMessageCreate(\$input: SubscriptionChatMessageCreateInput!) {
          chatMessageCreate(input: \$input) {
            id
            body
            creator {
              id
              name
            }
            createdAt
          }
        }
      ''';

      test('Test without exception', () async {
        final mockStream = Stream.fromIterable([
          QueryResult(
            options: SubscriptionOptions(document: gql(testSubscription)),
            data: {
              'chatMessageCreate': {
                'id': 'msg123',
                'body': 'Hello world',
                'creator': {
                  'id': 'user1',
                  'name': 'John Doe',
                },
                'createdAt': '2023-01-01T00:00:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        ]);

        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(document: gql(testSubscription)),
          ),
        ).thenAnswer((_) => mockStream);

        final resultStream =
            functionsClass.gqlAuthSubscription(testSubscription);
        final results = await resultStream.toList();

        expect(results.length, 1);
        expect(results[0].data, isNotNull);
        final messageData =
            results[0].data!['chatMessageCreate'] as Map<String, dynamic>;
        expect(messageData['id'], 'msg123');
      });

      test('Test with variables', () async {
        final variables = {
          'input': {'chatId': 'chat123'},
        };
        final mockStream = Stream.fromIterable([
          QueryResult(
            options: SubscriptionOptions(
              document: gql(testSubscription),
              variables: variables,
            ),
            data: {
              'chatMessageCreate': {
                'id': 'msg456',
                'body': 'Message with variables',
                'creator': {
                  'id': 'user2',
                  'name': 'Jane Smith',
                },
                'createdAt': '2023-01-01T00:01:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        ]);

        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(
              document: gql(testSubscription),
              variables: variables,
            ),
          ),
        ).thenAnswer((_) => mockStream);

        final resultStream = functionsClass.gqlAuthSubscription(
          testSubscription,
          variables: variables,
        );
        final results = await resultStream.toList();

        expect(results.length, 1);
        final messageData =
            results[0].data!['chatMessageCreate'] as Map<String, dynamic>;
        expect(messageData['id'], 'msg456');
      });

      test('Test with exception that should continue', () async {
        final String query2 = Queries().refreshToken('abc');

        userConfig.currentUser.refreshToken = 'abc';

        final mockStream = Stream.fromIterable([
          QueryResult(
            options: SubscriptionOptions(document: gql(testSubscription)),
            exception: OperationException(
              graphqlErrors: [userNotAuthenticated],
            ),
            source: QueryResultSource.network,
          ),
          QueryResult(
            options: SubscriptionOptions(document: gql(testSubscription)),
            data: {
              'chatMessageCreate': {
                'id': 'msg789',
                'body': 'Message after token refresh',
                'creator': {
                  'id': 'user3',
                  'name': 'Alice Brown',
                },
                'createdAt': '2023-01-01T00:02:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        ]);

        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(document: gql(testSubscription)),
          ),
        ).thenAnswer((_) => mockStream);

        when(
          locator<GraphQLClient>()
              .mutate(MutationOptions(document: gql(query2))),
        ).thenAnswer(
          (_) async => QueryResult(
            options: MutationOptions(document: gql(query2)),
            data: {
              'refreshToken': {
                'accessToken': 'newtoken',
                'refreshToken': 'newrefreshtoken',
              },
            },
            source: QueryResultSource.network,
          ),
        );

        final resultStream =
            functionsClass.gqlAuthSubscription(testSubscription);
        final results = await resultStream.toList();

        // Should only yield the successful result after continuing from exception
        expect(results.length, 1);
        final messageData =
            results[0].data!['chatMessageCreate'] as Map<String, dynamic>;
        expect(messageData['id'], 'msg789');
      });

      test('Test with exception that should not continue', () async {
        final mockStream = Stream.fromIterable([
          QueryResult(
            options: SubscriptionOptions(document: gql(testSubscription)),
            exception: OperationException(
              graphqlErrors: [userNotFound],
            ),
            source: QueryResultSource.network,
          ),
        ]);

        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(document: gql(testSubscription)),
          ),
        ).thenAnswer((_) => mockStream);

        final resultStream =
            functionsClass.gqlAuthSubscription(testSubscription);
        final results = await resultStream.toList();

        // Should not yield any results when exception handling returns false
        expect(results.length, 0);
      });

      test('Test with stream error', () async {
        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(document: gql(testSubscription)),
          ),
        ).thenThrow(Exception('WebSocket connection failed'));

        final resultStream =
            functionsClass.gqlAuthSubscription(testSubscription);
        final results = await resultStream.toList();

        // Should handle stream errors gracefully and return empty stream
        expect(results.length, 0);
      });

      test('Test with multiple messages', () async {
        final mockStream = Stream.fromIterable([
          QueryResult(
            options: SubscriptionOptions(document: gql(testSubscription)),
            data: {
              'chatMessageCreate': {
                'id': 'msg1',
                'body': 'First message',
                'creator': {
                  'id': 'user1',
                  'name': 'John Doe',
                },
                'createdAt': '2023-01-01T00:00:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
          QueryResult(
            options: SubscriptionOptions(document: gql(testSubscription)),
            data: {
              'chatMessageCreate': {
                'id': 'msg2',
                'body': 'Second message',
                'creator': {
                  'id': 'user2',
                  'name': 'Jane Smith',
                },
                'createdAt': '2023-01-01T00:01:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        ]);

        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(document: gql(testSubscription)),
          ),
        ).thenAnswer((_) => mockStream);

        final resultStream =
            functionsClass.gqlAuthSubscription(testSubscription);
        final results = await resultStream.toList();

        expect(results.length, 2);
        final messageData1 =
            results[0].data!['chatMessageCreate'] as Map<String, dynamic>;
        final messageData2 =
            results[1].data!['chatMessageCreate'] as Map<String, dynamic>;
        expect(messageData1['id'], 'msg1');
        expect(messageData2['id'], 'msg2');
      });

      test('Test with null data', () async {
        final mockStream = Stream.fromIterable([
          QueryResult(
            options: SubscriptionOptions(document: gql(testSubscription)),
            data: null,
            source: QueryResultSource.network,
          ),
        ]);

        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(document: gql(testSubscription)),
          ),
        ).thenAnswer((_) => mockStream);

        final resultStream =
            functionsClass.gqlAuthSubscription(testSubscription);
        final results = await resultStream.toList();

        // Should not yield results when data is null
        expect(results.length, 0);
      });

      test('Test using ChatQueries.chatMessageCreate', () async {
        final chatQueries = ChatQueries();
        final subscription = chatQueries.chatMessageCreate;
        final variables = {
          'input': {'chatId': 'chat123'},
        };

        final mockStream = Stream.fromIterable([
          QueryResult(
            options: SubscriptionOptions(
              document: gql(subscription),
              variables: variables,
            ),
            data: {
              'chatMessageCreate': {
                'id': 'msg555',
                'body': 'Message from ChatQueries',
                'creator': {
                  'id': 'user4',
                  'name': 'Bob Wilson',
                },
                'createdAt': '2023-01-01T00:03:00.000Z',
                'updatedAt': '2023-01-01T00:03:00.000Z',
              },
            },
            source: QueryResultSource.network,
          ),
        ]);

        when(
          locator<GraphQLClient>().subscribe(
            SubscriptionOptions(
              document: gql(subscription),
              variables: variables,
            ),
          ),
        ).thenAnswer((_) => mockStream);

        final resultStream = functionsClass.gqlAuthSubscription(
          subscription,
          variables: variables,
        );
        final results = await resultStream.toList();

        expect(results.length, 1);
        final messageData =
            results[0].data!['chatMessageCreate'] as Map<String, dynamic>;
        expect(messageData['id'], 'msg555');
        expect(messageData['body'], 'Message from ChatQueries');
      });
    });
  });
  test('Test for clearGraphQLCache function', () {
    // Arrange

    final functionsClass = DataBaseMutationFunctions();

    // Initialize the database functions to set up clients
    functionsClass.init();

    // Create proper mocks for the cache chain
    final mockCache = MockGraphQLCache();
    final mockStore = MockStore();

    // Set up the mock chain properly
    when(mockCache.store).thenReturn(mockStore);
    when(functionsClass.clientAuth.cache).thenReturn(mockCache);

    // Act & Assert - Verify the method executes without throwing exceptions
    expect(() => functionsClass.clearGraphQLCache(), returnsNormally);

    // Verify that reset was called on the store
    verify(mockStore.reset()).called(1);
  });
}

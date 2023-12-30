import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/utils/queries.dart';
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
  testSetupLocator();
  locator<GraphqlConfig>().test();
  late DataBaseMutationFunctions functionsClass;
  final Directory dir = await Directory.systemTemp.createTemp('talawa_test');
  Hive.init(dir.path);
  await Hive.openBox('url');

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
    'isPublic': true,
    'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
  });

  setUpAll(() {
    registerServices();
    functionsClass = DataBaseMutationFunctions();
    functionsClass.init();
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
                'isPublic': true,
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
      expect(org.isPublic, testOrg.isPublic);
      expect(org.creatorInfo!.firstName, testOrg.creatorInfo!.firstName);
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
                'isPublic': true,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthQuery(query) as QueryResult;
      final org = OrgInfo.fromJson(
        (res.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.isPublic, testOrg.isPublic);
      expect(org.creatorInfo!.firstName, testOrg.creatorInfo!.firstName);
    });

    test('Testing gqlAuthQuery with false exception', () async {
      final String query = Queries().fetchOrgDetailsById('XYZ');

      when(locator<GraphQLClient>().query(QueryOptions(document: gql(query))))
          .thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          exception: OperationException(graphqlErrors: [userNotFound]),
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthQuery(query);
      expect(res, null);
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

      final res = await functionsClass.gqlAuthQuery(query);
      expect(res, null);
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
                'isPublic': true,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlAuthMutation(query) as QueryResult;
      final org = OrgInfo.fromJson(
        (res.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.isPublic, testOrg.isPublic);
      expect(org.creatorInfo!.firstName, testOrg.creatorInfo!.firstName);
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
      expect(res, null);
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
      expect(res, null);
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
                'isPublic': true,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthQuery(query);
      final org = OrgInfo.fromJson(
        (res!.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.isPublic, testOrg.isPublic);
      expect(org.creatorInfo!.firstName, testOrg.creatorInfo!.firstName);
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
                'isPublic': true,
                'creator': {'firstName': 'Shivam', 'lastName': 'Gupta'},
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final res = await functionsClass.gqlNonAuthMutation(query) as QueryResult;
      final org = OrgInfo.fromJson(
        (res.data!['organizations'] as List<Map<String, dynamic>>)[0],
      );

      expect(org.id, testOrg.id);
      expect(org.name, testOrg.name);
      expect(org.image, testOrg.image);
      expect(org.isPublic, testOrg.isPublic);
      expect(org.creatorInfo!.firstName, testOrg.creatorInfo!.firstName);
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
      expect(res, null);
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
      expect(res, null);
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
      expect(res, null);
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
      expect(res, null);
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
      expect(res, null);
    });
  });
}

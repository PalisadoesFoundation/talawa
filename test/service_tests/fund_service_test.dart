// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/utils/fund_queries.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  late FundService service;

  setUpAll(() {
    registerServices();

    service = FundService();
  });
  tearDownAll(() {
    unregisterServices();
  });

  group('FundService', () {
    test('getFunds returns funds and page info', () async {
      final query = FundQueries().fetchOrgFunds();

      final mockResult = QueryResult(
        data: {
          'organization': {
            'funds': {
              'edges': [
                {
                  'node': {
                    'id': 'fund1',
                    'name': 'Education Fund',
                    'isTaxDeductible': true,
                  },
                  'cursor': 'cursor1',
                }
              ],
              'pageInfo': {
                'endCursor': 'cursor1',
                'hasNextPage': false,
                'hasPreviousPage': false,
                'startCursor': 'cursor1',
              },
            },
          },
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql(query)),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          query,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await service.getFunds();

      expect(result.first, isA<List<Fund>>());
      expect(result.first.first.id, 'fund1');
      expect(result.second, isA<PageInfo>());
      expect(result.second.endCursor, 'cursor1');
    });

    test('getCampaigns returns campaigns and page info', () async {
      final query = FundQueries().fetchCampaignsByFund();

      final mockResult = QueryResult(
        data: {
          'fund': {
            'campaigns': {
              'edges': [
                {
                  'node': {
                    'id': 'camp1',
                    'name': 'Campaign 1',
                  },
                  'cursor': 'cursor1',
                }
              ],
              'pageInfo': {
                'endCursor': 'cursor1',
                'hasNextPage': false,
                'hasPreviousPage': false,
                'startCursor': 'cursor1',
              },
            },
          },
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql(query)),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          query,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await service.getCampaigns('fund1');

      expect(result.first, isA<List<Campaign>>());
      expect(result.first.first.id, 'camp1');
      expect(result.second, isA<PageInfo>());
      expect(result.second.endCursor, 'cursor1');
    });

    test('getPledgesByCampaign returns pledges', () async {
      final query = FundQueries().fetchPledgesByCampaign();

      final mockResult = QueryResult(
        data: {
          'getMyPledgesForCampaign': [
            {
              'id': 'pledge1',
              'amount': 100,
              'note': 'Test',
              'pledger': {'id': 'user1', 'name': 'Alice'},
              'creator': {'id': 'user2', 'name': 'Bob'},
              'campaign': {'id': 'camp1', 'name': 'Campaign 1'},
            }
          ],
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql(query)),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          query,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async => mockResult);

      final pledges = await service.getPledgesByCampaign('camp1');
      expect(pledges, isA<List<Pledge>>());
      expect(pledges.first.id, 'pledge1');
      expect(pledges.first.amount, 100);
      expect(pledges.first.note, 'Test');
      expect(pledges.first.pledger?.id, 'user1');
      expect(pledges.first.creator?.id, 'user2');
      expect(pledges.first.campaign?.id, 'camp1');
    });

    test('createPledge calls mutation and returns result', () async {
      final query = FundQueries().createPledge();

      final mockResult = QueryResult(
        data: {
          'createFundCampaignPledge': {'id': 'pledge1'},
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql(query)),
      );

      when(
        databaseFunctions.gqlAuthMutation(
          query,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await service.createPledge({
        'amount': 100,
        'campaignId': 'camp1',
        'note': 'Test',
        'pledgerId': 'user1',
      });

      expect(result.data, isNotNull);
      expect(result.data, isNotNull);
      final data = result.data!;
      expect(data['createFundCampaignPledge']['id'], 'pledge1');
    });

    test('updatePledge calls mutation and returns result', () async {
      final query = FundQueries().updatePledge();

      final mockResult = QueryResult(
        data: {
          'updateFundCampaignPledge': {'id': 'pledge1'},
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql(query)),
      );

      when(
        databaseFunctions.gqlAuthMutation(
          query,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await service.updatePledge({
        'id': 'pledge1',
        'amount': 200,
        'note': 'Updated',
      });

      expect(result.data, isNotNull);
      expect(result.data!['updateFundCampaignPledge']['id'], 'pledge1');
    });

    test('deletePledge calls mutation and returns result', () async {
      final query = FundQueries().deletePledge();

      final mockResult = QueryResult(
        data: {
          'deleteFundCampaignPledge': {'id': 'pledge1'},
        },
        source: QueryResultSource.network,
        options: QueryOptions(document: gql(query)),
      );

      when(
        databaseFunctions.gqlAuthMutation(
          query,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer((_) async => mockResult);

      final result = await service.deletePledge('pledge1');

      expect(result.data, isNotNull);
      expect(result.data!['deleteFundCampaignPledge']['id'], 'pledge1');
    });

    group('Exception and Error Cases', () {
      group('getFunds exceptions', () {
        test('throws exception when organization ID is empty', () {
          // Mock userConfig with empty org ID
          when(userConfig.currentOrg).thenReturn(
            OrgInfo(id: '', name: 'Test Org'),
          );

          expect(
            () async => await service.getFunds(),
            throwsA(isA<Exception>()),
          );
        });

        test('throws exception when GraphQL returns null data', () {
          final query = FundQueries().fetchOrgFunds();

          final mockResult = QueryResult(
            data: null,
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          expect(
            () async => await service.getFunds(),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load Funds'),
              ),
            ),
          );
        });

        test('throws exception when GraphQL returns exception', () {
          final query = FundQueries().fetchOrgFunds();

          final mockResult = QueryResult(
            data: null,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Network error'),
              ],
            ),
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          expect(
            () async => await service.getFunds(),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load Funds'),
              ),
            ),
          );
        });

        test('throws exception when database function throws', () {
          final query = FundQueries().fetchOrgFunds();

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenThrow(Exception('Database connection failed'));

          expect(
            () async => await service.getFunds(),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load Funds'),
              ),
            ),
          );
        });
      });

      group('getCampaigns exceptions', () {
        test('throws exception when GraphQL returns null data', () {
          final query = FundQueries().fetchCampaignsByFund();

          final mockResult = QueryResult(
            data: null,
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          expect(
            () async => await service.getCampaigns('fund1'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load campaigns'),
              ),
            ),
          );
        });

        test('throws exception when GraphQL returns exception', () {
          final query = FundQueries().fetchCampaignsByFund();

          final mockResult = QueryResult(
            data: null,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Fund not found'),
              ],
            ),
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          expect(
            () async => await service.getCampaigns('invalid_fund_id'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load campaigns'),
              ),
            ),
          );
        });

        test('throws exception when database function throws', () {
          final query = FundQueries().fetchCampaignsByFund();

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenThrow(Exception('Network timeout'));

          expect(
            () async => await service.getCampaigns('fund1'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load campaigns'),
              ),
            ),
          );
        });
      });

      group('getPledgesByCampaign exceptions', () {
        test('throws exception when GraphQL returns null data', () {
          final query = FundQueries().fetchPledgesByCampaign();

          final mockResult = QueryResult(
            data: null,
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          expect(
            () async => await service.getPledgesByCampaign('camp1'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load pledges'),
              ),
            ),
          );
        });

        test('throws exception when pledges data is null', () {
          final query = FundQueries().fetchPledgesByCampaign();

          final mockResult = QueryResult(
            data: {
              'getMyPledgesForCampaign': null,
            },
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          expect(
            () async => await service.getPledgesByCampaign('camp1'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load pledges'),
              ),
            ),
          );
        });

        test('throws exception when database function throws', () {
          final query = FundQueries().fetchPledgesByCampaign();

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenThrow(Exception('Authentication failed'));

          expect(
            () async => await service.getPledgesByCampaign('camp1'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load pledges'),
              ),
            ),
          );
        });
      });

      group('createPledge exceptions', () {
        test('throws exception when database function throws', () {
          final query = FundQueries().createPledge();

          when(
            databaseFunctions.gqlAuthMutation(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenThrow(Exception('Validation failed'));

          expect(
            () async => await service.createPledge({
              'amount': 100,
              'campaignId': 'camp1',
            }),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to create pledge'),
              ),
            ),
          );
        });

        test('handles GraphQL mutation errors gracefully', () async {
          final query = FundQueries().createPledge();

          final mockResult = QueryResult(
            data: null,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Campaign not found'),
              ],
            ),
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthMutation(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          final result = await service.createPledge({
            'amount': 100,
            'campaignId': 'invalid_camp',
          });

          expect(result.exception, isNotNull);
          expect(result.data, isNull);
        });
      });

      group('updatePledge exceptions', () {
        test('throws exception when database function throws', () {
          final query = FundQueries().updatePledge();

          when(
            databaseFunctions.gqlAuthMutation(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenThrow(Exception('Pledge not found'));

          expect(
            () async => await service.updatePledge({
              'id': 'pledge1',
              'amount': 200,
            }),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to load pledges'),
              ),
            ),
          );
        });

        test('handles GraphQL mutation errors gracefully', () async {
          final query = FundQueries().updatePledge();

          final mockResult = QueryResult(
            data: null,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Insufficient permissions'),
              ],
            ),
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthMutation(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          final result = await service.updatePledge({
            'id': 'pledge1',
            'amount': 200,
          });

          expect(result.exception, isNotNull);
          expect(result.data, isNull);
        });
      });

      group('deletePledge exceptions', () {
        test('throws exception when database function throws', () {
          final query = FundQueries().deletePledge();

          when(
            databaseFunctions.gqlAuthMutation(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenThrow(Exception('Database error'));

          expect(
            () async => await service.deletePledge('pledge1'),
            throwsA(
              isA<Exception>().having(
                (e) => e.toString(),
                'message',
                contains('Failed to delete pledges'),
              ),
            ),
          );
        });

        test('handles GraphQL mutation errors gracefully', () async {
          final query = FundQueries().deletePledge();

          final mockResult = QueryResult(
            data: null,
            exception: OperationException(
              graphqlErrors: [
                const GraphQLError(message: 'Pledge not found'),
              ],
            ),
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthMutation(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          final result = await service.deletePledge('invalid_pledge_id');

          expect(result.exception, isNotNull);
          expect(result.data, isNull);
        });
      });

      group('Edge cases and data validation', () {
        test('getCampaigns handles empty edges array', () async {
          final query = FundQueries().fetchCampaignsByFund();

          final mockResult = QueryResult(
            data: {
              'fund': {
                'campaigns': {
                  'edges': [],
                  'pageInfo': {
                    'endCursor': null,
                    'hasNextPage': false,
                    'hasPreviousPage': false,
                    'startCursor': null,
                  },
                },
              },
            },
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          final result = await service.getCampaigns('fund1');

          expect(result.first, isEmpty);
          expect(result.second.endCursor, isNull);
        });

        test('getPledgesByCampaign handles empty pledges array', () async {
          final query = FundQueries().fetchPledgesByCampaign();

          final mockResult = QueryResult(
            data: {
              'getMyPledgesForCampaign': [],
            },
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          final pledges = await service.getPledgesByCampaign('camp1');

          expect(pledges, isEmpty);
        });

        test('getCampaigns handles missing cursor in edges', () async {
          final query = FundQueries().fetchCampaignsByFund();

          final mockResult = QueryResult(
            data: {
              'fund': {
                'campaigns': {
                  'edges': [
                    {
                      'node': {
                        'id': 'camp1',
                        'name': 'Campaign 1',
                      },
                      // Missing cursor
                    }
                  ],
                  'pageInfo': {
                    'endCursor': 'original_cursor',
                    'hasNextPage': false,
                    'hasPreviousPage': false,
                    'startCursor': 'original_cursor',
                  },
                },
              },
            },
            source: QueryResultSource.network,
            options: QueryOptions(document: gql(query)),
          );

          when(
            databaseFunctions.gqlAuthQuery(
              query,
              variables: anyNamed('variables'),
            ),
          ).thenAnswer((_) async => mockResult);

          final result = await service.getCampaigns('fund1');

          expect(result.first, hasLength(1));
          expect(result.second.endCursor, equals('original_cursor'));
        });
      });
    });
  });
}

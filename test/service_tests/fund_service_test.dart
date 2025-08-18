// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
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
  });
}

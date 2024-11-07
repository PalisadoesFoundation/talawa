// ignore_for_file: avoid_dynamic_calls

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/utils/fund_queries.dart';
import '../helpers/test_helpers.dart';

void main() {
  setUp(() {
    registerServices();
  });

  group('Test FundService', () {
    test('Test getFunds Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const orgId = "XYZ";
      final query = FundQueries().fetchOrgFunds();

      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'orgId': orgId,
            'filter': '',
            'orderBy': 'createdAt_DESC',
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'fundsByOrganization': [
              {
                '_id': 'fund_1',
                'name': 'Fund 1',
              },
              {
                '_id': 'fund_2',
                'name': 'Fund 2',
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final service = FundService();
      final funds = await service.getFunds();

      expect(funds.length, 2);
      expect(funds[0].id, 'fund_1');
      expect(funds[0].name, 'Fund 1');
      expect(funds[1].id, 'fund_2');
      expect(funds[1].name, 'Fund 2');
    });

    test('Test getCampaigns Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const fundId = "fund_123";
      final query = FundQueries().fetchCampaignsByFund();

      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'fundId': fundId,
            'where': {
              'fundId': fundId,
            },
            'pledgeOrderBy': 'endDate_DESC',
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'getFundById': {
              'campaigns': [
                {
                  '_id': 'campaign_1',
                  'name': 'Campaign 1',
                },
                {
                  '_id': 'campaign_2',
                  'name': 'Campaign 2',
                },
              ],
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = FundService();
      final campaigns = await service.getCampaigns(fundId);

      expect(campaigns.length, 2);
      expect(campaigns[0].id, 'campaign_1');
      expect(campaigns[0].name, 'Campaign 1');
      expect(campaigns[1].id, 'campaign_2');
      expect(campaigns[1].name, 'Campaign 2');
    });

    test('Test getPledgesByCampaign Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      const campaignId = "campaign_123";
      final query = FundQueries().fetchPledgesByCampaign();

      when(
        dataBaseMutationFunctions.gqlAuthQuery(
          query,
          variables: {
            'where': {
              'id': campaignId,
            },
            'pledgeOrderBy': 'endDate_DESC',
          },
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'getFundraisingCampaigns': [
              {
                'pledges': [
                  {
                    '_id': 'pledge_1',
                    'amount': 100,
                  },
                  {
                    '_id': 'pledge_2',
                    'amount': 200,
                  },
                ],
              },
            ],
          },
          source: QueryResultSource.network,
        ),
      );

      final service = FundService();
      final pledges = await service.getPledgesByCampaign(campaignId);

      expect(pledges.length, 2);
      expect(pledges[0].id, 'pledge_1');
      expect(pledges[0].amount, 100);
      expect(pledges[1].id, 'pledge_2');
      expect(pledges[1].amount, 200);
    });

    test('Test createPledge Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = FundQueries().createPledge();
      final variables = {
        'campaignId': 'campaign_123',
        'amount': 50,
      };

      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: variables,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'createPledge': {
              'id': 'pledge_123',
              'amount': 50,
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = FundService();
      final result = await service.createPledge(variables);

      expect(result.data?['createPledge']['id'], 'pledge_123');
      expect(result.data?['createPledge']['amount'], 50);
    });

    test('Test updatePledge Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = FundQueries().updatePledge();
      final variables = {
        'id': 'pledge_123',
        'amount': 150,
      };

      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: variables,
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'updatePledge': {
              'id': 'pledge_123',
              'amount': 150,
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = FundService();
      final result = await service.updatePledge(variables);

      expect(result.data?['updatePledge']['id'], 'pledge_123');
      expect(result.data?['updatePledge']['amount'], 150);
    });

    test('Test deletePledge Method', () async {
      final dataBaseMutationFunctions = locator<DataBaseMutationFunctions>();
      final query = FundQueries().deletePledge();
      const pledgeId = 'pledge_123';

      when(
        dataBaseMutationFunctions.gqlAuthMutation(
          query,
          variables: {'id': pledgeId},
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          options: QueryOptions(document: gql(query)),
          data: {
            'deletePledge': {
              'id': pledgeId,
            },
          },
          source: QueryResultSource.network,
        ),
      );

      final service = FundService();
      final result = await service.deletePledge(pledgeId);

      expect(result.data?['deletePledge']['id'], pledgeId);
    });
  });
}

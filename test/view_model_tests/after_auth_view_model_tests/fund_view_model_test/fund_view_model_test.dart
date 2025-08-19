import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/utils/fund_queries.dart';
import 'package:talawa/utils/pair.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model.dart/fund_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  late FundViewModel viewModel;
  setUpAll(() {
    registerServices();
    viewModel = FundViewModel();
  });
  tearDownAll(() async {
    await locator.reset();
  });
  group('fund view model tests', () {
    test('initialise sets loading flags and calls fetchFunds', () async {
      when(fundService.getFunds()).thenAnswer(
        (_) async => Future.value(
          Pair(
            [Fund(id: 'f1', name: 'Fund 1')],
            PageInfo(hasNextPage: false, hasPreviousPage: false),
          ),
        ),
      );
      viewModel.initialise();
      expect(viewModel.isFetchingFunds, true);
      expect(viewModel.isFetchingCampaigns, true);
      expect(viewModel.isFetchingPledges, true);
    });

    test('fetchFunds populates funds and filteredFunds', () async {
      final funds = [
        Fund(id: 'f1', name: 'Fund 1'),
        Fund(id: 'f2', name: 'Fund 2'),
      ];
      final pageInfo = PageInfo(hasNextPage: false, hasPreviousPage: false);
      when(fundService.getFunds())
          .thenAnswer((_) async => Pair(funds, pageInfo));
      await viewModel.fetchFunds();
      expect(viewModel.funds.length, 2);
      expect(viewModel.filteredFunds.length, 2);
      expect(viewModel.isFetchingFunds, false);
    });

    test('fetchCampaigns populates campaigns and filteredCampaigns', () async {
      final campaigns = [
        Campaign(id: 'c1', name: 'Camp 1'),
        Campaign(id: 'c2', name: 'Camp 2'),
      ];
      final pageInfo = PageInfo(hasNextPage: false, hasPreviousPage: false);
      when(fundService.getCampaigns('f1'))
          .thenAnswer((_) async => Pair(campaigns, pageInfo));
      await viewModel.fetchCampaigns('f1');
      expect(viewModel.campaigns.length, 2);
      expect(viewModel.filteredCampaigns.length, 2);
      expect(viewModel.isFetchingCampaigns, false);
    });

    test('fetchPledges populates userPledges', () async {
      final pledges = [
        Pledge(id: 'p1', amount: 100),
        Pledge(id: 'p2', amount: 200),
      ];
      when(fundService.getPledgesByCampaign('c1'))
          .thenAnswer((_) async => pledges);
      await viewModel.fetchPledges('c1');
      expect(viewModel.userPledges.length, 2);
      expect(viewModel.isFetchingPledges, false);
    });

    // test('createPledge calls service and refreshes pledges', () async {
    //   final pledgeData = {'amount': 100};
    //   final mockQueryResult = QueryResult<Object?>(
    //     data: {
    //       'createFundCampaignPledge': {'id': 'p1'},
    //     },
    //     source: QueryResultSource.network,
    //     options: QueryOptions(
    //       document: gql(FundQueries().createPledge()),
    //     ),
    //   );
    //   when(fundService.createPledge(pledgeData))
    //       .thenAnswer((_) async => mockQueryResult);
    //   when(fundService.getPledgesByCampaign('c1')).thenAnswer((_) async => []);
    //   viewModel.parentcampaignId = 'c1';
    //   await viewModel.createPledge(pledgeData);
    //   verify(fundService.createPledge(pledgeData)).called(1);
    //   verify(fundService.getPledgesByCampaign('c1')).called(1);
    // });

    // test('updatePledge calls service and refreshes pledges', () async {
    //   final updatedData = {'amount': 200};
    //   final mockQueryResult = QueryResult<Object?>(
    //     data: {
    //       'updateFundCampaignPledge': {'id': 'p1'},
    //     },
    //     source: QueryResultSource.network,
    //     options: QueryOptions(
    //       document: gql(FundQueries().updatePledge()),
    //     ),
    //   );
    //   when(fundService.updatePledge(updatedData))
    //       .thenAnswer((_) async => mockQueryResult);
    //   when(fundService.getPledgesByCampaign('c1')).thenAnswer((_) async => []);
    //   viewModel.parentcampaignId = 'c1';
    //   await viewModel.updatePledge(updatedData);
    //   verify(fundService.updatePledge(updatedData)).called(1);
    //   verify(fundService.getPledgesByCampaign('c1')).called(1);
    // });

    test('deletePledge calls service and refreshes pledges', () async {
      final mockQueryResult = QueryResult<Object?>(
        data: {
          'deleteFundCampaignPledge': {'id': 'p1'},
        },
        source: QueryResultSource.network,
        options: QueryOptions(
          document: gql(FundQueries().deletePledge()),
        ),
      );
      when(fundService.deletePledge('p1'))
          .thenAnswer((_) async => mockQueryResult);
      when(fundService.getPledgesByCampaign('c1')).thenAnswer((_) async => []);
      await viewModel.deletePledge('p1', 'c1');
      verify(
        fundService.deletePledge(
          'p1',
        ),
      ).called(1);
      verify(fundService.getPledgesByCampaign('c1')).called(2);
    });

    test('sortFunds changes sort option and fetches funds', () async {
      when(fundService.getFunds())
          .thenAnswer((_) async => Pair([], PageInfo()));
      viewModel.sortFunds('createdAt_ASC');
      expect(viewModel.fundSortOption, 'createdAt_ASC');
    });

    test('searchFunds filters funds by name', () async {
      viewModel.funds.addAll(
        [Fund(id: 'f1', name: 'Alpha'), Fund(id: 'f2', name: 'Beta')],
      );
      viewModel.searchFunds('alpha');
      expect(viewModel.filteredFunds.length, 1);
      expect(viewModel.filteredFunds.first.name, 'Alpha');
    });

    test('dispose cancels stream subscription', () async {
      viewModel.dispose();
      // No error should occur
    });
  });
}

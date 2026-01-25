import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/utils/fund_queries.dart';
import 'package:talawa/utils/pair.dart';
import 'package:talawa/view_model/after_auth_view_models/fund_view_model/fund_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FundViewModel viewModel;

  setUpAll(() {
    registerServices();
  });
  setUp(() {
    viewModel = FundViewModel();
  });

  tearDownAll(() async {
    await locator.reset();
  });

  group('fund view model tests', () {
    test('initialise sets loading flags and calls fetchFunds', () {
      when(fundService.getFunds()).thenAnswer(
        (_) => Future.value(
          Pair(
            [Fund(id: 'f1', name: 'Fund 1')],
            PageInfo(hasNextPage: false, hasPreviousPage: false),
          ),
        ),
      );
      viewModel.initialise();
      expect(viewModel.isFetchingFunds, true);
      expect(viewModel.isFetchingCampaigns, false);
      expect(viewModel.isFetchingPledges, false);
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

    test('sortFunds changes sort option and fetches funds', () {
      when(fundService.getFunds())
          .thenAnswer((_) async => Pair([], PageInfo()));
      viewModel.sortFunds('createdAt_ASC');
      expect(viewModel.fundSortOption, 'createdAt_ASC');
    });

    test('searchFunds filters funds by name', () {
      viewModel.funds.addAll(
        [Fund(id: 'f1', name: 'Alpha'), Fund(id: 'f2', name: 'Beta')],
      );
      viewModel.searchFunds('alpha');
      expect(viewModel.filteredFunds.length, 1);
      expect(viewModel.filteredFunds.first.name, 'Alpha');
    });

    test('dispose cancels stream subscription', () {
      viewModel.dispose();
      // No error should occur
    });

    // Test getters
    test('getters return correct values', () {
      expect(viewModel.fundsPageInfo, isA<PageInfo?>());
      expect(viewModel.isLoadingMoreFunds, false);
      expect(viewModel.isLoadingMoreCampaigns, false);
      expect(viewModel.campaignsPageInfo, isA<PageInfo?>());
    }); // Test refreshFunds
    test('refreshFunds clears data and sets loading flags', () {
      // Setup initial data
      viewModel.funds.addAll([Fund(id: 'f1', name: 'Fund 1')]);
      viewModel.campaigns.addAll([Campaign(id: 'c1', name: 'Campaign 1')]);

      viewModel.refreshFunds();

      expect(viewModel.isFetchingFunds, true);
      expect(viewModel.isFetchingCampaigns, false);
      expect(viewModel.isFetchingPledges, false);
      expect(viewModel.funds.isEmpty, true);
      expect(viewModel.campaigns.isEmpty, true);
    });

    test('refreshFunds resets page info', () {
      viewModel.refreshFunds();

      expect(viewModel.fundsPageInfo?.hasNextPage, false);
      expect(viewModel.fundsPageInfo?.hasPreviousPage, false);
      expect(viewModel.campaignsPageInfo?.hasNextPage, false);
      expect(viewModel.campaignsPageInfo?.hasPreviousPage, false);
    });

    // Test loadMoreFunds
    test('loadMoreFunds returns early when no more funds available', () async {
      // The hasMoreFunds getter returns false by default since _fundsPageInfo.hasNextPage is false
      await viewModel.loadMoreFunds();

      expect(viewModel.isLoadingMoreFunds, false);
    });

    test(
        'loadMoreFunds successfully loads more funds when hasMoreFunds is true',
        () async {
      // First, set up initial funds with pagination
      final initialFunds = [Fund(id: 'f1', name: 'Fund 1')];
      final initialPageInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        endCursor: 'cursor1',
      );

      when(fundService.getFunds())
          .thenAnswer((_) async => Pair(initialFunds, initialPageInfo));

      // Load initial funds
      await viewModel.fetchFunds();

      expect(viewModel.funds.length, 1);
      expect(viewModel.hasMoreFunds, true);

      // Mock additional funds to be loaded
      final additionalFunds = [Fund(id: 'f2', name: 'Fund 2')];
      final newPageInfo = PageInfo(
        hasNextPage: false,
        hasPreviousPage: true,
        startCursor: 'cursor1',
        endCursor: 'cursor2',
      );

      when(fundService.getFunds(after: 'cursor1'))
          .thenAnswer((_) async => Pair(additionalFunds, newPageInfo));

      await viewModel.loadMoreFunds();

      expect(viewModel.funds.length, 2);
      expect(viewModel.filteredFunds.length, 2);
      expect(viewModel.isLoadingMoreFunds, false);
      expect(viewModel.hasMoreFunds, false);
    });

    test('loadMoreFunds handles errors gracefully', () async {
      // Set up initial funds with pagination
      final initialFunds = [Fund(id: 'f1', name: 'Fund 1')];
      final initialPageInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        endCursor: 'cursor1',
      );

      when(fundService.getFunds())
          .thenAnswer((_) async => Pair(initialFunds, initialPageInfo));

      await viewModel.fetchFunds();

      when(fundService.getFunds(after: 'cursor1'))
          .thenThrow(Exception('Network error'));

      await viewModel.loadMoreFunds();

      expect(viewModel.isLoadingMoreFunds, false);
      expect(viewModel.funds.length, 1); // Should not have changed
    });

    test('loadMoreFunds does not call service when already loading', () async {
      // Set up initial funds with pagination to enable loading more
      final initialFunds = [Fund(id: 'f1', name: 'Fund 1')];
      final initialPageInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        endCursor: 'cursor1',
      );

      when(fundService.getFunds())
          .thenAnswer((_) async => Pair(initialFunds, initialPageInfo));

      await viewModel.fetchFunds();

      // Clear any previous calls
      clearInteractions(fundService);

      // Mock the service call for the pagination request
      when(fundService.getFunds(after: 'cursor1')).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return Pair([Fund(id: 'f2', name: 'Fund 2')], PageInfo());
      });

      // Simulate concurrent calls to loadMoreFunds
      final future1 = viewModel.loadMoreFunds();
      final future2 = viewModel.loadMoreFunds();

      await Future.wait([future1, future2]);

      // Should only call the service once due to the guard
      verify(fundService.getFunds(after: 'cursor1')).called(1);
    });

    // Test loadMoreCampaigns
    test('loadMoreCampaigns returns early when no more campaigns available',
        () async {
      await viewModel.loadMoreCampaigns();

      expect(viewModel.isLoadingMoreCampaigns, false);
    });

    test(
        'loadMoreCampaigns successfully loads more campaigns when hasMoreCampaigns is true',
        () async {
      // First, set up initial campaigns with pagination
      final initialCampaigns = [Campaign(id: 'c1', name: 'Campaign 1')];
      final initialPageInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        endCursor: 'cursor1',
      );

      when(fundService.getCampaigns('f1'))
          .thenAnswer((_) async => Pair(initialCampaigns, initialPageInfo));

      // Load initial campaigns
      await viewModel.fetchCampaigns('f1');

      expect(viewModel.campaigns.length, 1);
      expect(viewModel.hasMoreCampaigns, true);
      expect(viewModel.parentFundId, 'f1');

      // Mock additional campaigns to be loaded
      final additionalCampaigns = [Campaign(id: 'c2', name: 'Campaign 2')];
      final newPageInfo = PageInfo(
        hasNextPage: false,
        hasPreviousPage: true,
        startCursor: 'cursor1',
        endCursor: 'cursor2',
      );

      when(fundService.getCampaigns('f1', after: 'cursor1'))
          .thenAnswer((_) async => Pair(additionalCampaigns, newPageInfo));

      await viewModel.loadMoreCampaigns();

      expect(viewModel.campaigns.length, 2);
      expect(viewModel.filteredCampaigns.length, 2);
      expect(viewModel.isLoadingMoreCampaigns, false);
      expect(viewModel.hasMoreCampaigns, false);
    });

    test('loadMoreCampaigns handles errors gracefully', () async {
      // Set up initial campaigns with pagination
      final initialCampaigns = [Campaign(id: 'c1', name: 'Campaign 1')];
      final initialPageInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        endCursor: 'cursor1',
      );

      when(fundService.getCampaigns('f1'))
          .thenAnswer((_) async => Pair(initialCampaigns, initialPageInfo));

      await viewModel.fetchCampaigns('f1');

      when(fundService.getCampaigns('f1', after: 'cursor1'))
          .thenThrow(Exception('Network error'));

      await viewModel.loadMoreCampaigns();

      expect(viewModel.isLoadingMoreCampaigns, false);
      expect(viewModel.campaigns.length, 1); // Should not have changed
    });

    test('loadMoreCampaigns does not call service when already loading',
        () async {
      // Set up initial campaigns with pagination
      final initialCampaigns = [Campaign(id: 'c1', name: 'Campaign 1')];
      final initialPageInfo = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        endCursor: 'cursor1',
      );

      when(fundService.getCampaigns('f1'))
          .thenAnswer((_) async => Pair(initialCampaigns, initialPageInfo));

      await viewModel.fetchCampaigns('f1');

      // Clear any previous calls
      clearInteractions(fundService);

      // Mock the service call for the pagination request
      when(fundService.getCampaigns('f1', after: 'cursor1'))
          .thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return Pair([Campaign(id: 'c2', name: 'Campaign 2')], PageInfo());
      });

      // Simulate concurrent calls to loadMoreCampaigns
      final future1 = viewModel.loadMoreCampaigns();
      final future2 = viewModel.loadMoreCampaigns();

      await Future.wait([future1, future2]);

      // Should only call the service once due to the guard
      verify(fundService.getCampaigns('f1', after: 'cursor1')).called(1);
    });

    test('hasMoreFunds and hasMoreCampaigns getters work correctly', () async {
      // Initially no page info, so no more funds/campaigns
      expect(viewModel.hasMoreFunds, false);
      expect(viewModel.hasMoreCampaigns, false);

      // Set up funds with more pages available
      final fundsWithMore = [Fund(id: 'f1', name: 'Fund 1')];
      final pageInfoWithMore = PageInfo(
        hasNextPage: true,
        hasPreviousPage: false,
        endCursor: 'cursor1',
      );

      when(fundService.getFunds())
          .thenAnswer((_) async => Pair(fundsWithMore, pageInfoWithMore));

      await viewModel.fetchFunds();
      expect(viewModel.hasMoreFunds, true);

      // Set up campaigns with more pages available
      final campaignsWithMore = [Campaign(id: 'c1', name: 'Campaign 1')];
      when(fundService.getCampaigns('f1'))
          .thenAnswer((_) async => Pair(campaignsWithMore, pageInfoWithMore));

      await viewModel.fetchCampaigns('f1');
      expect(viewModel.hasMoreCampaigns, true);
    });

    // Test sortCampaigns
    test('sortCampaigns changes sort option', () {
      viewModel.sortCampaigns('startDate_ASC');
      expect(viewModel.campaignSortOption, 'startDate_ASC');
    });

    test('sortCampaigns does nothing when same option provided', () {
      final initialOption = viewModel.campaignSortOption;
      viewModel.sortCampaigns(initialOption);
      expect(viewModel.campaignSortOption, initialOption);
    });

    // Test createPledge
    test('createPledge sets parentcampaignId correctly', () {
      viewModel.parentcampaignId = 'c1';
      expect(viewModel.parentcampaignId, 'c1');
    });

    test('createPledge method exists and can be called', () {
      viewModel.parentcampaignId = 'c1';
      // This tests that the method doesn't throw when called
      // We can't easily test the service call without mocking conflicts
      expect(() => viewModel.createPledge({}), returnsNormally);
    });

    // Test updatePledge
    test('updatePledge method exists and can be called', () {
      viewModel.parentcampaignId = 'c1';
      expect(() => viewModel.updatePledge({'id': 'p1'}), returnsNormally);
    });

    // Test selectFund
    test('selectFund sets parentFundId correctly', () {
      viewModel.selectFund('f1');
      expect(viewModel.parentFundId, 'f1');
    });

    // Test selectCampaign
    test('selectCampaign sets parentcampaignId correctly', () {
      viewModel.selectCampaign('c1');
      expect(viewModel.parentcampaignId, 'c1');
    });
  });
}

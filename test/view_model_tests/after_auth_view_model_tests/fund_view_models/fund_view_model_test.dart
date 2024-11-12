import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/fund_service.dart';
import 'package:talawa/view_model/after_auth_view_models/funds_view_models/fund_view_model.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('FundViewModel Tests', () {
    late FundViewModel model;

    setUp(() {
      model = FundViewModel();
    });

    test('Test initialization', () async {
      model.initialise();

      expect(model.isFetchingFunds, true);
      expect(model.isFetchingCampaigns, true);
      expect(model.isFetchingPledges, true);
      expect(model.funds, isEmpty);
      expect(model.campaigns, isEmpty);
      expect(model.allPledges, isEmpty);
    });

    group('Fund Tests', () {
      test('Test fetchFunds success', () async {
        final mockFundService = locator<FundService>();
        final mockFunds = [
          Fund(id: '1', name: 'Fund 1'),
          Fund(id: '2', name: 'Fund 2'),
        ];

        when(mockFundService.getFunds(orderBy: 'createdAt_DESC'))
            .thenAnswer((_) async => mockFunds);

        await model.fetchFunds();

        expect(model.funds.length, 2);
        expect(model.funds[0].id, '1');
        expect(model.isFetchingFunds, false);
        verify(mockFundService.getFunds(orderBy: 'createdAt_DESC')).called(1);
      });

      test('Test searchFunds filters correctly', () async {
        final mockFundService = locator<FundService>();
        final mockFunds = [
          Fund(id: '1', name: 'Education Fund'),
          Fund(id: '2', name: 'Health Fund'),
        ];

        when(mockFundService.getFunds(orderBy: 'createdAt_DESC'))
            .thenAnswer((_) async => mockFunds);

        await model.fetchFunds();
        model.searchFunds('health');

        expect(model.filteredFunds.length, 1);
        expect(model.filteredFunds[0].name, 'Health Fund');
      });

      test('Test sortFunds changes sort option and refetches', () async {
        final mockFundService = locator<FundService>();

        when(mockFundService.getFunds(orderBy: 'name_ASC'))
            .thenAnswer((_) async => []);

        model.sortFunds('name_ASC');

        expect(model.fundSortOption, 'name_ASC');
        verify(mockFundService.getFunds(orderBy: 'name_ASC')).called(1);
      });
    });

    group('Campaign Tests', () {
      test('Test fetchCampaigns success', () async {
        final mockFundService = locator<FundService>();
        final mockCampaigns = [
          Campaign(id: '1', name: 'Campaign 1'),
          Campaign(id: '2', name: 'Campaign 2'),
        ];

        when(mockFundService.getCampaigns('1', orderBy: 'endDate_DESC'))
            .thenAnswer((_) async => mockCampaigns);

        await model.fetchCampaigns('1');

        expect(model.campaigns.length, 2);
        expect(model.campaigns[0].id, '1');
        expect(model.isFetchingCampaigns, false);
        verify(mockFundService.getCampaigns('1', orderBy: 'endDate_DESC'))
            .called(1);
      });

      test('Test searchCampaigns filters correctly', () async {
        final mockFundService = locator<FundService>();
        final mockCampaigns = [
          Campaign(id: '1', name: 'Summer Campaign'),
          Campaign(id: '2', name: 'Winter Campaign'),
        ];

        when(mockFundService.getCampaigns('1', orderBy: 'endDate_DESC'))
            .thenAnswer((_) async => mockCampaigns);

        await model.fetchCampaigns('1');
        model.searchCampaigns('summer');

        expect(model.filteredCampaigns.length, 1);
        expect(model.filteredCampaigns[0].name, 'Summer Campaign');
      });

      test('Test sortCampaigns changes sort option and refetches', () async {
        model.parentFundId = '1';
        final mockFundService = locator<FundService>();

        when(mockFundService.getCampaigns('1', orderBy: 'name_ASC'))
            .thenAnswer((_) async => []);

        model.sortCampaigns('name_ASC');
        await model.fetchCampaigns('1');
        expect(model.campaignSortOption, 'name_ASC');
        verify(mockFundService.getCampaigns('1', orderBy: 'name_ASC'))
            .called(1);
      });
    });

    group('Pledge Tests', () {
      test('Test fetchPledges success', () async {
        final mockFundService = locator<FundService>();
        final mockPledges = [
          Pledge(
            id: '1',
            pledgers: [User(id: userConfig.currentUser.id)],
          ),
          Pledge(
            id: '2',
            pledgers: [User(id: 'other_user')],
          ),
        ];

        when(mockFundService.getPledgesByCampaign('1', orderBy: 'endDate_DESC'))
            .thenAnswer((_) async => mockPledges);

        await model.fetchPledges('1');

        expect(model.allPledges.length, 2);
        expect(model.userPledges.length, 1);
        expect(model.isFetchingPledges, false);
        verify(
          mockFundService.getPledgesByCampaign(
            '1',
            orderBy: 'endDate_DESC',
          ),
        ).called(1);
      });

      test('Test createPledge success', () async {
        final mockFundService = locator<FundService>();
        final pledgeData = {'amount': 100, 'campaignId': '1'};
        model.parentcampaignId = '1';

        when(mockFundService.createPledge(pledgeData)).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {'createPledge': pledgeData},
            source: QueryResultSource.network,
          ),
        );

        await model.createPledge(pledgeData);

        verify(mockFundService.createPledge(pledgeData)).called(1);
        verify(
          mockFundService.getPledgesByCampaign(
            '1',
            orderBy: 'endDate_DESC',
          ),
        ).called(1);
      });

      test('Test updatePledge success', () async {
        final mockFundService = locator<FundService>();
        final pledgeData = {'id': '1', 'amount': 200};
        model.parentcampaignId = '1';

        when(mockFundService.updatePledge(pledgeData)).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {'updatePledge': pledgeData},
            source: QueryResultSource.network,
          ),
        );

        await model.updatePledge(pledgeData);

        verify(mockFundService.updatePledge(pledgeData)).called(1);
        verify(
          mockFundService.getPledgesByCampaign(
            '1',
            orderBy: 'endDate_DESC',
          ),
        ).called(1);
      });

      test('Test deletePledge success', () async {
        final mockFundService = locator<FundService>();
        model.parentcampaignId = '1';

        when(mockFundService.deletePledge('1')).thenAnswer(
          (_) async => QueryResult(
            options: QueryOptions(document: gql('')),
            data: {
              'deletePledge': {'id': '1'},
            },
            source: QueryResultSource.network,
          ),
        );

        await model.deletePledge('1', '1');

        verify(mockFundService.deletePledge('1')).called(1);
        verify(
          mockFundService.getPledgesByCampaign(
            '1',
            orderBy: 'endDate_DESC',
          ),
        ).called(1);
      });

      test('Test searchPledgers filters correctly', () async {
        final mockFundService = locator<FundService>();
        final mockPledges = [
          Pledge(
            id: '1',
            pledgers: [User(id: userConfig.currentUser.id, firstName: 'John')],
          ),
          Pledge(
            id: '2',
            pledgers: [User(id: userConfig.currentUser.id, firstName: 'Jane')],
          ),
        ];

        when(mockFundService.getPledgesByCampaign('1', orderBy: 'endDate_DESC'))
            .thenAnswer((_) async => mockPledges);

        await model.fetchPledges('1');
        model.searchPledgers('john');

        expect(model.filteredPledges.length, 1);
        expect(model.filteredPledges[0].pledgers![0].firstName, 'John');
      });
    });

    test('Test getCurrentOrgUsersList success', () async {
      final mockUsers = [
        User(id: '1', firstName: 'John'),
        User(id: '2', firstName: 'Jane'),
      ];

      when(organizationService.getOrgMembersList(userConfig.currentOrg.id!))
          .thenAnswer((_) async => mockUsers);

      await model.getCurrentOrgUsersList();

      expect(model.orgMembersList.length, 2);
      verify(organizationService.getOrgMembersList(userConfig.currentOrg.id!))
          .called(1);
    });

    test('Test selectFund triggers campaign fetch', () async {
      final mockFundService = locator<FundService>();

      when(mockFundService.getCampaigns('1', orderBy: 'endDate_DESC'))
          .thenAnswer((_) async => []);

      model.selectFund('1');

      verify(mockFundService.getCampaigns('1', orderBy: 'endDate_DESC'))
          .called(1);
    });

    test('Test selectCampaign triggers pledge fetch', () async {
      final mockFundService = locator<FundService>();

      when(mockFundService.getPledgesByCampaign('1', orderBy: 'endDate_DESC'))
          .thenAnswer((_) async => []);

      model.selectCampaign('1');

      verify(mockFundService.getPledgesByCampaign('1', orderBy: 'endDate_DESC'))
          .called(1);
    });
  });
}

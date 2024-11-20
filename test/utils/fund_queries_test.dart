import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/fund_queries.dart';

void main() {
  group("Tests for FundQueries", () {
    test("Check if fetchOrgFunds works correctly", () {
      const data = '''
      query FundsByOrganization(
       \$orgId: ID!
       \$filter: String
       \$orderBy: FundOrderByInput
      ) {
      fundsByOrganization(
      organizationId: \$orgId
      where: { name_contains: \$filter }
      orderBy: \$orderBy
      ) {
        _id
        name
        refrenceNumber
        taxDeductible
        isDefault
        isArchived
        createdAt
        organizationId
        creator {
          _id
          firstName
          lastName
        }
      }
    }
    ''';
      final fnData = FundQueries().fetchOrgFunds();
      expect(fnData, data);
    });

    test("Check if fetchCampaignsByFund works correctly", () {
      const data = '''
      query GetFundById(
    \$fundId: ID!
    \$where: CampaignWhereInput
    \$orderBy: CampaignOrderByInput
  ) {
    getFundById(id: \$fundId, where: \$where, orderBy: \$orderBy) {
      campaigns {
        _id
        endDate
        fundingGoal
        name
        startDate
        currency
      }
    }
  }
    ''';
      final fnData = FundQueries().fetchCampaignsByFund();
      expect(fnData, data);
    });

    test("Check if fetchPledgesByCampaign works correctly", () {
      const data = '''
      query GetFundraisingCampaigns(
       \$where: CampaignWhereInput
       \$pledgeOrderBy: PledgeOrderByInput
      ) {
      getFundraisingCampaigns(where: \$where, pledgeOrderBy: \$pledgeOrderBy) {
       name
       fundingGoal
       currency
       startDate
       endDate
       pledges {
        _id
        amount
        currency
        endDate
        startDate
        users {
          _id
          firstName
          lastName
          image
        }
      }
    }
  }
    ''';
      final fnData = FundQueries().fetchPledgesByCampaign();
      expect(fnData, data);
    });

    test("Check if fetchUserCampaigns works correctly", () {
      const data = '''
      query GetFundraisingCampaigns(
    \$where: CampaignWhereInput
    \$campaignOrderBy: CampaignOrderByInput
  ) {
    getFundraisingCampaigns(where: \$where, campaignOrderby: \$campaignOrderBy) {
      _id
      startDate
      endDate
      name
      fundingGoal
      currency
    }
  }
    ''';
      final fnData = FundQueries().fetchUserCampaigns();
      expect(fnData, data);
    });

    test("Check if fetchUserPledges works correctly", () {
      const data = '''
      query GetPledgesByUserId(
    \$userId: ID!
    \$where: PledgeWhereInput
    \$orderBy: PledgeOrderByInput
  ) {
    getPledgesByUserId(userId: \$userId, where: \$where, orderBy: \$orderBy) {
      _id
      amount
      startDate
      endDate
      campaign {
        _id
        name
        endDate
      }
      currency
      users {
        _id
        firstName
        lastName
        image
      }
    }
  }
    ''';
      final fnData = FundQueries().fetchUserPledges();
      expect(fnData, data);
    });

    test("Check if createPledge works correctly", () {
      const data = '''
      mutation CreateFundraisingCampaignPledge(
        \$campaignId: ID!
        \$amount: Float!
        \$currency: Currency!
        \$startDate: Date!
        \$endDate: Date!
        \$userIds: [ID!]!
      ) {
        createFundraisingCampaignPledge(
          data: {
            campaignId: \$campaignId
            amount: \$amount
            currency: \$currency
            startDate: \$startDate
            endDate: \$endDate
            userIds: \$userIds
          }
        ) {
          _id
        }
      }
    ''';
      final fnData = FundQueries().createPledge();
      expect(fnData, data);
    });

    test("Check if updatePledge works correctly", () {
      const data = '''
      mutation UpdateFundraisingCampaignPledge(
        \$id: ID!
        \$amount: Float
        \$currency: Currency
        \$startDate: Date
        \$endDate: Date
        \$users: [ID!]
      ) {
        updateFundraisingCampaignPledge(
          id: \$id
          data: {
            users: \$users
            amount: \$amount
            currency: \$currency
            startDate: \$startDate
            endDate: \$endDate
          }
        ) {
          _id
          
        }
      }
    ''';
      final fnData = FundQueries().updatePledge();
      expect(fnData, data);
    });

    test("Check if deletePledge works correctly", () {
      const data = '''
      mutation DeleteFundraisingCampaignPledge(\$id: ID!) {
        removeFundraisingCampaignPledge(id: \$id) {
          _id
        }
      }
    ''';
      final fnData = FundQueries().deletePledge();
      expect(fnData, data);
    });
  });
}

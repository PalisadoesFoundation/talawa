/// This class contains the required mutations and queries for funds.
class FundQueries {
  /// Fetches funds by organization ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch funds associated with the specified organization ID.
  String fetchOrgFunds() {
    return '''
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
  }

  /// Fetches campaigns by fund ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch campaigns associated with the specified fund ID.
  String fetchCampaignsByFund() {
    return '''
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
  }

  /// Fetches pledges by campaign ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch pledges associated with the specified campaign ID.
  String fetchPledgesByCampaign() {
    return '''
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
  }

  /// Fetches user campaigns.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch campaigns associated with the user.
  String fetchUserCampaigns() {
    return '''
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
  }

  /// Fetches pledges by user ID.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL query string to fetch pledges associated with the specified user ID.
  String fetchUserPledges() {
    return '''
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
  }

  /// Mutation to create a pledge.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to create a pledge.
  String createPledge() {
    return '''
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
  }

  /// Mutation to update a pledge.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to update a pledge.
  String updatePledge() {
    return '''
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
  }

  /// Mutation to delete a pledge.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns a GraphQL mutation string to delete a pledge.
  String deletePledge() {
    return '''
      mutation DeleteFundraisingCampaignPledge(\$id: ID!) {
        removeFundraisingCampaignPledge(id: \$id) {
          _id
        }
      }
    ''';
  }
}

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
       \$orgId: String!
       \$first: Int
       \$last: Int
       \$after: String
       \$before: String
      ) {
        organization(input: { id: \$orgId }) {
          funds(first: \$first, last: \$last, after: \$after, before: \$before) {
            edges {
              node {
                id
                name
                isTaxDeductible
                createdAt
                updatedAt
                creator {
                  id
                  name
                }
              }
              cursor
            }
            pageInfo {
              endCursor
              hasNextPage
              hasPreviousPage
              startCursor
            }
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
      query GetCampaignsByFund(
        \$fundId: String!
        \$first: Int
        \$last: Int
        \$after: String
        \$before: String
      ) {
        fund(input: { id: \$fundId }) {
          campaigns(first: \$first, last: \$last, after: \$after, before: \$before) {
            edges {
              node {
                id
                name
                startAt
                endAt
                currencyCode
                goalAmount
                pledgedAmount
                fund {
                  id
                }
              }
              cursor
            }
            pageInfo {
              endCursor
              hasNextPage
              hasPreviousPage
              startCursor
            }
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
      query FundCampaignPledges(
        \$id: String!
        \$first: Int
        \$last: Int
        \$after: String
        \$before: String
      ) {
        fundCampaign(input: { id: \$id }) {
          pledges(
            first: \$first
            last: \$last
            after: \$after
            before: \$before
          ) {
            edges {
              node {
                id
                amount
                note
                pledger {
                  id
                  name
                  avatarURL
                }
                campaign {
                  id
                  startAt
                  endAt
                  currencyCode
                }
              }
              cursor
            }
            pageInfo {
              hasNextPage
              hasPreviousPage
              endCursor
              startCursor
            }
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
        \$pledgerId: ID!
      ) {
        createFundraisingCampaignPledge(
          data: {
            campaignId: \$campaignId
            amount: \$amount
            currency: \$currency
            startDate: \$startDate
            endDate: \$endDate
            pledgerId: \$pledgerId
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
        \$pledgerId: ID
      ) {
        updateFundraisingCampaignPledge(
          id: \$id
          data: {
            pledgerId: \$pledgerId
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

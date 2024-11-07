import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/fund_queries.dart';

/// FundService class provides different services in the context of Funds, Campaigns, and Pledges.
class FundService {
  FundService() {
    _currentOrg = _userConfig.currentOrg;
    _fundQueries = FundQueries();
  }

  // variables declaration
  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();
  late FundQueries _fundQueries;

  late OrgInfo _currentOrg;

  /// This function is used to fetch all funds of the organization.
  ///
  /// **params**:
  /// * `orderBy`: This variable decides the sorting opton.
  ///
  /// **returns**:
  /// * `Future<List<Fund>>`: List of funds associated with the organization.
  Future<List<Fund>> getFunds({String orderBy = 'createdAt_DESC'}) async {
    try {
      final String currentOrgID = _currentOrg.id!;
      final result = await _dbFunctions.gqlAuthQuery(
        _fundQueries.fetchOrgFunds(),
        variables: {
          'orgId': currentOrgID,
          'filter': '',
          'orderBy': orderBy,
        },
      );

      if (result.data == null) {
        throw Exception('Unable to fetch funds');
      }

      final fundsJson = result.data!['fundsByOrganization'] as List<dynamic>;
      final funds = fundsJson.map((fundData) {
        if (fundData is Map<String, dynamic>) {
          return Fund.fromJson(fundData);
        } else {
          throw Exception('Invalid fund data format');
        }
      }).toList();

      return funds;
    } catch (e) {
      print('Error fetching funss: $e');
      throw Exception('Failed to load Funds');
    }
  }

  /// This function is used to fetch all campaigns of a fund.
  ///
  /// **params**:
  /// * `fundId`: id of a fund.
  /// * `orderBy`: This variable decides the sorting opton.
  ///
  /// **returns**:
  /// * `Future<List<Campaign>>`: List of campaigns associated with the fund.
  Future<List<Campaign>> getCampaigns(
    String fundId, {
    String orderBy = 'endDate_DESC',
  }) async {
    try {
      final QueryResult result = await _dbFunctions.gqlAuthQuery(
        _fundQueries.fetchCampaignsByFund(),
        variables: {
          'fundId': fundId,
          'where': {
            'fundId': fundId,
          },
          'pledgeOrderBy': orderBy,
        },
      );

      if (result.data == null) {
        throw Exception('Unable to fetch campaigns');
      }

      final campaignsJson = (result.data!['getFundById']
          as Map<String, dynamic>)['campaigns'] as List<dynamic>;
      final campaigns = campaignsJson.map((campaignData) {
        if (campaignData is Map<String, dynamic>) {
          return Campaign.fromJson(campaignData);
        } else {
          throw Exception('Invalid campaign data format');
        }
      }).toList();

      return campaigns;
    } catch (e) {
      print('Error fetching campaigns: $e');
      throw Exception('Failed to load campaigns');
    }
  }

  /// This function is used to fetch all pledges of a campaign.
  ///
  /// **params**:
  /// * `campaignId`: id of a campaign.
  /// * `orderBy`: This variable decides the sorting opton.
  ///
  /// **returns**:
  /// * `Future<List<Pledge>>`: List of pledges associated with the campaign.
  Future<List<Pledge>> getPledgesByCampaign(
    String campaignId, {
    String orderBy = 'endDate_DESC',
  }) async {
    try {
      final QueryResult result = await _dbFunctions.gqlAuthQuery(
        _fundQueries.fetchPledgesByCampaign(),
        variables: {
          'where': {
            'id': campaignId,
          },
          'pledgeOrderBy': orderBy,
        },
      );

      if (result.data == null) {
        throw Exception('Unable to fetch pledges');
      }

      final campaigns =
          (result.data!['getFundraisingCampaigns'] as List<dynamic>)
              .cast<Map<String, dynamic>>();
      final pledgesJson = (campaigns[0]['pledges'] as List<dynamic>)
          .cast<Map<String, dynamic>>();

      final pledges = pledgesJson.map((pledgeData) {
        return Pledge.fromJson(pledgeData);
      }).toList();
      return pledges;
    } catch (e) {
      print('Error fetching pledges: $e');
      throw Exception('Failed to load pledges');
    }
  }

  /// This function is used to create a new pledge.
  ///
  /// **params**:
  /// * `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: which contains the result of the GraphQL mutation.
  Future<QueryResult<Object?>> createPledge(
    Map<String, dynamic> variables,
  ) async {
    try {
      final result = await _dbFunctions.gqlAuthMutation(
        _fundQueries.createPledge(),
        variables: variables,
      );
      return result;
    } catch (e) {
      print(e);
      throw Exception('Failed to load pledges');
    }
  }

  /// This function is used to update an existing pledge.
  ///
  /// **params**:
  /// * `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: which contains the result of the GraphQL mutation.
  Future<QueryResult<Object?>> updatePledge(
    Map<String, dynamic> variables,
  ) async {
    try {
      final result = await _dbFunctions.gqlAuthMutation(
        _fundQueries.updatePledge(),
        variables: variables,
      );
      return result;
    } catch (e) {
      print(e);
      throw Exception('Failed to load pledges');
    }
  }

  /// This function is used to delete a pledge.
  ///
  /// **params**:
  /// * `pledgeId`: id of the pledge to be deleted.
  ///
  /// **returns**:
  /// * `Future<QueryResult<Object?>>`: which contains the result of the GraphQL mutation.
  Future<QueryResult<Object?>> deletePledge(String pledgeId) async {
    try {
      final result = await _dbFunctions.gqlAuthMutation(
        _fundQueries.deletePledge(),
        variables: {
          'id': pledgeId,
        },
      );
      return result;
    } catch (e) {
      print(e);
      throw Exception('Failed to load pledges');
    }
  }
}

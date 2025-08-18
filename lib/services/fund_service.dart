import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/page_info/page_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/fund_queries.dart';
import 'package:talawa/utils/pair.dart';

/// FundService class provides different services in the context of Funds, Campaigns, and Pledges.
class FundService {
  FundService() {
    _fundQueries = FundQueries();
  }

  // variables declaration
  final _userConfig = locator<UserConfig>();
  final _dbFunctions = locator<DataBaseMutationFunctions>();
  late FundQueries _fundQueries;

  /// This function is used to fetch all funds of the organization.
  ///
  /// **params**:
  /// * `first`: Number of funds to fetch from the beginning (pagination).
  /// * `last`: Number of funds to fetch from the end (pagination).
  /// * `after`: Cursor for pagination (fetch records after this cursor).
  /// * `before`: Cursor for pagination (fetch records before this cursor).
  ///
  /// **returns**:
  /// * `Future<Pair<List<Fund>, PageInfo>>`: A pair containing the list of funds and pagination info.
  Future<Pair<List<Fund>, PageInfo>> getFunds({
    int? first = 10,
    int? last,
    String? after,
    String? before,
  }) async {
    try {
      final String currentOrgID = _userConfig.currentOrg.id!;

      // Validate organization ID
      if (currentOrgID.isEmpty) {
        throw Exception('Organization ID is empty');
      }

      final variables = {
        'orgId': currentOrgID,
        'first': first,
        'last': last,
        'after': after,
        'before': before,
      };

      final result = await _dbFunctions.gqlAuthQuery(
        _fundQueries.fetchOrgFunds(),
        variables: variables,
      );

      if (result.data == null) {
        if (result.exception != null) {
          throw Exception('GraphQL Error: ${result.exception}');
        }
        throw Exception('Unable to fetch funds - null data received');
      }

      final organizationData =
          result.data!['organization'] as Map<String, dynamic>;
      final fundsData = organizationData['funds'] as Map<String, dynamic>;

      final edges = fundsData['edges'] as List<dynamic>;
      final pageInfoData = fundsData['pageInfo'] as Map<String, dynamic>;

      final funds = edges.map((edge) {
        final edgeMap = edge as Map<String, dynamic>;
        final nodeData = edgeMap['node'] as Map<String, dynamic>;
        return Fund.fromJson(nodeData);
      }).toList();

      // Create PageInfo from the response
      final pageInfo = PageInfo.fromJson(pageInfoData);

      // Extract the cursor from the last edge and update endCursor if available
      if (edges.isNotEmpty) {
        final lastEdge = edges.last as Map<String, dynamic>;
        final lastEdgeCursor = lastEdge['cursor'] as String?;

        if (lastEdgeCursor != null && lastEdgeCursor.isNotEmpty) {
          pageInfo.endCursor = lastEdgeCursor;
        }
      }
      return Pair(funds, pageInfo);
    } catch (e) {
      throw Exception('Failed to load Funds');
    }
  }

  /// This function is used to fetch all campaigns of a fund.
  ///
  /// **params**:
  /// * `fundId`: id of a fund.
  /// * `first`: Number of campaigns to fetch from the beginning (pagination).
  /// * `last`: Number of campaigns to fetch from the end (pagination).
  /// * `after`: Cursor for pagination (fetch records after this cursor).
  /// * `before`: Cursor for pagination (fetch records before this cursor).
  ///
  /// **returns**:
  /// * `Future<Pair<List<Campaign>, PageInfo>>`: A pair containing the list of campaigns and pagination info.
  Future<Pair<List<Campaign>, PageInfo>> getCampaigns(
    String fundId, {
    int? first = 10,
    int? last,
    String? after,
    String? before,
  }) async {
    try {
      final variables = <String, dynamic>{
        'fundId': fundId,
        'first': first,
        'last': last,
        'after': after,
        'before': before,
      };

      final result = await _dbFunctions.gqlAuthQuery(
        _fundQueries.fetchCampaignsByFund(),
        variables: variables,
      );

      if (result.data == null) {
        if (result.exception != null) {
          throw Exception('GraphQL Error: ${result.exception}');
        }
        throw Exception('Unable to fetch campaigns - null data received');
      }

      final fundData = result.data!['fund'] as Map<String, dynamic>;
      final campaignsData = fundData['campaigns'] as Map<String, dynamic>;

      final edges = campaignsData['edges'] as List<dynamic>;
      final pageInfoData = campaignsData['pageInfo'] as Map<String, dynamic>;
      final campaigns = edges.map((edge) {
        final edgeMap = edge as Map<String, dynamic>;
        final nodeData = edgeMap['node'] as Map<String, dynamic>;
        return Campaign.fromJson(nodeData);
      }).toList();

      // Create PageInfo from the response
      final pageInfo = PageInfo.fromJson(pageInfoData);

      // Extract the cursor from the last edge and update endCursor if available
      if (edges.isNotEmpty) {
        final lastEdge = edges.last as Map<String, dynamic>;
        final lastEdgeCursor = lastEdge['cursor'] as String?;

        if (lastEdgeCursor != null && lastEdgeCursor.isNotEmpty) {
          // Update the endCursor with the last edge's cursor
          pageInfo.endCursor = lastEdgeCursor;
        }
      }
      return Pair(campaigns, pageInfo);
    } catch (e) {
      throw Exception('Failed to load campaigns');
    }
  }

  /// This function is used to fetch pledges by campaign ID.
  ///
  /// **params**:
  /// * `campaignId`: ID of the campaign to fetch pledges for.
  ///
  /// **returns**:
  /// * `Future<List<Pledge>>`: List of pledges.
  Future<List<Pledge>> getPledgesByCampaign(String campaignId) async {
    try {
      final QueryResult result = await _dbFunctions.gqlAuthQuery(
        _fundQueries.fetchPledgesByCampaign(),
        variables: {
          'campaignId': campaignId,
        },
      );

      if (result.data == null) {
        throw Exception('Unable to fetch pledges');
      }

      final pledgesList =
          result.data!['getMyPledgesForCampaign'] as List<dynamic>?;
      if (pledgesList == null) {
        throw Exception('Pledges data not found');
      }

      final pledges = pledgesList.map((pledgeData) {
        return Pledge.fromJson(pledgeData as Map<String, dynamic>);
      }).toList();

      return pledges;
    } catch (e) {
      throw Exception('Failed to load pledges: $e');
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
      throw Exception('Failed to create pledge');
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
      throw Exception('Failed to load pledges');
    }
  }
}

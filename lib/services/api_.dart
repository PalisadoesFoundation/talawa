import 'dart:convert';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/model/switch_org.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';

class API {
  final Queries _query = Queries();
  final GraphQLConfiguration _graphQLConfiguration = GraphQLConfiguration();
  final Preferences _pref = Preferences();

  Future<List<SwitchOrg>> fetchUserDetails() async {
    List<SwitchOrg> joinedOrgs;
    final String userID = await _pref.getUserId();
    final GraphQLClient _client = _graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));

    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException && !result.loading) {
      print(result.data);
      joinedOrgs = (json.decode(
                  result.data['users'][0]['joinedOrganizations'].toString())
              as List)
          .map((joinedOrgs) =>
              SwitchOrg.fromJson(joinedOrgs as Map<String, dynamic>))
          .toList();
      print(joinedOrgs);
    }

    return joinedOrgs;
  }
}

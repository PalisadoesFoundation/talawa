import 'dart:convert';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/model/switch_org.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';

class API {
  Queries _query = Queries();
  GraphQLConfiguration _graphQLConfiguration = GraphQLConfiguration();
  Preferences _pref = Preferences();

  Future<List<SwitchOrg>> fetchUserDetails() async {
    var joinedOrgs = List<SwitchOrg>();
    final String userID = await _pref.getUserId();
    GraphQLClient _client = _graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));

    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException && !result.loading) {
      print(result.data);
      joinedOrgs =
          (json.decode(result.data['users'][0]['joinedOrganizations']) as List)
              .map((joinedOrgs) => new SwitchOrg.fromJson(joinedOrgs))
              .toList();
      print(joinedOrgs);
    }

    return joinedOrgs;
  }
}

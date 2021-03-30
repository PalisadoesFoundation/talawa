import 'dart:convert';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/model/switch_org.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';

class API {
  final Queries _query = Queries();
  final GraphQLConfiguration _graphQLConfiguration = GraphQLConfiguration();
  final Preferences _pref = Preferences();

  Future<List<SwitchOrg>> fetchUserDetails() async {
    var joinedOrgs = <SwitchOrg>[];
    final userID = await _pref.getUserId();
    var _client = _graphQLConfiguration.clientToQuery();

    var result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchUserInfo), variables: {'id': userID}));

    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException && !result.loading) {
      print(result.data);
      joinedOrgs =
          (json.decode(result.data['users'][0]['joinedOrganizations']) as List)
              .map((joinedOrgs) => SwitchOrg.fromJson(joinedOrgs))
              .toList();
      print(joinedOrgs);
    }

    return joinedOrgs;
  }
}

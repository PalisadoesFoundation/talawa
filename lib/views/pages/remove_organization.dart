import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';

class RemoveOrganization extends StatefulWidget {
  @override
  _RemoveOrganizationState createState() => _RemoveOrganizationState();
}

class _RemoveOrganizationState extends State<RemoveOrganization> {

  Preferences preferences = Preferences();

  Queries _query = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  FToast fToast;
  

  @override
  void initState() {
    super.initState();
     removeOrg();
  }

   Future removeOrg() async {

    final String orgId = await preferences.getCurrentOrgId();

   GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(_query.fetchOrgById(orgId))));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      print(result.data['organizations'][0]['name']);
      setState(() {
       // userOrg = result.data['users'][0]['joinedOrganizations'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Remove Organization'),
        ),
        body: Container(
          child: Column(children: <Widget>[

          ])
        )
   );
  }
}
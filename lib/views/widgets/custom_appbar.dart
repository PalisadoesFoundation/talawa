import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/Queries.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  CustomAppBar(
    this.title, {
    Key key,
  })  : preferredSize = Size.fromHeight(55.0),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Queries _query = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Preferences preferences = Preferences();
  String _imgSrc;

  @override
  void initState() {
    super.initState();
    getImg();
  }

  Future getImg() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    String orgId = await preferences.getCurrentOrgId();

    QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchOrgById(orgId))));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      // print(result.data);
      setState(() {
        _imgSrc = result.data['organizations'][0]['image'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.white),
      ),
      leading: _imgSrc != null
          ? Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                        _imgSrc),
              ))
          : Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/team.png")),
            ),
    );
  }
}

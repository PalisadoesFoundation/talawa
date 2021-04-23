//flutter package imported here
import 'package:flutter/material.dart';

//imported the pages here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';

//We are currently adding the app bar here

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  CustomAppBar(
    this.title, {
    Key key,
  })  : preferredSize = const Size.fromHeight(55.0),
        super(key: key);

  final String title;

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final Queries _query = Queries();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Preferences preferences = Preferences();
  String _imgSrc;

  @override
  void initState() {
    super.initState();
    getImg();
  }

  Future getImg() async {
    //this function gets the image from the graphql query
    final GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final String orgId = await preferences.getCurrentOrgId();

    final QueryResult result = await _client
        .query(QueryOptions(documentNode: gql(_query.fetchOrgById(orgId))));
    if (result.hasException) {
      print(result.exception);
    } else if (!result.hasException) {
      // print(result.data);
      setState(() {
        _imgSrc = result.data['organizations'][0]['image'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
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
          : const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/team.png")),
            ),
    );
  }
}

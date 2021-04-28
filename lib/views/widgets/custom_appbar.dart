//flutter package imported here
import 'package:flutter/material.dart';

//imported the pages here
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/queries_.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';

//We are currently adding the app bar here

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  CustomAppBar(
    this.title, {
    this.isTest = false,
    Key key,
  })  : preferredSize = const Size.fromHeight(55.0),
        super(key: key);

  final String title;
  final bool isTest;

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
      final res = result.data['organizations'][0]['image'];
      if (res == null) {
        _imgSrc = null;
      } else {
        _imgSrc = res.toString();
      }
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      ),
      leading: FutureBuilder(
        future: getImg(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.all(
                  widget.isTest ? 2 : SizeConfig.safeBlockHorizontal),
              child: CircleAvatar(
                radius: widget.isTest ? 10 : SizeConfig.safeBlockVertical * 5,
              ),
            );
          } else {
            return _imgSrc != null
                ? Padding(
                    padding: EdgeInsets.all(
                        widget.isTest ? 2 : SizeConfig.safeBlockHorizontal),
                    child: CircleAvatar(
                      radius:
                          widget.isTest ? 10 : SizeConfig.safeBlockVertical * 5,
                      backgroundImage: NetworkImage(
                          Provider.of<GraphQLConfiguration>(context)
                                  .displayImgRoute +
                              _imgSrc),
                    ))
                : Padding(
                    padding: EdgeInsets.all(
                        widget.isTest ? 2 : SizeConfig.safeBlockHorizontal),
                    child: CircleAvatar(
                        radius: widget.isTest
                            ? 10
                            : SizeConfig.safeBlockVertical * 5,
                        backgroundImage:
                            const AssetImage("assets/images/team.png")),
                  );
          }
        },
      ),
    );
  }
}

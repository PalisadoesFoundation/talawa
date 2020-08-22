import 'package:flutter/material.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String imgSrc;

  @override
  final Size preferredSize;

  CustomAppBar(
    this.title,
    this.imgSrc, {
    Key key,
  })  : preferredSize = Size.fromHeight(55.0),
        super(key: key);

  String displayImgRoute = GraphQLConfiguration.displayImgRoute;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      leading: imgSrc != null
          ? Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(displayImgRoute + imgSrc)),
            )
          : Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/team.png")),
            ),
    );
  }
}

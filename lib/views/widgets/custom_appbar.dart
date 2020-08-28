import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/utils/globals.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String _imgSrc;

  @override
  final Size preferredSize;

  CustomAppBar(
    this.title,
    this._imgSrc, {
    Key key,
  })  : preferredSize = Size.fromHeight(55.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      leading: _imgSrc != 'null'
          ? Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(displayImgRoute + _imgSrc),
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

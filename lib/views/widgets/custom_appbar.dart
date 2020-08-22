import 'package:flutter/material.dart';
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
  Preferences preferences = Preferences();
  String _imgSrc;

  initState() {
    super.initState();
    getImgSrc();
  }

  getImgSrc() async {
    final String imageSrc = await preferences.getCurrentOrgImgSrc();
    setState(() {
      _imgSrc = imageSrc;
    });
    print(_imgSrc);
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
                  backgroundImage: NetworkImage(displayImgRoute + _imgSrc)),
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

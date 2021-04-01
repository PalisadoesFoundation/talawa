//flutter package imported
import 'package:flutter/material.dart';

//pages are imported here
import 'package:talawa/utils/uidata.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: Container(
        width: 50,
      height: 50,
      child:  Image.asset('assets/images/talawaLogo-dark.png'),
      ),
      icon: Image.asset('assets/images/talawaLogo-dark.png'),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Collaborative",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}

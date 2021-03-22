//flutter package imported
import 'package:flutter/material.dart';

//pages are imported here
import 'package:talawa/utils/uidata.dart';

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      applicationIcon: const FlutterLogo(),
      icon: const FlutterLogo(),
      aboutBoxChildren: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "Collaborative",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}

//flutter package imported
import 'package:flutter/material.dart';
import 'package:talawa/utils/package_info.dart';

//pages are imported here
import 'package:talawa/utils/uidata.dart';

class MyAboutTile extends StatefulWidget {
  @override
  _MyAboutTileState createState() => _MyAboutTileState();
}

class _MyAboutTileState extends State<MyAboutTile> {
  Map<String, dynamic> packageInfo = {};
  @override
  void initState() {
    initPackageInfo();
    super.initState();
  }

  Future<void> initPackageInfo() async {
    packageInfo = await PackageDetails.getInfo();
    setState(() {});
    print(packageInfo);
  }

  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      // ignore: sized_box_for_whitespace
      applicationIcon: Container(
        width: 50,
        height: 50,
        child: Image.asset('assets/images/talawaLogo-dark.png'),
      ),
      icon: Image.asset('assets/images/talawaLogo-dark.png'),
      aboutBoxChildren: const <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Collaborative",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion:
          packageInfo != null ? packageInfo['version'].toString() : "Loading..",
      applicationLegalese: "Apache License 2.0",
    );
  }
}

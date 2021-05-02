//flutter package imported
import 'package:flutter/material.dart';
import 'package:talawa/utils/package_info.dart';
import 'package:talawa/utils/ui_scaling.dart';

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
        width: SizeConfig.safeBlockHorizontal * 12.5,
        height: SizeConfig.safeBlockVertical * 6.25,
        child: Image.asset('assets/images/talawaLogo-dark.png'),
      ),
      icon: Image.asset('assets/images/talawaLogo-dark.png'),
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: SizeConfig.safeBlockVertical * 1.25,
        ),
        const Text(
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

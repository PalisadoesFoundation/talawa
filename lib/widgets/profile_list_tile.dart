import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle})
      : super(key: key);
  final Widget icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 5,
      leading: SizedBox(height: SizeConfig.screenHeight! * 0.137, child: icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}

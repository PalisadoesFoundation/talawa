import 'package:flutter/material.dart';
import 'package:talawa/utils/ui_scaling.dart';

class CommonDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade300,
      height: SizeConfig.safeBlockVertical,
    );
  }
}

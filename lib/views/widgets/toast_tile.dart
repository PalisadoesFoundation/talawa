import 'package:flutter/material.dart';
import 'package:talawa/utils/ui_scaling.dart';

class ToastTile extends StatelessWidget {
  const ToastTile({this.success, this.msg});

  final bool success;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 6,
          vertical: SizeConfig.safeBlockVertical * 1.75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: success ? Colors.green : Colors.red,
      ),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(msg),
          ],
        ),
      ),
    );
  }
}

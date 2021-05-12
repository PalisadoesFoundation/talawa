import 'package:flutter/material.dart';
import 'package:talawa/utils/ui_scaling.dart';

//Curstom toast container with custom message and color.
Container toastContainer(String msg, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 5,
        vertical: SizeConfig.safeBlockVertical * 1.5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color,
    ),
    child: Text(
      msg,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

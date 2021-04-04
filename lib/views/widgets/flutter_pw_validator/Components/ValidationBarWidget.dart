import 'package:flutter/material.dart';
import 'package:talawa/views/widgets/flutter_pw_validator/Utilities/SizeConfig.dart';
//ValidationBarWidget that represent style of each one of them and shows under the TextField
class ValidationBarComponent extends StatelessWidget {
  final Color color;

  ValidationBarComponent({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Container(
        // width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.005),
        height: SizeConfig.width * 0.015,
        decoration: new BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.width))),
      ),
    );
  }
}

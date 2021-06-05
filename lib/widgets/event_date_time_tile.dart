import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

class DateTimeTile extends StatelessWidget {
  const DateTimeTile({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      height: SizeConfig.screenHeight! * 0.068,
      width: double.infinity,
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.083),
          child: child),
    );
  }
}

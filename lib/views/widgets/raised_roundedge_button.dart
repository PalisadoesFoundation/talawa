import 'package:flutter/material.dart';

import '../../size_config.dart';

class RaisedRoundedButton extends StatefulWidget {
  const RaisedRoundedButton(
      {required Key key,
      required this.buttonLabel,
      required this.backgroundColor,
      required this.textColor,
      required this.onTap,
      this.showArrow = false})
      : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final bool showArrow;
  final String buttonLabel;
  final Function onTap;

  @override
  _RaisedRoundedButtonState createState() => _RaisedRoundedButtonState();
}

class _RaisedRoundedButtonState extends State<RaisedRoundedButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          width: SizeConfig.screenWidth! * 0.94,
          height: SizeConfig.screenHeight! * 0.07,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.backgroundColor,
              boxShadow: [
                const BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4.0,
                  spreadRadius: 0,
                )
              ]),
          child: widget.showArrow
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.06,
                    ),
                    //Unused
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.transparent,
                    ),
                    const Spacer(),
                    Text(
                      widget.buttonLabel,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: widget.textColor),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: widget.textColor,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.06,
                    )
                  ],
                )
              : Text(
                  widget.buttonLabel,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: widget.textColor),
                ),
        ));
  }
}

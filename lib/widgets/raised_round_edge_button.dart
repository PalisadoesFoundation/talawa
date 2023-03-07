// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

/// This class returns a widget for a raised rounded button,
/// for example: login button in login screen.
class RaisedRoundedButton extends StatefulWidget {
  // variables
  const RaisedRoundedButton({
    required Key key,
    required this.buttonLabel,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.height,
    this.width,
    this.showArrow = false,
  }) : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final bool showArrow;
  final String buttonLabel;
  final Function() onTap;
  final double? height;
  final double? width;

  @override
  _RaisedRoundedButtonState createState() => _RaisedRoundedButtonState();
}

class _RaisedRoundedButtonState extends State<RaisedRoundedButton> {
  @override
  Widget build(BuildContext context) {
    // Gesture Detector in Flutter is used to detect the user's gestures on the application.
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: widget.width ?? SizeConfig.screenWidth! * 0.94,
        height: widget.height ?? SizeConfig.screenHeight! * 0.07,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).dividerColor,
              offset: const Offset(0, 1),
              blurRadius: 4.0,
              spreadRadius: 0,
            )
          ],
        ),
        // If the widget.showArrow is true then show Row wrapper else FittedBox wrapper.
        // By default it is false. The showArrow are true for some buttons like login & Sign up button in
        // Organization URL Screen.
        child: widget.showArrow
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //unused
                  const Expanded(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.buttonLabel,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: widget.textColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.arrow_forward,
                      color: widget.textColor,
                    ),
                  ),
                ],
              )
            : FittedBox(
                // FittedBox restricts its child widgets from growing its size beyond a certain limit
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    widget.buttonLabel,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: widget.textColor,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

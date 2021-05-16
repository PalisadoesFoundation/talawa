import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/utils/ui_scaling.dart';

//Here we are making the exception bar it will be called when user gets some exception

class ExceptionToast extends StatefulWidget {
  const ExceptionToast(this.msg);
  final String msg;

  @override
  _ExceptionToastState createState() => _ExceptionToastState();
}

class _ExceptionToastState extends State<ExceptionToast> {
  FToast fToast;

  @override
  // ignore: type_annotate_public_apis
  initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return _exceptionToast() as Widget;
  }

  _exceptionToast() {
    final Widget toast = Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 6,
          vertical: SizeConfig.safeBlockVertical * 1.75),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.msg,
            style: const TextStyle(fontSize: 15.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }
}

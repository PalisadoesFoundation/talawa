import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talawa/utils/ui_scaling.dart';

//Here we are making the Success bar it will be called when user gets some success

class SuccessToast extends StatefulWidget {
  const SuccessToast(this.msg);
  final String msg;

  @override
  _SuccessToastState createState() => _SuccessToastState();
}

class _SuccessToastState extends State<SuccessToast> {
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
    return _successToast() as Widget;
  }

  _successToast() {
    final Widget toast = Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 5,
          vertical: SizeConfig.safeBlockVertical * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.green,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.msg),
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

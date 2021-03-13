import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SuccessToast extends StatefulWidget {
  final String msg;

  SuccessToast(
    this.msg, {
    Key key,
  });

  @override
  _SuccessToastState createState() => _SuccessToastState();
}

class _SuccessToastState extends State<SuccessToast> {
  FToast fToast;

  initState() {
    super.initState();
    fToast = FToast(context);
  }

  @override
  Widget build(BuildContext context) {
    return _successToast();
  }

  _successToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
      toastDuration: Duration(seconds: 3),
    );
  }
}

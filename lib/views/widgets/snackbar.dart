import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//creating the snackbar here to be shown if any error is occurred

class SnackBarFactory extends StatelessWidget {
  const SnackBarFactory(this.msg);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(msg));
  }
}

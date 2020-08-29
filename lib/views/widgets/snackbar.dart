import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarFactory extends StatelessWidget {
  final String msg;

  SnackBarFactory(
    this.msg, {
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(msg));
  }
}

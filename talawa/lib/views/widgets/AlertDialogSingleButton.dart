import 'package:flutter/material.dart';

showAlertDialog(
    BuildContext context, String title, String message, String buttonLabel) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text(buttonLabel),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}

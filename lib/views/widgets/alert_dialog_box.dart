import 'package:flutter/material.dart';

class AlertBox extends StatefulWidget {
  final String message;
  final Function function;
  AlertBox({this.message,this.function});
  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key:Key('ALERT_DIALOG'),
      title: Text("Confirmation"),
      content: Text(
          widget.message),
      actions: [
        ElevatedButton(
          key: Key('Close'),
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          key:Key('Yes'),
          child: Text("Yes"),
          onPressed: () async {
            print('here');
            widget.function();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

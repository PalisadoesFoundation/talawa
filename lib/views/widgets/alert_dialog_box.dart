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
      title: Text('Confirmation'),
      content: Text(
          widget.message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
        ElevatedButton(
          onPressed: () async {
            print('here');
            widget.function();
            Navigator.pop(context);
          },
          child: Text('Yes'),
        )
      ],
    );
  }
}

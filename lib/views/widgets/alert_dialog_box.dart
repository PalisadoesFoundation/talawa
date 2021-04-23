import 'package:flutter/material.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({this.message, this.function});

  final String message;
  final Function function;

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirmation"),
      content: Text(widget.message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Close"),
        ),
        ElevatedButton(
          onPressed: () async {
            print('here');
            widget.function();
            Navigator.pop(context);
          },
          child: const Text("Yes"),
        )
      ],
    );
  }
}

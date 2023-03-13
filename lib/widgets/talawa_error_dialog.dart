import 'package:flutter/material.dart';

class TalawaErrorDialog extends StatelessWidget {
  const TalawaErrorDialog(this.errorMessage, {Key? key}) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        title: Text(
          "Error",
          style: TextStyle(color: Colors.red),
        ),
        content: SizedBox(
          width: 200,
          height: 75,
          child: Text(
            errorMessage,
            style: const TextStyle(fontSize: 20),
            maxLines: 3,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

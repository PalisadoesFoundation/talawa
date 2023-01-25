import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TalawaErrorDialog extends StatelessWidget {
  const TalawaErrorDialog(this.errorMessage, {Key? key}) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AlertDialog(
        title: const Text(
          "Error",
          style: TextStyle(color: Colors.red),
        ),
        content: SizedBox(
          width: 200,
          height: 75,
          child: AutoSizeText(
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

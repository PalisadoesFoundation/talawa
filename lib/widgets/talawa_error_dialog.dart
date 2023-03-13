import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/utils/app_localization.dart';

class TalawaErrorDialog extends StatelessWidget {
  const TalawaErrorDialog(
    this.errorMessage, {
    Key? key,
    required this.messageType,
  }) : super(key: key);
  final String errorMessage;
  final MessageType messageType;

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
          // Expanded(
          //   child:
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: messageType == MessageType.error
                  ? Colors.red
                  : messageType == MessageType.warning
                      ? Colors.red
                      : messageType == MessageType.info
                          ? Colors.black26
                          : Colors.red,
              foregroundColor: Colors.red,
            ),
            child: Text(
              messageType == MessageType.error
                  ? 'Dismiss'
                  : messageType == MessageType.warning
                      ? 'Dismiss'
                      : messageType == MessageType.info
                          ? 'Close'
                          : 'Dismiss',
              style: const TextStyle(color: Color.fromRGBO(202, 202, 202, 1)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // ),
        ],
      ),
    );
  }
}

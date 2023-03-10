// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';

import 'package:talawa/utils/app_localization.dart';

class TalawaErrorSnackBar extends StatelessWidget {
  const TalawaErrorSnackBar({
    Key? key,
    required this.errorMessage,
    required this.messageType,
  }) : super(key: key);
  final String errorMessage;
  final MessageType messageType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 80,
          decoration: BoxDecoration(
            color: messageType == MessageType.error
                ? Colors.red
                : messageType == MessageType.warning
                    ? Colors.yellow
                    : messageType == MessageType.info
                        ? Colors.green
                        : Colors.red,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          messageType == MessageType.error
              ? Icons.error
              : messageType == MessageType.warning
                  ? Icons.error
                  : messageType == MessageType.info
                      ? Icons.info_outline
                      : Icons.error,
          // Icons.error,
          color: messageType == MessageType.error
              ? Colors.red
              : messageType == MessageType.warning
                  ? Colors.yellow
                  : messageType == MessageType.info
                      ? Colors.green
                      : Colors.red,
          size: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              AppLocalizations.of(context)!.strictTranslate(errorMessage),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

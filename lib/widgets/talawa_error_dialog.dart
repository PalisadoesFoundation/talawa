// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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
        content: SizedBox(
          width: 200,
          height: 135,
          child: Column(
            children: [
              SvgPicture.asset(
                messageType == MessageType.error
                    ? 'assets/images/Vector.svg'
                    : messageType == MessageType.warning
                        ? 'assets/images/Vector.svg'
                        : messageType == MessageType.info
                            ? 'assets/icons/Info.svg'
                            : 'assets/images/Vector.svg',
                colorFilter: ColorFilter.mode(
                  messageType == MessageType.error
                      ? Colors.red
                      : messageType == MessageType.warning
                          ? Colors.yellow
                          : messageType == MessageType.info
                              ? Colors.green
                              : Colors.red,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                messageType == MessageType.error
                    ? AppLocalizations.of(context)!.strictTranslate('Error')
                    : messageType == MessageType.warning
                        ? AppLocalizations.of(context)!
                            .strictTranslate('Warning')
                        : messageType == MessageType.info
                            ? AppLocalizations.of(context)!
                                .strictTranslate('Information')
                            : AppLocalizations.of(context)!
                                .strictTranslate('Error'),
                style: TextStyle(
                  color: messageType == MessageType.error
                      ? Colors.red
                      : messageType == MessageType.warning
                          ? Colors.yellow
                          : messageType == MessageType.info
                              ? Colors.green
                              : Colors.red,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              AutoSizeText(
                AppLocalizations.of(context)!.strictTranslate(errorMessage),
                style: const TextStyle(fontSize: 16),
                maxLines: 3,
              ),
              const SizedBox(
                height: 19,
              ),
            ],
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';

/// Common Error Dialog box for the whole talawa app.
class TalawaErrorDialog extends StatelessWidget {
  const TalawaErrorDialog(
    this.errorMessage, {
    super.key,
    required this.messageType,
  });

  /// error message for the talawaDialogBox.
  final String errorMessage;

  /// enum to what is the type of error message.
  final MessageType messageType;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.8, // Adjust the width based on screen size
      child: AlertDialog(
        content: SizedBox(
          width: SizeConfig.screenWidth! * 0.65,
          height: SizeConfig.screenWidth! * 0.38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  fontSize: screenWidth *
                      0.04, // Adjust the font size based on screen width
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: AutoSizeText(
                  AppLocalizations.of(context)!.strictTranslate(errorMessage),
                  style: const TextStyle(fontSize: 16),
                  maxLines: 3,
                ),
              ),
              const SizedBox(
                height: 19,
              ),
            ],
          ),
        ),
        actions: <Widget>[
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
        ],
      ),
    );
  }
}

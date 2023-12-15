import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';

import 'package:talawa/utils/app_localization.dart';

/// Common Error Snack Bar for the whole talawa app.
class TalawaErrorSnackBar extends StatelessWidget {
  const TalawaErrorSnackBar({
    super.key,
    required this.duration,
    required this.errorMessage,
    required this.messageType,
  });

  /// Duration the snack bar is visible.
  final Duration duration;

  /// error message for the talawa Snack Bar.
  final String errorMessage;

  /// enum for the type of error message.
  final MessageType messageType;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: duration,
        curve: Curves.linear,
      );
    });

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
            controller: scrollController,
            child: Text(
              AppLocalizations.of(context)!.strictTranslate(errorMessage),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

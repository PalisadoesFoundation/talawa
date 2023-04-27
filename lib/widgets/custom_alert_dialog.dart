// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

/// This Class returns CustomAlertDialog widget. Custom Alert Dialog is a popup
/// that appeared in the screen showing Alert message along with the event buttons.
/// This extends stateless widget that means it cannot change its state during the
/// runtime of a application.
class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    this.successText,
    this.dialogTitle,
    this.reverse = false,
    this.secondaryButtonText = 'Close',
    this.secondaryButtonTap,
    required this.success,
    required this.dialogSubTitle,
  }) : super(key: key);
  final bool reverse;
  final Function success;
  final Function? secondaryButtonTap;
  final String? successText;
  final String? dialogTitle;
  final String dialogSubTitle;
  final String secondaryButtonText;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      RaisedRoundedButton(
        key: const Key('Close'),
        onTap: () => secondaryButtonTap ?? navigationService.pop(),
        buttonLabel:
            AppLocalizations.of(context)!.strictTranslate(secondaryButtonText),
        textColor: Colors.white,
        backgroundColor: const Color(0xFF008A37),
        width: SizeConfig.screenWidth! * 0.2,
        height: SizeConfig.screenHeight! * 0.06,
      ),
      RaisedRoundedButton(
        key: Key(successText ?? 'Confirm'),
        onTap: () => success(),
        buttonLabel: successText ??
            AppLocalizations.of(context)!.strictTranslate('Confirm'),
        textColor: const Color(0xFF008A37),
        backgroundColor: Colors.white,
        width: SizeConfig.screenWidth! * 0.2,
        height: SizeConfig.screenHeight! * 0.06,
      )
    ];
    return AlertDialog(
      title: Text(
        dialogTitle ??
            AppLocalizations.of(context)!.strictTranslate('Confirmation'),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w800),
      ),
      content: Text(dialogSubTitle),
      buttonPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth! * 0.05,
        vertical: SizeConfig.screenHeight! * 0.05,
      ),
      actions: reverse ? actions.reversed.toList() : actions,
    );
  }
}

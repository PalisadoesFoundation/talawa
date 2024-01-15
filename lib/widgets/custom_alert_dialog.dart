import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

/// This Class returns CustomAlertDialog widget. Custom Alert Dialog is a popup.
///
/// that appeared in the screen showing Alert message along with the event buttons.
/// This extends stateless widget that means it cannot change its state during the
/// runtime of a application.
class CustomAlertDialog extends StatelessWidget {
  /// Constructs a [CustomAlertDialog] widget.
  ///
  /// [reverse] indicates whether the order of action buttons should be reversed.
  /// [success] is the function triggered upon tapping the primary action button.
  /// [secondaryButtonTap] is the function triggered upon tapping the secondary action button.
  /// [successText] is the text displayed on the primary action button.
  /// [dialogTitle] is the title displayed in the dialog (default value is 'Confirmation').
  /// [dialogSubTitle] is the subtitle or message content of the dialog.
  /// [secondaryButtonText] is the text displayed on the secondary action button (default value is 'Close').

  const CustomAlertDialog({
    super.key,
    this.successText,
    this.dialogTitle,
    this.reverse = false,
    this.secondaryButtonText = 'Close',
    this.secondaryButtonTap,
    required this.success,
    required this.dialogSubTitle,
  });

  /// Indicates whether the order of action buttons should be reversed.
  final bool reverse;

  /// Function triggered upon tapping the primary action button.
  final Function() success;

  /// Function triggered upon tapping the secondary action button.
  final Function()? secondaryButtonTap;

  /// Text displayed on the primary action button.
  final String? successText;

  /// Title displayed in the dialog (default value is 'Confirmation').
  final String? dialogTitle;

  /// Subtitle or message content of the dialog.
  final String dialogSubTitle;

  /// Text displayed on the secondary action button (default value is 'Close').
  final String secondaryButtonText;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      RaisedRoundedButton(
        key: const Key('Close'),
        onTap: () {
          secondaryButtonTap != null
              ? secondaryButtonTap!()
              : navigationService.pop();
        },
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
      ),
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
      content: Text(
        AppLocalizations.of(context)!.strictTranslate(dialogSubTitle),
      ),
      buttonPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth! * 0.05,
        vertical: SizeConfig.screenHeight! * 0.05,
      ),
      actions: reverse ? actions.reversed.toList() : actions,
    );
  }
}

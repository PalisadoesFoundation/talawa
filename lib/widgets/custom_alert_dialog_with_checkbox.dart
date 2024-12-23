import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

/// This Class returns CustomAlertDialogWithCheckbox widget . Custom Alert Dialog with check box is a popup.
///
/// that appeared in the screen showing Alert message along with the event buttons.
/// This extends stateful widget that means it cannot change its state during the
/// runtime of a application.
/// This has a check box which wil rewuire user input to change.
class CustomAlertDialogWithCheckbox extends StatefulWidget {
  const CustomAlertDialogWithCheckbox({
    super.key,
    this.successText = 'Confirm',
    this.dialogTitle = 'Confirmation',
    this.reverse = false,
    this.secondaryButtonText = 'Close',
    this.secondaryButtonTap,
    required this.success,
    required this.dialogSubTitle,
    required this.checkboxLabel,
    this.initialCheckboxValue = false,
    this.onCheckboxChanged,
  });

  /// Indicates whether the order of action buttons should be reversed.
  final bool reverse;

  /// Function triggered upon tapping the primary action button.
  final Function(bool?) success;

  /// Function triggered upon tapping the secondary action button.
  final Function()? secondaryButtonTap;

  /// Text displayed on the primary action button.
  final String successText;

  /// Title displayed in the dialog (default value is 'Confirmation').
  final String dialogTitle;

  /// Subtitle or message content of the dialog.
  final String dialogSubTitle;

  /// Text displayed on the secondary action button (default value is 'Close').
  final String secondaryButtonText;

  /// Label for the checkbox.
  final String checkboxLabel;

  /// Initial value for the checkbox.
  final bool initialCheckboxValue;

  /// Callback for checkbox value change.
  final ValueChanged<bool>? onCheckboxChanged;

  @override
  _CustomAlertDialogWithCheckboxState createState() =>
      _CustomAlertDialogWithCheckboxState();
}

class _CustomAlertDialogWithCheckboxState
    extends State<CustomAlertDialogWithCheckbox> {
  late bool _checkboxValue;

  @override
  void initState() {
    super.initState();
    _checkboxValue = widget.initialCheckboxValue;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      RaisedRoundedButton(
        key: Key(widget.secondaryButtonText),
        onTap: () {
          widget.secondaryButtonTap != null
              ? widget.secondaryButtonTap!()
              : navigationService.pop();
        },
        buttonLabel: AppLocalizations.of(context)!
            .strictTranslate(widget.secondaryButtonText),
        textColor: Colors.white,
        backgroundColor: const Color(0xFF008A37),
        width: SizeConfig.screenWidth! * 0.2,
        height: SizeConfig.screenHeight! * 0.06,
      ),
      RaisedRoundedButton(
        key: Key(widget.successText),
        onTap: () => widget.success(_checkboxValue),
        buttonLabel:
            AppLocalizations.of(context)!.strictTranslate(widget.successText),
        textColor: const Color(0xFF008A37),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        width: SizeConfig.screenWidth! * 0.2,
        height: SizeConfig.screenHeight! * 0.06,
      ),
    ];

    return AlertDialog(
      surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
      title: Text(
        AppLocalizations.of(context)!.strictTranslate(widget.dialogTitle),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w800),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!
                .strictTranslate(widget.dialogSubTitle),
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!
                    .strictTranslate(widget.checkboxLabel),
              ),
              Checkbox(
                value: _checkboxValue,
                onChanged: (bool? val) {
                  setState(() {
                    _checkboxValue = val!;
                  });
                  if (widget.onCheckboxChanged != null) {
                    widget.onCheckboxChanged?.call(_checkboxValue);
                  }
                },
              ),
            ],
          ),
        ],
      ),
      buttonPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth! * 0.05,
        vertical: SizeConfig.screenHeight! * 0.05,
      ),
      actions: widget.reverse ? actions.reversed.toList() : actions,
    );
  }
}

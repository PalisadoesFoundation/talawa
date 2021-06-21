import 'package:flutter/material.dart';
import 'package:talawa/services/app_localization.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({
    this.message,
    this.function,
  });

  final String message;
  final Function function;

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return AlertDialog(
      title: Text(
        AppLocalizations.of(context).translate("Confirmation"),
      ),
      content: Text(
        widget.message,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context).translate("Close"),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            debugPrint('here');
            widget.function();
            Navigator.pop(context);
          },
          child: Text(
            AppLocalizations.of(context).translate("Yes"),
          ),
        )
      ],
    );
  }
}

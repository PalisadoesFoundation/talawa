import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';

/// Dialog for showing recurrence options.
class ShowRecurrenceDialog extends StatefulWidget {
  const ShowRecurrenceDialog({super.key});

  @override
  State<ShowRecurrenceDialog> createState() => _ShowRecurrenceDialogState();
}

class _ShowRecurrenceDialogState extends State<ShowRecurrenceDialog> {
  static const List<String> _frequencies = [
    "Does not repeat",
    "Every day",
    "Every week",
    "Every month",
    "Every year",
    "Custom...",
  ];
  String _frequency = _frequencies[0];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            radioButton(_frequencies[0]),
            radioButton(_frequencies[1]),
            radioButton(_frequencies[2]),
            radioButton(_frequencies[3]),
            radioButton(_frequencies[4]),
            radioButton(_frequencies[5]),
          ],
        ),
      ),
    );
  }

  // custom radio list tile.
  RadioListTile<String> radioButton(
    String frequency,
  ) {
    return RadioListTile<String>(
      title: Text(frequency),
      value: frequency,
      groupValue: _frequency,
      onChanged: (value) {
        // navigate to custom recurrence page when pressed custom... button.
        if (value == _frequencies[5]) {
          navigationService.pushScreen(Routes.customRecurrencePage);
        }
        setState(() {
          _frequency = value!;
        });
      },
    );
  }
}

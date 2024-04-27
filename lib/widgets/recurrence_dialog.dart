import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

/// Dialog for showing recurrence options.
class ShowRecurrenceDialog extends StatefulWidget {
  const ShowRecurrenceDialog({
    super.key,
    required this.model,
    required this.initialRecurrence,
  });

  final CreateEventViewModel model;
  final String initialRecurrence;

  @override
  State<ShowRecurrenceDialog> createState() => _ShowRecurrenceDialogState();
}

class _ShowRecurrenceDialogState extends State<ShowRecurrenceDialog> {
  static const donotRepeat = "Does not repeat";
  static const dialy = "Every day";
  static const weekly = "Every week";
  static const monthly = "Every month";
  static const yearly = "Every year";
  static const custom = "Custom...";

  static const List<String> _frequencies = [
    donotRepeat,
    dialy,
    weekly,
    monthly,
    yearly,
    custom,
  ];

  late String _frequency;
  @override
  Widget build(BuildContext context) {
    _frequency = widget.initialRecurrence;
    print('widget built');
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
      onChanged: (value) async {
        // navigate to custom recurrence page when pressed custom... button.
        widget.model.recurrance = widget.model.getRecurrance(value!);
        if (value == _frequencies[5]) {
          await navigationService.pushScreen(
            Routes.customRecurrencePage,
            arguments: widget.model,
          );
        }
        setState(() {
          _frequency = value;
          Navigator.pop(context, _frequency);
        });
      },
    );
  }
}

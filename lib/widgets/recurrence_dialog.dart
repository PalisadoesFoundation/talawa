import 'package:flutter/material.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/base_event_view_model.dart';

/// Dialog for showing recurrence options.
class ShowRecurrenceDialog extends StatefulWidget {
  const ShowRecurrenceDialog({
    super.key,
    required this.model,
  });
  final BaseEventViewModel model;

  @override
  State<ShowRecurrenceDialog> createState() => _ShowRecurrenceDialogState();
}

class _ShowRecurrenceDialogState extends State<ShowRecurrenceDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            radioButtonFixText(
              "Does not repeat",
              (value) => updateModel(value!, false, null, null),
            ),
            radioButtonFixText(
              "Every day",
              (value) => updateModel(value!, true, Frequency.daily, null),
            ),
            radioButton(Frequency.weekly, 1, [
              days[widget.model.eventStartDate.weekday - 1],
            ]),
            radioButton(Frequency.monthly, 1, null),
            radioButton(Frequency.yearly, 1, null),
            radioButtonFixText(
              'Monday to Friday',
              (value) => updateModel(value!, true, Frequency.weekly, {
                WeekDays.monday,
                WeekDays.tuesday,
                WeekDays.wednesday,
                WeekDays.thursday,
                WeekDays.friday,
              }),
            ),
            radioButtonFixText("Custom...", (value) async {
              widget.model.isRecurring = true;
              await navigationService.pushScreen(
                Routes.customRecurrencePage,
                arguments: widget.model,
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Custom radio list tile for recurrence options.
  ///
  /// **params**:
  /// * `frequency`: Frequency of the event (DAILY, WEEKLY, MONTHLY, YEARLY)
  /// * `interval`: Interval between recurrences
  /// * `weekDays`: List of week days for weekly recurrence
  ///
  /// **returns**:
  /// * `RadioListTile<String>`: Radio list tile widget
  RadioListTile<String> radioButton(
    String frequency,
    int interval,
    List<String>? weekDays,
  ) {
    if (frequency == Frequency.weekly && weekDays != null) {
      final String daysText =
          weekDays.map((day) => day.substring(0, 3)).join(', ');
      final String text = 'Every $daysText';
      return RadioListTile<String>(
        title: Text(text),
        value: text,
        groupValue: widget.model.recurrenceLabel,
        onChanged: (value) => updateModel(
          value!,
          true,
          frequency,
          weekDays.toSet(),
        ),
      );
    } else if (Frequency.monthly == frequency) {
      final String text =
          'Every month on day ${widget.model.eventStartDate.day}';
      return RadioListTile<String>(
        title: Text(text),
        value: text,
        groupValue: widget.model.recurrenceLabel,
        onChanged: (value) => updateModel(
          value!,
          true,
          frequency,
          null,
        ),
      );
    } else if (Frequency.yearly == frequency) {
      final String text =
          'Every year on ${widget.model.eventStartDate.day} ${monthNames[widget.model.eventStartDate.month - 1]}';
      return RadioListTile<String>(
        title: Text(text),
        value: text,
        groupValue: widget.model.recurrenceLabel,
        onChanged: (value) => updateModel(
          value!,
          true,
          frequency,
          null,
        ),
      );
    } else {
      final String text = 'Every $frequency';
      return RadioListTile<String>(
        title: Text(text),
        value: text,
        groupValue: widget.model.recurrenceLabel,
        onChanged: (value) => updateModel(
          value!,
          true,
          frequency,
          null,
        ),
      );
    }
  }

  /// Custom radio list tile with fixed text.
  ///
  /// **params**:
  /// * `text`: Text to display
  /// * `onChanged`: Callback when selected
  ///
  /// **returns**:
  /// * `RadioListTile<String>`: Radio list tile widget
  RadioListTile<String> radioButtonFixText(
    String text,
    Function(String?)? onChanged,
  ) {
    return RadioListTile<String>(
      title: Text(text),
      value: text,
      groupValue: widget.model.recurrenceLabel,
      onChanged: (value) => onChanged?.call(value),
    );
  }

  /// Updates the model with selected recurrence options.
  ///
  /// **params**:
  /// * `value`: Text of the selected option
  /// * `isRecurring`: Whether event is recurring
  /// * `frequency`: Frequency type
  /// * `weekDays`: Set of week days
  /// * `count`: Number of occurrences (optional)
  ///
  /// **returns**:
  ///   None
  void updateModel(
    String value,
    bool isRecurring,
    String? frequency,
    Set<String>? weekDays, {
    int? count,
  }) {
    setState(() {
      widget.model.isRecurring = isRecurring;
      widget.model.recurrenceLabel = value;

      if (isRecurring && frequency != null) {
        widget.model.setRecurrenceFrequency(frequency);
        if (weekDays != null) {
          widget.model.weekDays = weekDays;
        }
        if (count != null) {
          widget.model.count = count;
          widget.model.eventEndType = EventEndTypes.after;
        } else {
          widget.model.eventEndType = EventEndTypes.never;
        }
        widget.model.interval = 1;
      } else {
        widget.model.resetRecurrenceSettings();
      }

      Navigator.pop(context, value);
    });
  }
}

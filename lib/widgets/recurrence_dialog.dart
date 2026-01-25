import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:intl/intl.dart';
=======
>>>>>>> upstream/develop
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
<<<<<<< HEAD
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
=======
import 'package:talawa/view_model/after_auth_view_models/event_view_models/base_event_view_model.dart';
>>>>>>> upstream/develop

/// Dialog for showing recurrence options.
class ShowRecurrenceDialog extends StatefulWidget {
  const ShowRecurrenceDialog({
    super.key,
    required this.model,
  });
<<<<<<< HEAD

  /// Instance of create event view model.
  final CreateEventViewModel model;
=======
  final BaseEventViewModel model;
>>>>>>> upstream/develop

  @override
  State<ShowRecurrenceDialog> createState() => _ShowRecurrenceDialogState();
}

class _ShowRecurrenceDialogState extends State<ShowRecurrenceDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
<<<<<<< HEAD
        height: SizeConfig.screenHeight! * 0.74,
=======
        height: SizeConfig.screenHeight! * 0.6,
>>>>>>> upstream/develop
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            radioButtonFixText(
              "Does not repeat",
<<<<<<< HEAD
              // coverage:ignore-start
              (value) => updateModel(value!, false, null, null, null),
              // coverage:ignore-end
            ),
            radioButton(
              Frequency.daily,
              widget.model.interval,
              widget.model.count,
              null,
              null,
            ),
            radioButton(Frequency.weekly, widget.model.interval,
                widget.model.count, null, [
              RecurrenceUtils
                  .weekDays[widget.model.recurrenceStartDate.weekday - 1],
            ]),
            radioButton(
              Frequency.monthly,
              widget.model.interval,
              widget.model.count,
              null,
              null,
            ),
            if (RecurrenceUtils.getWeekDayOccurenceInMonth(
                  widget.model.recurrenceStartDate,
                ) !=
                5)
              radioButton(
                  Frequency.monthly,
                  widget.model.interval,
                  widget.model.count,
                  RecurrenceUtils.getWeekDayOccurenceInMonth(
                    widget.model.recurrenceStartDate,
                  ),
                  [
                    RecurrenceUtils
                        .weekDays[widget.model.recurrenceStartDate.weekday - 1],
                  ]),
            if (RecurrenceUtils.isLastOccurenceOfWeekDay(
              widget.model.recurrenceStartDate,
            ))
              radioButton(Frequency.monthly, widget.model.interval,
                  widget.model.count, -1, [
                RecurrenceUtils
                    .weekDays[widget.model.recurrenceStartDate.weekday - 1],
              ]),
            radioButton(
              Frequency.yearly,
              widget.model.interval,
              widget.model.count,
              null,
              null,
            ),
            radioButtonFixText(
              'Monday to Friday ${widget.model.recurrenceEndDate != null ? "until ${DateFormat('MMMM d, y').format(widget.model.recurrenceEndDate!)}" : ""}',
              (value) => updateModel(value!, true, Frequency.weekly, null, {
                'MONDAY',
                'TUESDAY',
                'WEDNESDAY',
                'THURSDAY',
                'FRIDAY',
=======
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
>>>>>>> upstream/develop
              }),
            ),
            radioButtonFixText("Custom...", (value) async {
              widget.model.isRecurring = true;
              await navigationService.pushScreen(
                Routes.customRecurrencePage,
                arguments: widget.model,
              );
<<<<<<< HEAD
              setState(() {
                Navigator.pop(context, widget.model.recurrenceLabel);
              });
=======
>>>>>>> upstream/develop
            }),
          ],
        ),
      ),
    );
  }

<<<<<<< HEAD
  /// custom radio list tile.
  ///
  /// **params**:
  /// * `frequency`: represent the frequency of the event.
  /// * `interval`: represent the interval of the event.
  /// * `count`: represent the count of the event.
  /// * `weekDayOccurenceInMonth`: represent the week day occurence in month.
  /// * `weekDays`: represent the list of week days.
  ///
  /// **returns**:
  /// * `RadioListTile<String>`: returns radio list tile.
  RadioListTile<String> radioButton(
    String frequency,
    int? interval,
    int? count,
    int? weekDayOccurenceInMonth,
    List<String>? weekDays,
  ) {
    final String text = RecurrenceUtils.getRecurrenceRuleText(
      frequency,
      weekDays?.toSet(),
      interval,
      count,
      weekDayOccurenceInMonth,
      widget.model.recurrenceStartDate,
      widget.model.recurrenceEndDate,
    );
    return RadioListTile<String>(
      title: Text(text),
      value: text,
      groupValue: widget.model.recurrenceLabel,
      onChanged: (value) => updateModel(
        value!,
        true,
        frequency,
        weekDayOccurenceInMonth,
        weekDays?.map((day) => day.toUpperCase()).toSet(),
      ),
    );
  }

  /// custom radio list tile with fixed the text.
  ///
  /// **params**:
  /// * `text`: represents the text of the radio button.
  /// * `onChanged`: represents the function to be called when the radio button is pressed.
  ///
  /// **returns**:
  /// * `RadioListTile<String>`: returns radio list tile.
=======
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
>>>>>>> upstream/develop
  RadioListTile<String> radioButtonFixText(
    String text,
    Function(String?)? onChanged,
  ) {
    return RadioListTile<String>(
      title: Text(text),
      value: text,
      groupValue: widget.model.recurrenceLabel,
      onChanged: onChanged,
    );
  }

<<<<<<< HEAD
  /// Returns the updated model with the selected recurrence options.
  ///
  /// **params**:
  /// * `value`: represents text of the selected recurrence option.
  /// * `isRecurring`: represent whether the event is recurring or not.
  /// * `frequency`: represent the frequency of the event.
  /// * `weekDayOccurenceInMonth`: represent the week day occurence in month.
  /// * `weekDays`: represent the list of week days.
=======
  /// Updates the model with selected recurrence options.
  ///
  /// **params**:
  /// * `value`: Text of the selected option
  /// * `isRecurring`: Whether event is recurring
  /// * `frequency`: Frequency type
  /// * `weekDays`: Set of week days
  /// * `count`: Number of occurrences (optional)
>>>>>>> upstream/develop
  ///
  /// **returns**:
  ///   None
  void updateModel(
    String value,
    bool isRecurring,
    String? frequency,
<<<<<<< HEAD
    int? weekDayOccurenceInMonth,
    Set<String>? weekDays,
  ) {
    setState(() {
      widget.model.isRecurring = isRecurring;
      widget.model.recurrenceLabel = value;
      widget.model.weekDays = weekDays ?? {};
      widget.model.weekDayOccurenceInMonth = weekDayOccurenceInMonth;
      widget.model.frequency = frequency ?? Frequency.weekly;
=======
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

>>>>>>> upstream/develop
      Navigator.pop(context, value);
    });
  }
}

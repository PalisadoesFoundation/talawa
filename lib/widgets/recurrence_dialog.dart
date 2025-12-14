import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

/// Dialog for showing recurrence options.
class ShowRecurrenceDialog extends StatefulWidget {
  const ShowRecurrenceDialog({
    super.key,
    required this.model,
  });

  /// Instance of create event view model.
  final CreateEventViewModel model;

  @override
  State<ShowRecurrenceDialog> createState() => _ShowRecurrenceDialogState();
}

class _ShowRecurrenceDialogState extends State<ShowRecurrenceDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: SizeConfig.screenHeight! * 0.74,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            radioButtonFixText(
              "Does not repeat",
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
              }),
            ),
            radioButtonFixText("Custom...", (value) async {
              widget.model.isRecurring = true;
              await navigationService.pushScreen(
                Routes.customRecurrencePage,
                arguments: widget.model,
              );
              setState(() {
                Navigator.pop(context, widget.model.recurrenceLabel);
              });
            }),
          ],
        ),
      ),
    );
  }

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
      // ignore: deprecated_member_use
      value: text,
      // ignore: deprecated_member_use
      groupValue: widget.model.recurrenceLabel,
      // ignore: deprecated_member_use
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
  RadioListTile<String> radioButtonFixText(
    String text,
    Function(String?)? onChanged,
  ) {
    return RadioListTile<String>(
      title: Text(text),
      // ignore: deprecated_member_use
      value: text,
      // ignore: deprecated_member_use
      groupValue: widget.model.recurrenceLabel,
      // ignore: deprecated_member_use
      onChanged: onChanged,
    );
  }

  /// Returns the updated model with the selected recurrence options.
  ///
  /// **params**:
  /// * `value`: represents text of the selected recurrence option.
  /// * `isRecurring`: represent whether the event is recurring or not.
  /// * `frequency`: represent the frequency of the event.
  /// * `weekDayOccurenceInMonth`: represent the week day occurence in month.
  /// * `weekDays`: represent the list of week days.
  ///
  /// **returns**:
  ///   None
  void updateModel(
    String value,
    bool isRecurring,
    String? frequency,
    int? weekDayOccurenceInMonth,
    Set<String>? weekDays,
  ) {
    setState(() {
      widget.model.isRecurring = isRecurring;
      widget.model.recurrenceLabel = value;
      widget.model.weekDays = weekDays ?? {};
      widget.model.weekDayOccurenceInMonth = weekDayOccurenceInMonth;
      widget.model.frequency = frequency ?? Frequency.weekly;
      Navigator.pop(context, value);
    });
  }
}

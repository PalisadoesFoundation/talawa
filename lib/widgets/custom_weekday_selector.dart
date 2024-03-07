import 'package:flutter/material.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

/// Custom Widget to select weekdays.
class CustomWeekDaySelector extends StatefulWidget {
  const CustomWeekDaySelector({required this.model});

  /// instance of create event view model.
  final CreateEventViewModel model;

  @override
  _CustomWeekDaySelectorState createState() => _CustomWeekDaySelectorState();
}

class _CustomWeekDaySelectorState extends State<CustomWeekDaySelector> {
  @override
  Widget build(BuildContext context) {
    final Set<String> weekdays = widget.model.weekdays;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (index) {
          final weekday = _getWeekdayAbbreviation(index);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (weekdays.contains(weekday)) {
                  weekdays.remove(weekday);
                } else {
                  weekdays.add(weekday);
                }
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: weekdays.contains(weekday)
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                    : Colors.transparent,
                border: Border.all(
                  width: weekdays.contains(weekday) ? 2 : 1,
                  color: weekdays.contains(weekday)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  weekday[0],
                  style: TextStyle(
                    color: Theme.of(context).dividerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  /// Maps isSelected index to weekday.
  ///
  /// **params**:
  /// * `index`: of isSelected list.
  ///
  /// **returns**:
  /// * `String`: Weekday as string.
  String _getWeekdayAbbreviation(int index) {
    switch (index) {
      case 0:
        return Recurrance.weekdaySunday;
      case 1:
        return Recurrance.weekdayMonday;
      case 2:
        return Recurrance.weekdayTuesday;
      case 3:
        return Recurrance.weekdayWednesday;
      case 4:
        return Recurrance.weekdayThursday;
      case 5:
        return Recurrance.weekdayFriday;
      case 6:
        return Recurrance.weekdaySaturday;
      default:
        return '';
    }
  }
}

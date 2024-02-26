import 'package:flutter/material.dart';

/// Custom Widget to select weekdays.
class CustomWeekDaySelector extends StatefulWidget {
  @override
  _CustomWeekDaySelectorState createState() => _CustomWeekDaySelectorState();
}

class _CustomWeekDaySelectorState extends State<CustomWeekDaySelector> {
  /// Keeps track of week days that are selected.
  List<bool> isSelected = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    print('came');
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          7,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 0.5,
                  color: isSelected[index]
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  _getWeekdayAbbreviation(index),
                  style: TextStyle(
                    color: isSelected[index]
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).dividerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
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
        return 'S';
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      default:
        return '';
    }
  }
}

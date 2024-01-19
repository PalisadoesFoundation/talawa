import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/date_time_picker.dart';

/// ExploreEventDialog returns a widget that has mutable state _ExploreEventDialogState.
class ExploreEventDialog extends StatefulWidget {
  const ExploreEventDialog({required Key key}) : super(key: key);
  @override
  _ExploreEventDialogState createState() => _ExploreEventDialogState();
}

/// _ExploreEventDialogState returns a widget that show explored dialog of the event.
class _ExploreEventDialogState extends State<ExploreEventDialog> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding:
          EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.15,),
      content: SizedBox(
        height: SizeConfig.screenHeight! * 0.33,
        // width: SizeConfig.screenWidth! * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  datePicker(
                    context,
                    key: const Key('StartDateSelector'),
                    title: 'Start Date',
                    date: _startDate,
                    onTap: () async {
                      final date =
                          await customDatePicker(initialDate: _startDate);
                      setState(() {
                        _startDate = date;
                      });
                    },
                  ),
                  datePicker(
                    context,
                    key: const Key('EndDateSelector'),
                    title: 'End Date',
                    date: _endDate,
                    onTap: () async {
                      final date =
                          await customDatePicker(initialDate: _endDate);
                      setState(() {
                        _endDate = date;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  key: const Key('CancelButton'),
                  onPressed: () {
                    navigationService.pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.strictTranslate('Cancel'),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                TextButton(
                  key: const Key('DoneButton'),
                  onPressed: () {
                    navigationService.pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.strictTranslate('Done'),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff4285F4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a column with a date picker.
  ///
  /// **params**:
  /// * `context`: A `BuildContext` representing the build context.
  /// * `title`: A `String` representing the title of the date picker.
  /// * `onTap`: A `void Function()` callback triggered when the date picker is tapped.
  /// * `date`: A `DateTime` representing the selected date for the date picker.
  /// * `key`: A `Key` to identify and differentiate the date picker widget.
  ///
  /// **returns**:
  /// * `Column`: Returns a `Column` widget containing the date picker elements.
  Column datePicker(
    BuildContext context, {
    required String title,
    required void Function()? onTap,
    required DateTime date,
    required Key key,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.strictTranslate(title),
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          key: key,
          onTap: onTap,
          child: SizedBox(
            height: SizeConfig.screenHeight! * 0.08,
            child: Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.calendar_today,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    // shows the end date of the event
                    child: Text(
                      "${date.toLocal()}".split(' ')[0],
                      // maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

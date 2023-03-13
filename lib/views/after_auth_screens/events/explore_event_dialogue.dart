// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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
      insetPadding: EdgeInsets.all(
        SizeConfig.screenWidth! * 0.027,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.strictTranslate('Start Date'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    key: const Key('StartDateSelector'),
                    onTap: () async {
                      final date =
                          await customDatePicker(initialDate: _startDate);
                      setState(() {
                        _startDate = date;
                      });
                    },
                    child: SizedBox(
                      // SizedBox is a box with a specified size.
                      height: SizeConfig.screenHeight! * 0.07,
                      width: SizeConfig.screenWidth! * 0.36,
                      child: Card(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.calendar_today,
                                size: 19,
                              ),
                            ),
                            Expanded(
                              // shows the start date of the event
                              child: Text(
                                "${_startDate.toLocal()}".split(' ')[0],
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.strictTranslate('End Date'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    key: const Key('EndDateSelector'),
                    onTap: () async {
                      final date =
                          await customDatePicker(initialDate: _endDate);
                      setState(() {
                        _endDate = date;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.screenHeight! * 0.07,
                      width: SizeConfig.screenWidth! * 0.36,
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
                                "${_endDate.toLocal()}".split(' ')[0],
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: SizeConfig.screenWidth! * 0.072,
          ),
          child: SizedBox(
            width: SizeConfig.screenWidth! * 0.36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  // returns a button to cancel the event dialog
                  child: TextButton(
                    key: const Key('CancelButton'),
                    onPressed: () {
                      navigationService.pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.strictTranslate('Cancel'),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                Expanded(
                  // returns a button to mark the event dialog as done.
                  child: TextButton(
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

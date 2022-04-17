import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/date_time_picker.dart';

class ExploreEventDialog extends StatefulWidget {
  const ExploreEventDialog({required Key key}) : super(key: key);
  @override
  _ExploreEventDialogState createState() => _ExploreEventDialogState();
}

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
                      final _date =
                          await customDatePicker(initialDate: _startDate);
                      setState(() {
                        _startDate = _date;
                      });
                    },
                    child: SizedBox(
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
                      final _date =
                          await customDatePicker(initialDate: _endDate);
                      setState(() {
                        _endDate = _date;
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
                  child: TextButton(
                    key: const Key('CancelButton'),
                    onPressed: () {
                      navigationService.pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.strictTranslate('Cancel'),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    key: const Key('DoneButton'),
                    onPressed: () {
                      navigationService.pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.strictTranslate('Done'),
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xff4285F4)),
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

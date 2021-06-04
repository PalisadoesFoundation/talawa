import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
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
                  const Text(
                    'Start Date',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final _date =
                          await customDatePicker(initialDate: _startDate);
                      print("TAPPED");
                      print(_date);
                      setState(() {
                        _startDate = _date;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.screenHeight! * 0.07,
                      width: SizeConfig.screenWidth! * 0.36,
                      child: Card(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 19,
                            ),
                            Text(
                              "${_startDate.toLocal()}".split(' ')[0],
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
                  const Text(
                    'End Date',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final _date =
                          await customDatePicker(initialDate: _endDate);
                      print("TAPPED");
                      print(_date);
                      setState(() {
                        _endDate = _date;
                      });
                    },
                    child: SizedBox(
                      height: SizeConfig.screenHeight! * 0.07,
                      width: SizeConfig.screenWidth! * 0.36,
                      child: Card(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                            Text(
                              "${_endDate.toLocal()}".split(' ')[0],
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
                TextButton(
                    onPressed: () {
                      locator<NavigationService>().pop();
                    },
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                TextButton(
                    onPressed: () {
                      print('BEEP');
                      locator<NavigationService>().pop();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(fontSize: 14, color: Color(0xff4285F4)),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}

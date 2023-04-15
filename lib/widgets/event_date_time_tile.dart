// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

/// Returns a widget tile(item) for displaying date and time.
class DateTimeTile extends StatelessWidget {
  const DateTimeTile({
    Key? key,
    required this.date,
    required this.time,
    required this.setDate,
    required this.setTime,
  }) : super(key: key);
  // variables
  final String date;
  final String time;
  final Function setDate;
  final Function setTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      height: SizeConfig.screenHeight! * 0.068,
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.083),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Color(0xff524F4F),
              size: 19,
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.045,
            ),
            InkWell(
              key: const Key('EventDateTimeTileDate'),
              onTap: () async {
                setDate();
              },
              child: Text(
                date,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.schedule,
              color: Color(0xff524F4F),
              size: 19,
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.045,
            ),
            InkWell(
              key: const Key('EventDateTimeTileTime'),
              onTap: () async {
                setTime();
              },
              child: Text(
                time,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';

/// Returns a widget tile(item) for displaying date and time.
class DateTimeTile extends StatelessWidget {
  const DateTimeTile({
    super.key,
    required this.date,
    required this.time,
    required this.setDate,
    required this.setTime,
  });

  /// Represents a date in string format.
  final String date;

  /// Represents a time in string format.
  final String time;

  /// Function that sets the date.
  final Function() setDate;

  /// Function that sets the time.
  final Function() setTime;

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

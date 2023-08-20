


# calendarTapped method








void calendarTapped
([CalendarTapDetails](https://pub.dev/documentation/syncfusion_flutter_calendar/20.4.54/calendar/CalendarTapDetails-class.html) details)








## Implementation

```dart
void calendarTapped(CalendarTapDetails details) {
  if (details.targetElement == CalendarElement.appointment ||
      details.targetElement == CalendarElement.agenda) {
    final Appointment appointmentDetails =
        details.appointments![0] as Appointment;
    final subjectText = appointmentDetails.subject;
    final dateText =
        DateFormat('MMMM dd, yyyy').format(appointmentDetails.startTime);
    final endTimeText =
        DateFormat('hh:mm a').format(appointmentDetails.endTime);
    final timeDetails = endTimeText;

    navigationService.pushDialog(
      AlertDialog(
        title: Text(
          subjectText,
          style: TextStyle(
            color: Theme.of(navigationService.navigatorKey.currentContext!)
                .primaryColorLight,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(appointmentDetails.notes!),
            const SizedBox(height: 10),
            Text('$dateText $timeDetails')
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => navigationService.pop(),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}
```








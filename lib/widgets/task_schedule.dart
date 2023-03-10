// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';

class TaskSchedule extends StatelessWidget {
  const TaskSchedule({
    Key? key,
    required this.tasks,
    this.showMoreOptions = false,
  }) : super(key: key);

  final List<Task> tasks;
  final bool showMoreOptions;

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

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.schedule,
      dataSource: _getCalendarDataSource(tasks),
      scheduleViewSettings: const ScheduleViewSettings(
        hideEmptyScheduleWeek: true,
        appointmentItemHeight: 70,
        monthHeaderSettings: MonthHeaderSettings(
          height: 0,
        ),
      ),
      onTap: calendarTapped,
      appointmentBuilder: (context, appointments) {
        final appointment = appointments.appointments.first as Appointment;
        final task = tasks.firstWhere((task) => task.id == appointment.id);
        return TaskCard(
          appointment: appointment,
          showMoreOptions: showMoreOptions,
          task: task,
        );
      },
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.appointment,
    required this.showMoreOptions,
    required this.task,
  }) : super(key: key);

  final Appointment appointment;
  final bool showMoreOptions;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appointment.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' ${appointment.subject}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    DateFormat('hh:mm a').format(appointment.endTime),
                  ),
                ],
              ),
            ],
          ),
          showMoreOptions
              ? IconButton(
                  onPressed: () {
                    navigationService.pushDialog(
                      AlertDialog(
                        title: Text(
                          'User Actions',
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Delete'),
                            onPressed: () {
                              context.read<ExploreTasksViewModel>().deleteTask(
                                    task.id,
                                    task.creator.id!,
                                  );
                              navigationService.pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Edit'),
                            onPressed: () {
                              navigationService.pop();
                              navigationService.pushScreen(
                                Routes.editTask,
                                arguments: task,
                              );
                            },
                          ),
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () => navigationService.pop(),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                )
              : Container(),
        ],
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource(List<Task> tasksList) {
  final appointments = <Appointment>[];
  final colors = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];
  int index = 0;
  tasksList.forEach((task) {
    final currentTime = DateTime.now();
    final deadline =
        task.deadline ?? currentTime.microsecondsSinceEpoch.toString();
    final endTime = DateTime.fromMicrosecondsSinceEpoch(
      int.parse(deadline),
    );
    final description = task.description ?? '';
    final creator =
        task.creator.firstName ?? userConfig.currentUser.firstName ?? '';

    appointments.add(
      Appointment(
        startTime: endTime,
        endTime: endTime,
        subject: task.title,
        notes: '$description\n- $creator (${task.event.title})',
        color: colors[index % colors.length],
        id: task.id,
      ),
    );
    index++;
  });

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

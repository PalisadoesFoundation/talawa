// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_schedule.dart';

/// EventTasksPage return a widget for Event Task Page that is created by event creator.
class EventTasksPage extends StatelessWidget {
  const EventTasksPage({Key? key, required this.eventId}) : super(key: key);

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreTasksViewModel>(
      onModelReady: (model) => model.fetchTasks(eventId),
      builder: (_, model, __) {
        final tasks = model.tasks;
        return RefreshIndicator(
          onRefresh: () => model.fetchTasks(eventId),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Event Tasks'),
            ),
            // TaskSchedule is custom widget.
            body: TaskSchedule(tasks: tasks),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await navigationService.pushScreen(
                  Routes.addTask,
                  arguments: eventId,
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}

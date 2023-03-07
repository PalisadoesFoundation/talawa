// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_schedule.dart';

/// UserTasksPage returns a widget for page of User Tasks.
class UserTasksPage extends StatelessWidget {
  const UserTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreTasksViewModel>(
      onModelReady: (model) => model.fetchTasksByUser(),
      builder: (_, model, __) {
        final tasks = model.tasks;
        return RefreshIndicator(
          onRefresh: () => model.fetchTasksByUser(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('User Tasks'),
            ),
            // TaskSchedule is custom widget.
            body: TaskSchedule(tasks: tasks, showMoreOptions: true),
          ),
        );
      },
    );
  }
}

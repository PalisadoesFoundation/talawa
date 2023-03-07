// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_form.dart';

/// CreateTaskPage returns a widget for page to create task for the user.
class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({required this.eventId, Key? key}) : super(key: key);

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateTaskViewModel>(
      builder: (context, model, _) {
        // renders custom widget TaskForm, you can explore TaskForm widget [here](/widgets/task_form.dart).
        return TaskForm(
          onSave: () => model.createTask(eventId),
          title: 'Create Task',
          actionText: 'Add',
        );
      },
    );
  }
}

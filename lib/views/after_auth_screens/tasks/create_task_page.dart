import 'package:flutter/material.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_form.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({required this.eventId, Key? key}) : super(key: key);

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateTaskViewModel>(
      builder: (context, model, _) {
        return TaskForm(
          onSave: () => model.createTask(eventId),
          title: 'Create Task',
          actionText: 'Add',
        );
      },
    );
  }
}

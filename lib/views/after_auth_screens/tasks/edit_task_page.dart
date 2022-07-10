import 'package:flutter/material.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_form.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({required this.task, Key? key}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return BaseView<CreateTaskViewModel>(
      onModelReady: (model) => model.fillTask(task),
      builder: (context, model, _) {
        return TaskForm(
          onSave: () => model.editTask(task.id),
          title: 'Edit Task',
          actionText: 'Update',
        );
      },
    );
  }
}

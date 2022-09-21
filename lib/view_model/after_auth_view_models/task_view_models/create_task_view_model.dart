import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class CreateTaskViewModel extends BaseModel {
  final _taskService = locator<TaskService>();

  final taskTitleTextController = TextEditingController();
  final taskDescriptionTextController = TextEditingController();

  DateTime taskEndDate = DateTime.now();
  TimeOfDay taskEndTime = TimeOfDay.now();

  void fillTask(Task task) {
    taskTitleTextController.text = task.title;
    taskDescriptionTextController.text = task.description ?? '';
    if (task.deadline != null) {
      taskEndDate =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(task.deadline!));
      taskEndTime = TimeOfDay.fromDateTime(taskEndDate);
    }
  }

  Future<bool> editTask(String taskId) async {
    final deadline = DateTime(
      taskEndDate.year,
      taskEndDate.month,
      taskEndDate.day,
      taskEndTime.hour,
      taskEndTime.minute,
    );
    return _taskService.editTask(
      title: taskTitleTextController.text,
      description: taskDescriptionTextController.text,
      deadline: deadline.microsecondsSinceEpoch.toString(),
      taskId: taskId,
    );
  }

  Future<bool> createTask(String eventId) async {
    final deadline = DateTime(
      taskEndDate.year,
      taskEndDate.month,
      taskEndDate.day,
      taskEndTime.hour,
      taskEndTime.minute,
    );
    return _taskService.createTask(
      title: taskTitleTextController.text,
      description: taskDescriptionTextController.text,
      deadline: deadline.microsecondsSinceEpoch.toString(),
      eventId: eventId,
    );
  }

  @override
  void dispose() {
    taskTitleTextController.dispose();
    taskDescriptionTextController.dispose();
    super.dispose();
  }
}

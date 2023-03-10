// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// CreateTaskViewModel class helps to interact with model to serve data
/// and react to user's input in Create Task view.
///
/// Methods include:
/// * `fillTask`
/// * `editTask
/// * `createTask`
class CreateTaskViewModel extends BaseModel {
  final _taskService = locator<TaskService>();

  final taskTitleTextController = TextEditingController();
  final taskDescriptionTextController = TextEditingController();

  DateTime taskEndDate = DateTime.now();
  TimeOfDay taskEndTime = TimeOfDay.now();

  /// This functions fills the task controller data.
  ///
  /// params:
  /// * [task] : `Task` type contain task data.
  void fillTask(Task task) {
    taskTitleTextController.text = task.title;
    taskDescriptionTextController.text = task.description ?? '';
    if (task.deadline != null) {
      taskEndDate =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(task.deadline!));
      taskEndTime = TimeOfDay.fromDateTime(taskEndDate);
    }
  }

  /// This function updates the task.
  /// The function uses `editTask` method provided by Task Services.
  ///
  /// params:
  /// * [taskId] : id of the task that needs to be updated.
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

  /// This function creates a new task for an event.
  /// The function uses `createTask` method provided by Task Services.
  ///
  /// params:
  /// * [eventId] : id of the event for which task need to be add.
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

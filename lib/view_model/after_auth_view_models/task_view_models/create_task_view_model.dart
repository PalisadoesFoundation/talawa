import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class CreateTaskViewModel extends BaseModel {
  final _taskService = locator<TaskService>();

  final _taskTitleTextController = TextEditingController();
  final _taskDescriptionTextController = TextEditingController();
  final _taskDeadlineTextController = TextEditingController();

  Future<void> createTask(String eventId) async {
    await _taskService.createTask(
      title: _taskTitleTextController.text,
      description: _taskDescriptionTextController.text,
      deadline: _taskDeadlineTextController.text,
      eventId: eventId,
    );
  }

  @override
  void dispose() {
    _taskTitleTextController.dispose();
    _taskDescriptionTextController.dispose();
    _taskDeadlineTextController.dispose();
    super.dispose();
  }
}

// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// ExploreTasksViewModel class helps to interact with model to serve data
/// and react to user's input in Explore Task section.
///
/// Methods include:
/// * `fetchTasks`
/// * `fetchTasksByUser
/// * `deleteTask`
class ExploreTasksViewModel extends BaseModel {
  ExploreTasksViewModel() {
    _taskService.callbackNotifyListeners = () => notifyListeners();
  }

  final _taskService = locator<TaskService>();

  List<Task> get tasks => _taskService.tasks;

  /// This function fetch all the task for an event.
  /// The function uses `getTasksForEvent` method of Task Service.
  ///
  /// params:
  /// * [eventId] : id of an event for which tasks need to be fetched.
  Future<void> fetchTasks(String eventId) async {
    setState(ViewState.busy);
    await _taskService.getTasksForEvent(eventId);
    setState(ViewState.idle);
  }

  /// This function fetch tasks created by the current user for an event.
  /// The function uses `getTasksByUser` method of Task Service.
  Future<void> fetchTasksByUser() async {
    setState(ViewState.busy);
    await _taskService.getTasksByUser();
    setState(ViewState.idle);
  }

  /// This function deletes the task for an event.
  /// The function uses `deleteTask` method of Task Service.
  ///
  /// params:
  /// * [taskId] : id of the task need to be deleted.
  /// * [creatorId] : id of the task creator.
  Future<void> deleteTask(String taskId, String creatorId) async {
    await _taskService.deleteTask(taskId, creatorId);
    notifyListeners();
  }
}

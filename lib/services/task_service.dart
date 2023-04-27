// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/painting.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/task_queries.dart';

/// PostService class provides functions in the context of a Task.
///
/// Services include:
/// * `getTasksForEvent` : to get the task for the event.
/// * `getTasksByUser` : to get the task added by the user.
/// * `editTask` : to edit the task added by the user.
/// * `createTask` : to create the task for the event.
/// * `deleteTask` : to delete the task added by the user.
class TaskService {
  final _databaseMutationFunctions = locator<DataBaseMutationFunctions>();
  final _userConfig = locator<UserConfig>();
  late VoidCallback callbackNotifyListeners;

  final _tasks = <Task>[];
  List<Task> get tasks => _tasks;

  /// This function is used to get all the tasks for the event.
  ///
  /// params:
  /// * [eventId] : id of an event for which tasks need to fetched,
  Future<void> getTasksForEvent(String eventId) async {
    await _databaseMutationFunctions
        .refreshAccessToken(_userConfig.currentUser.refreshToken!);
    final res = await _databaseMutationFunctions
        .gqlNonAuthQuery(TaskQueries.eventTasks(eventId));

    if (res != null) {
      _tasks.clear();
      final tasksList = res.data!['tasksByEvent'] as List;
      tasksList.forEach((task) {
        _tasks.add(Task.fromJson(task as Map<String, dynamic>));
      });
    }
  }

  /// This function is used to fetch and return all tasks added by the current user.
  Future<void> getTasksByUser() async {
    await _databaseMutationFunctions
        .refreshAccessToken(_userConfig.currentUser.refreshToken!);
    final res = await _databaseMutationFunctions
        .gqlNonAuthQuery(TaskQueries.userTasks(_userConfig.currentUser.id!));

    if (res != null) {
      _tasks.clear();
      final tasksList = res.data!['tasksByUser'] as List;
      tasksList.forEach((task) {
        _tasks.add(Task.fromJson(task as Map<String, dynamic>));
      });
    }
  }

  /// This function is used to edit the task created by the user.
  ///
  /// params:
  /// * [title] : task title.
  /// * [description] : task description.
  /// * [deadline] : task deadline.
  /// * [taskId] : task Id.
  Future<bool> editTask({
    required String title,
    required String description,
    required String deadline,
    required String taskId,
  }) async {
    _databaseMutationFunctions
        .refreshAccessToken(_userConfig.currentUser.refreshToken!);
    final res = await _databaseMutationFunctions.gqlAuthMutation(
      TaskQueries.editTask(
        title: title,
        description: description,
        deadline: deadline,
        taskId: taskId,
      ),
    );

    // if res is not null.
    if (res != null) {
      final updatedtaskJson = res.data!['updateTask'] as Map<String, dynamic>;
      final index = _tasks.indexWhere((task) => task.id == taskId);
      if (index == -1) return false;
      final updatedtask = Task.fromJson(updatedtaskJson);
      updatedtask.event.title = _tasks[index].event.title;
      _tasks[index] = updatedtask;
      callbackNotifyListeners();
      // if successfully updated then return true.
      return true;
    }
    return false;
  }

  /// This function is used to create a new task for the event.
  ///
  /// params:
  /// * [title] : task title.
  /// * [description] : task description.
  /// * [deadline] : task deadline.
  /// * [eventId] : Event for which task need to be create.
  Future<bool> createTask({
    required String title,
    required String description,
    required String deadline,
    required String eventId,
  }) async {
    _databaseMutationFunctions
        .refreshAccessToken(_userConfig.currentUser.refreshToken!);
    final res = await _databaseMutationFunctions.gqlAuthMutation(
      TaskQueries.addTask(
        title: title,
        description: description,
        deadline: deadline,
        eventId: eventId,
      ),
    );

    if (res != null) {
      final task = res.data!['createTask'] as Map<String, dynamic>;
      _tasks.add(Task.fromJson(task));
      callbackNotifyListeners();
      return true;
    }
    return false;
  }

  /// This function is used to delete a task.
  ///
  /// params:
  /// * [taskId] : id of a task need to be deleted.
  /// * [creatorId] : id of the task creator.
  Future<void> deleteTask(String taskId, String creatorId) async {
    if (creatorId == _userConfig.currentUser.id) {
      await _databaseMutationFunctions
          .refreshAccessToken(_userConfig.currentUser.refreshToken!);
      final res = await _databaseMutationFunctions
          .gqlAuthMutation(TaskQueries.deleteTask(taskId));
      if (res != null) _tasks.removeWhere((task) => task.id == taskId);
    }
  }
}

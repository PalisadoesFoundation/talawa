import 'package:flutter/painting.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/task_queries.dart';

/// Provides functions in the context of a Task.
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

  /// callBack to NotifyListeners.
  late VoidCallback callbackNotifyListeners;

  final _tasks = <Task>[];

  /// List of Tasks.
  List<Task> get tasks => _tasks;

  /// Retrieves tasks for a specific event.
  ///
  /// **params**:
  /// * `eventId`: The ID of the event for which tasks
  /// are to be retrieved.
  ///
  /// **returns**:
  /// * `Future<void>`: A promise that will be fulfilled after
  /// tasks for the event are retrieved.
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

  /// Retrieves tasks associated with the current user.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<void>`: A promise that will be fulfilled after
  /// the user's tasks are retrieved.
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

  /// Edits a task with the provided details.
  ///
  /// **params**:
  /// * `title`: The new title for the task.
  /// * `description`: The new description for the task.
  /// * `deadline`: The new deadline for the task.
  /// * `taskId`: The ID of the task to be edited.
  ///
  /// **returns**:
  /// * `Future<bool>`: A promise that will be fulfilled
  /// with a boolean value indicating whether the task
  /// was successfully edited.
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
      final updatedtaskJson =
          (res as QueryResult).data!['updateTask'] as Map<String, dynamic>;
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

  /// Creates a new task with the provided details.
  ///
  /// **params**:
  /// * `title`: The title for the new task.
  /// * `description`: The description for the new task.
  /// * `deadline`: The deadline for the new task.
  /// * `eventId`: The ID of the event associated with
  /// the new task.
  ///
  /// **returns**:
  /// * `Future<bool>`: A promise that will be fulfilled
  /// with a boolean value indicating whether the task
  /// was successfully created.
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
      final task =
          (res as QueryResult).data!['createTask'] as Map<String, dynamic>;
      _tasks.add(Task.fromJson(task));
      callbackNotifyListeners();
      return true;
    }
    return false;
  }

  /// Deletes a task given its ID and the creator's ID.
  ///
  /// **params**:
  /// * `taskId`: The ID of the task to be deleted.
  /// * `creatorId`: The ID of the task's creator.
  ///
  /// **returns**:
  /// * `Future<void>`: A promise that will be fulfilled
  ///  after the task deletion process completes.
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

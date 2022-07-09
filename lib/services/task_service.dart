import 'package:flutter/painting.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/task_queries.dart';

class TaskService {
  final _databaseMutationFunctions = locator<DataBaseMutationFunctions>();
  final _userConfig = locator<UserConfig>();
  late VoidCallback callbackNotifyListeners;

  final _tasks = <Task>[];
  List<Task> get tasks => _tasks;

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

  Future<bool> createTask({
    required String title,
    required String description,
    required String deadline,
    required String eventId,
  }) async {
    _databaseMutationFunctions
        .refreshAccessToken(_userConfig.currentUser.refreshToken!);
    final res =
        await _databaseMutationFunctions.gqlAuthMutation(TaskQueries.addTask(
      title: title,
      description: description,
      deadline: deadline,
      eventId: eventId,
    ));

    if (res != null) {
      final task = res.data!['createTask'] as Map<String, dynamic>;
      _tasks.add(Task.fromJson(task));
      callbackNotifyListeners();
      return true;
    }
    return false;
  }

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

import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/utils/task_queries.dart';

class TaskService {
  final _databaseMutationFunctions = locator<DataBaseMutationFunctions>();

  final _tasks = <Task>[];
  List<Task> get tasks => _tasks;

  Future<void> getTasksForEvent(String eventId) async {
    final res = await _databaseMutationFunctions
        .gqlNonAuthQuery(TaskQueries.eventTasks(eventId));

    if (res != null) {
      _tasks.clear();
      final tasksList = res.data!['tasksByEvent'] as List<Map<String, dynamic>>;
      tasksList.forEach((task) {
        _tasks.add(Task.fromJson(task));
      });
    }
  }

  Future<void> createTask({
    required String title,
    required String description,
    required String deadline,
    required String eventId,
  }) async {
    final res =
        await _databaseMutationFunctions.gqlAuthMutation(TaskQueries.addTask(
      title: title,
      description: description,
      deadline: deadline,
      eventId: eventId,
    ));

    if (res != null) {
      final task = res.data!['tasksByEvent'] as Map<String, dynamic>;
      _tasks.add(Task.fromJson(task));
    }
  }
}

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class ExploreTasksViewModel extends BaseModel {
  final _taskService = locator<TaskService>();

  List<Task> get tasks => _taskService.tasks;

  Future<void> fetchTasks(String eventId) async {
    setState(ViewState.busy);
    await _taskService.getTasksForEvent(eventId);
    setState(ViewState.idle);
  }
}

// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/explore_tasks_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';

void main() {
  setUp(() {
    registerServices();
  });
  group('Test Create Task View Model', () {
    test('Test fetchTasks method', () async {
      final model = ExploreTasksViewModel();
      await model.fetchTasks('eventId');
      verify(
        (locator<TaskService>() as MockTaskService).getTasksForEvent('eventId'),
      );
    });
    test('Test fetchTasksByUser method', () async {
      final model = ExploreTasksViewModel();
      await model.fetchTasksByUser();

      verify(
        (locator<TaskService>() as MockTaskService).getTasksByUser(),
      );
    });
    test('Test deleteTask method', () async {
      final model = ExploreTasksViewModel();
      model.deleteTask('taskId', 'creatorId');

      verify(
        (locator<TaskService>() as MockTaskService)
            .deleteTask('taskId', 'creatorId'),
      );
    });
    test('Test model tasks', () async {
      final model = ExploreTasksViewModel();
      expect(model.tasks, []);
    });
  });
}

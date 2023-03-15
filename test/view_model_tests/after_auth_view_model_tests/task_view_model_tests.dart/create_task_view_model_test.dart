// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_helpers.mocks.dart';

void main() {
  setUp(() {
    registerServices();
  });
  group('Test Create Task View Model', () {
    test('Test createTask method', () async {
      final model = CreateTaskViewModel();
      await model.createTask('eventId');

      verify(
        (locator<TaskService>() as MockTaskService).createTask(
          title: anyNamed('title'),
          description: anyNamed('description'),
          deadline: anyNamed('deadline'),
          eventId: anyNamed('eventId'),
        ),
      );
    });
    test('Test editTask method', () async {
      final model = CreateTaskViewModel();
      await model.editTask('eventId');

      verify(
        (locator<TaskService>() as MockTaskService).editTask(
          title: anyNamed('title'),
          description: anyNamed('description'),
          deadline: anyNamed('deadline'),
          taskId: anyNamed('taskId'),
        ),
      );
    });
    test('Test fillTask method', () async {
      final model = CreateTaskViewModel();
      model.fillTask(
        Task(
          title: 'title',
          id: 'id',
          event: Event(),
          creator: User(),
          createdAt: '123456',
          deadline: '123458',
        ),
      );

      expect(model.taskTitleTextController.text, 'title');
    });
    test('Test dispose method', () async {
      final model = CreateTaskViewModel();
      model.dispose();
      expect(
        () => model.taskTitleTextController.text = 'test',
        throwsFlutterError,
      );
    });
  });
}

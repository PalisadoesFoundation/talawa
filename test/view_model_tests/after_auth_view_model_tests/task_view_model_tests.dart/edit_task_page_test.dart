import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/views/edit_task_page.dart';

class MockCreateTaskViewModel extends Mock implements CreateTaskViewModel {}

void main() {
  group('EditTaskPage', () {
    testWidgets('should call fillTask method with correct task', (tester) async {
      final mockModel = MockCreateTaskViewModel();
      final task = Task(id: '1', name: 'Test Task');
      await tester.pumpWidget(
        MaterialApp(
          home: EditTaskPage(task: task),
          builder: (context, child) => CreateTaskViewModel(model: mockModel),
        ),
      );
      verify(mockModel.fillTask(task)).called(1);
    });
    testWidgets('should call editTask method with correct task id', (tester) async {
      final mockModel = MockCreateTaskViewModel();
      final task = Task(id: '1', name: 'Test Task');
      await tester.pumpWidget(
        MaterialApp(
          home: EditTaskPage(task: task),
          builder: (context, child) => CreateTaskViewModel(model: mockModel),
        ),
      );
      await tester.tap(find.byType(TaskForm));
      await tester.pump();
      verify(mockModel.editTask(task.id)).called(1);
    });
  });
}

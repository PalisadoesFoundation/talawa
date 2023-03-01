import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/task/task_model.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/tasks/edit_task_page.dart';
import 'package:talawa/widgets/task_form.dart';

import '../../../helpers/test_helpers.dart';

Widget createEditTaskPage() => MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: EditTaskPage(
        task: Task(
          id: '1',
          title: 'title',
          event: Event(),
          creator: User(),
          createdAt: '123456',
        ),
      ),
    );

void main() {
  setUp(() {
    SizeConfig().test();
    registerServices();
    registerViewModels();
  });
  testWidgets('EditTaskPage UI Test', (tester) async {
    await tester.pumpWidget(createEditTaskPage());
    await tester.pump();
    expect(find.byType(TaskForm), findsOneWidget);
  });
}

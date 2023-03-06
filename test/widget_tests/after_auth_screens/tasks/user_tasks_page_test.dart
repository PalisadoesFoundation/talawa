// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/tasks/user_tasks_page.dart';
import 'package:talawa/widgets/task_schedule.dart';

import '../../../helpers/test_helpers.dart';

Widget createUserTasksPage() => const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: UserTasksPage(),
    );

void main() {
  setUp(() {
    SizeConfig().test();
    registerServices();
    registerViewModels();
  });
  testWidgets('UserTasksPage UI Test', (tester) async {
    await tester.pumpWidget(createUserTasksPage());
    await tester.pump();
    expect(find.byType(TaskSchedule), findsOneWidget);
  });
}

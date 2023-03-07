// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/tasks/create_task_page.dart';
import 'package:talawa/widgets/task_form.dart';

import '../../../helpers/test_helpers.dart';

Widget createTaskPage() => const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: CreateTaskPage(eventId: '1'),
    );

void main() {
  setUp(() {
    SizeConfig().test();
    registerServices();
    registerViewModels();
  });
  testWidgets('CreateTaskPage UI Test', (tester) async {
    await tester.pumpWidget(createTaskPage());
    await tester.pump();
    expect(find.byType(TaskForm), findsOneWidget);
  });
}

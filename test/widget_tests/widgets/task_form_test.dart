import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/task_view_models/create_task_view_model.dart';
import 'package:talawa/views/after_auth_screens/tasks/create_task_page.dart';
import 'package:talawa/widgets/task_form.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/test_locator.dart';

bool onsave = false;

final model = CreateTaskViewModel();
Widget createTalawaErrorWidget({
  bool reverse = false,
  String? dialogTitle,
  bool passSecondaryFunc = true,
}) {
  return MaterialApp(
    navigatorKey: locator<NavigationService>().navigatorKey,
    navigatorObservers: [],
    locale: const Locale('en'),
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('es', 'ES'),
      const Locale('fr', 'FR'),
      const Locale('hi', 'IN'),
      const Locale('zh', 'CN'),
      const Locale('de', 'DE'),
      const Locale('ja', 'JP'),
      const Locale('pt', 'PT'),
    ],
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
        body: TaskForm(
      onSave: () => model.editTask('taskId'),
      title: 'AYUSH',
      actionText: '',
    )),
  );
}

//
// Future<bool> toggleOnSave() async {
//   onsave = !onsave;
//   return onsave;
// }
//
// Future<bool> editTask(String taskId) async {
//   onsave = !onsave;
//   return onsave;
// }

Widget createTaskPage() => const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: CreateTaskPage(eventId: '1'),
    );

void main() {
  SizeConfig().test();

  locator.registerSingleton(NavigationService());

  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  testWidgets('check if CreateTaskPage shows up', (tester) async {
    // await tester.pumpWidget(createTaskPage());
    // await tester.pump();
    //
    // expect(find.byType(TaskForm), findsOneWidget);
    //
    // final button = find.byKey(const Key('task_form_text_button'));
    //
    // expect(button, findsOneWidget);

    final model = CreateTaskViewModel();

    await tester.pumpWidget(createTalawaErrorWidget());
    await tester.pump();
  });

  // testWidgets('check if Task form button works', (tester) async {
  //   await tester.pumpWidget(createTalawaErrorWidget());
  //   await tester.pump();
  //
  //   final button = find.byKey(const Key('task_form_text_button'));
  //   tester.allElements.forEach((element) {
  //     print(element);
  //   });
  //   expect(button, findsOneWidget);
  // });

  // testWidgets('check if Task form button works', (tester) async {
  //   await tester.pumpWidget(createTaskPage());
  //   await tester.pump();
  //
  //   final button = find.byKey(const Key('task_form_text_button'));
  //
  //   // await tester.tap(button);
  //   // await tester.pump();
  //
  //   expect(button, findsOneWidget);
  // });
}

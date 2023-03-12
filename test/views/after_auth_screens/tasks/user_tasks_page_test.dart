// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/task_service.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/lang_view_model.dart';
import 'package:talawa/views/after_auth_screens/tasks/user_tasks_page.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/task_schedule.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

Widget createUserTasksPage() {
  return BaseView<AppLanguage>(
    onModelReady: (model) => model.initialize(),
    builder: (context, langModel, child) {
      return const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: UserTasksPage(),
      );
    },
  );
}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group("Test for UserTasksPage", () {
    testWidgets("Check if UserTasksPage shows up", (tester) async {
      await tester.pumpWidget(createUserTasksPage());
      await tester.pumpAndSettle();

      expect(find.byType(UserTasksPage), findsOneWidget);
    });

    testWidgets("Check if all children show up correctly", (tester) async {
      await tester.pumpWidget(createUserTasksPage());
      await tester.pumpAndSettle();

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(TaskSchedule), findsOneWidget);
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Scaffold && widget.appBar is AppBar,
        ),
        findsOneWidget,
      );
      expect(find.text("User Tasks"), findsOneWidget);
    });

    testWidgets("Check if refreshing works", (tester) async {
      await tester.pumpWidget(createUserTasksPage());
      await tester.pumpAndSettle();

      bool isRefreshed = false;

      when(locator<TaskService>().getTasksByUser()).thenAnswer((_) async {
        isRefreshed = true;
      });

      await tester.drag(
        find.byType(RefreshIndicator),
        const Offset(0, 200),
      );
      await tester.pumpAndSettle();

      expect(isRefreshed, true);
    });
  });
}

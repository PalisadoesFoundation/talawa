import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/comment.dart';
import 'package:talawa/services/post_provider.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import 'package:talawa/views/pages/events/add_task_dialog.dart';

Widget addTaskDialog() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
            create: (_) => GraphQLConfiguration()),
        ChangeNotifierProvider<OrgController>(create: (_) => OrgController()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Preferences>(create: (_) => Preferences()),
        ChangeNotifierProvider<CommentHandler>(create: (_) => CommentHandler()),
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
      ],
      child: MaterialApp(
        home: Builder(builder: (context) {
          SizeConfig().init(context);
          return AddEventTask(
            eventId: "",
          );
        }),
      ),
    );

void main() {
  group("add Task Dialog Tests", () {
    testWidgets(
        "Testing if add Task Dialog page shows up validations on empty submission",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if add Task Dialog page shows up validations on empty submission of description field",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      final Finder title = find.byKey(const Key('Title'));
      await tester.enterText(title, "Something post title");
      await tester.pump();
      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if add Task Dialog page shows up validations on empty submission of title field",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      final Finder description = find.byKey(const Key('Description'));
      await tester.enterText(description, "Description for the post");
      await tester.pump();
      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if add Task Dialog page shows up validations on submission on fields with data",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      final Finder title = find.byKey(const Key('Title'));
      await tester.enterText(title, "Something post title");
      final Finder description = find.byKey(const Key('Description'));
      await tester.enterText(description, "Description for the post");
      await tester.pump();
      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isTrue);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/GQLClient.dart';
import 'package:talawa/views/pages/events/addTaskDialog.dart';

Widget addTaskDialog() => MultiProvider(
      providers: [
        ChangeNotifierProvider<GraphQLConfiguration>(
          create: (_) => GraphQLConfiguration(),
        ),
        ChangeNotifierProvider<OrgController>(
          create: (_) => OrgController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider<Preferences>(
          create: (_) => Preferences(),
        ),
      ],
      child: MaterialApp(
        home: AddEventTask(
          eventId: "",
        ),
      ),
    );

void main() {
  group("add Task Dialog Tests", () {
    testWidgets(
        "Testing if add Task Dialog page shows up validations on empty submission",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if add Task Dialog page shows up validations on empty submission of description field",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      Finder title = find.byKey(Key('Title'));
      await tester.enterText(title, "Something post title");
      await tester.pump();
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if add Task Dialog page shows up validations on empty submission of title field",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      Finder description = find.byKey(Key('Description'));
      await tester.enterText(description, "Description for the post");
      await tester.pump();
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if add Task Dialog page shows up validations on submission on fields with data",
        (tester) async {
      await tester.pumpWidget(addTaskDialog());
      Finder title = find.byKey(Key('Title'));
      await tester.enterText(title, "Something post title");
      Finder description = find.byKey(Key('Description'));
      await tester.enterText(description, "Description for the post");
      await tester.pump();
      Finder formWidgetFinder = find.byType(Form);
      Form formWidget = tester.widget(formWidgetFinder) as Form;
      GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isTrue);
    });
  });
}

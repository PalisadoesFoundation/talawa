import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
// Local files imports.
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/lang_controller.dart';
import 'package:talawa/controllers/org_controller.dart';
import 'package:talawa/controllers/post_controller.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/services/preferences.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/views/pages/newsfeed/add_post.dart';

Widget createMemberPageScreen() => MultiProvider(
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
        ChangeNotifierProvider<PostController>(
          create: (_) => PostController(),
        ),
        ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
      ],
      child: const MaterialApp(
        localizationsDelegates: [
          AppLocalizationsDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: AddPost(),
      ),
    );

void main() {
  group("Member Page Tests", () {
    testWidgets(
        "Testing if addPost page shows up validations on empty submission",
        (tester) async {
      await tester.pumpWidget(createMemberPageScreen());
      await tester.pumpAndSettle();

      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if addPost page shows up validations on empty submission of description field",
        (tester) async {
      await tester.pumpWidget(createMemberPageScreen());
      await tester.pumpAndSettle();

      // final Finder title = find.byKey(const Key('Title'));
      // await tester.enterText(title, "Something post title");

      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isFalse);
    });
    testWidgets(
        "Testing if addPost page shows up validations on empty submission of title field",
        (tester) async {
      await tester.pumpWidget(createMemberPageScreen());
      await tester.pumpAndSettle();

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
        "Testing if addPost page shows up validations on submission on fields with data",
        (tester) async {
      await tester.pumpWidget(createMemberPageScreen());
      await tester.pumpAndSettle();

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
    testWidgets(
        "Testing if addPost page shows up error toast on submission on fields with multiline description",
        (tester) async {
      await tester.pumpWidget(createMemberPageScreen());
      await tester.pumpAndSettle();

      final Finder title = find.byKey(const Key('Title'));
      await tester.enterText(title, 'Something post\n title');
      await tester.pump();
      final Finder description = find.byKey(const Key('Description'));
      await tester.enterText(description, 'Description for\n the post');
      await tester.pump();
      final Finder formWidgetFinder = find.byType(Form);
      final Form formWidget = tester.widget(formWidgetFinder) as Form;
      final GlobalKey<FormState> formKey =
          formWidget.key as GlobalKey<FormState>;
      expect(formKey.currentState.validate(), isTrue);
    });
  });
}

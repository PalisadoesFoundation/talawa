import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/post_modal.dart';

import '../../helpers/test_helpers.dart';

const Key modalKey = Key("modalKey");
Widget customModalClass([
  Function(Post)? function,
  Function(Post)? deletePost,
  Post? post,
]) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: Scaffold(
      body: PostBottomModal(
        post: post ?? getPostMockModel(),
        function: function,
        deletePost: deletePost,
      ),
    ),
  );
}

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

  TestWidgetsFlutterBinding.ensureInitialized();
  group("Test for PostModal widget", () {
    testWidgets('Test if Post Modal is displayed', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(customModalClass());
        await tester.pump();
        expect(find.byKey(modalKey), findsOneWidget);
      });
    });
  });

  testWidgets('Check for PostModal children', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(customModalClass());
      await tester.pump();
      expect(
        find.descendant(
          of: find.byKey(modalKey),
          matching: find
              .descendant(
                of: find.byType(Column),
                matching: find.byType(Center),
              )
              .first,
        ),
        findsWidgets,
      );
      expect(
        find.descendant(
          of: find.byType(Center),
          matching: find.byType(Row),
        ),
        findsOneWidget,
      );
      expect(
        find
            .descendant(
              of: find.byType(Row),
              matching: find.descendant(
                of: find.byType(Padding),
                matching: find.byType(Icon),
              ),
            )
            .first,
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(Row),
          matching: find.byType(TextButton),
        ),
        findsOneWidget,
      );
    });
  });
  testWidgets('Check for delete functionality', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(customModalClass());
      final deleteButton = find.byIcon(Icons.delete);
      expect(deleteButton, findsOneWidget);
      await tester.tap(find.text('The post was deleted'));
      await tester.pump();
      expect(find.byType(AlertDialog), findsOneWidget);
      await tester.tap(find.text('No'));
      await tester.pump();

      expect(find.byType(AlertDialog), findsNothing);
      await tester.tap(find.text('Yes'));
      await tester.pump();

      expect(
        find.text('Post was deleted if you had the rights!'),
        findsOneWidget,
      );
      expect(find.byType(AlertDialog), findsNothing);
    });
  });

  testWidgets('Test for Report icon', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(customModalClass());
      await tester.pump();
      await tester.tap(find.text('Report the post to the Admin'));
      await tester.pump();
      expect(
        find.text('Your Report has been sent to the Admin'),
        findsOneWidget,
      );
    });
  });
}

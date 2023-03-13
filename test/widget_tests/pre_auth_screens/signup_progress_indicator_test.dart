// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/signup_progress_indicator.dart';
import 'package:timelines/timelines.dart';

Widget createSignupProgressIndicator() {
  return MaterialApp(
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: SignupProgressIndicator(
        key: const Key('pgIndicator'),
        currentPageIndex: 1,
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  group('Test for SignupProgressIndicator', () {
    testWidgets('Check if SignupProgressIndicator widget shows up',
        (tester) async {
      await tester.pumpWidget(createSignupProgressIndicator());
      await tester.pump();

      expect(find.byType(Timeline), findsOneWidget);
      expect(find.byType(DotIndicator), findsNWidgets(3));
    });

    testWidgets('Check dotindicator color', (tester) async {
      await tester.pumpWidget(createSignupProgressIndicator());
      await tester.pump();

      final dotIndicatorFinder = find.byType(DotIndicator);
      final dotIndicator = tester.widgetList(dotIndicatorFinder);

      expect(
        (dotIndicator.elementAt(0) as DotIndicator).color,
        const Color(0xFF008A37),
      );
      expect(
        (dotIndicator.elementAt(1) as DotIndicator).color,
        const Color(0xFF008A37),
      );
      expect(
        (dotIndicator.elementAt(2) as DotIndicator).color,
        const Color(0xFF737373),
      );
    });
    testWidgets('Check dotindicator icon', (tester) async {
      await tester.pumpWidget(createSignupProgressIndicator());
      await tester.pump();

      final dotIndicatorFinder = find.byType(DotIndicator);
      final dotIndicator = tester.widgetList(dotIndicatorFinder);

      expect(
        (dotIndicator.elementAt(0) as DotIndicator).child,
        isA<Icon>(),
      );
    });
  });
}

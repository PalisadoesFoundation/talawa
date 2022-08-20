import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/views/after_auth_screens/requests/request_page.dart';

import '../../../helpers/test_helpers.dart';

Widget requestPage() => const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: RequestPage(),
    );

void main() {
  SizeConfig().test();
  registerServices();
  registerViewModels();

  group('RequestPage', () {
    testWidgets('RequestPage UI Test', (WidgetTester tester) async {
      await tester.pumpWidget(requestPage());
      await tester.pump();
      expect(find.byType(RequestPage), findsOneWidget);
    });
  });

  group("Testing app bar properties and contents", () {
    testWidgets("Testing if app bar shows up", (tester) async {
      await tester.pumpWidget(requestPage());
      await tester.pump();
      final appBar = find.byType(AppBar);
      final appBarWidget = tester.firstWidget(appBar) as AppBar;
      expect(appBar, findsOneWidget);
      expect(appBarWidget.elevation, 0.0);
    });

    testWidgets("Testing title in app bar", (tester) async {
      await tester.pumpWidget(requestPage());
      await tester.pump();
      final appBar = find.byType(AppBar);
      final appBarWidget = tester.firstWidget(appBar) as AppBar;
      final title = find.descendant(
        of: find.byType(AppBar),
        matching: find.byType(Text),
      );
      expect(appBarWidget.title, tester.firstWidget<Text>(title));
      expect(appBarWidget.centerTitle, true);
      expect(
        (appBarWidget.title as Text?)?.data,
        'Requests',
      );
    });
  });
  // group("Request screen test", () {
  //   testWidgets("Request Card shows up", (tester) async{
  //     await tester.pumpWidget(requestPage());
  //     await tester.pump();
  //     expect(find.byType(RequestCard), findsOneWidget);
  //   });
  // });
}

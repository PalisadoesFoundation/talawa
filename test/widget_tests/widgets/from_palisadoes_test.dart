import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

Widget createFromPalisadoes() {
  return const MaterialApp(
    localizationsDelegates: [
      AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: FromPalisadoes(),
    ),
  );
}

void main() {
  SizeConfig().test();
  group('Test for FromPalisadoes', () {
    testWidgets('Check if FromPalisadoes widget shows up', (tester) async {
      await tester.pumpWidget(createFromPalisadoes());
      await tester.pump();

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('Check if from Palisadoes text shows up', (tester) async {
      await tester.pumpWidget(createFromPalisadoes());
      await tester.pump();

      expect(find.byType(Text), findsNWidgets(2));
      expect(find.textContaining('from'), findsOneWidget);
      expect(find.textContaining('PALISADOES'), findsOneWidget);
    });
  });
}

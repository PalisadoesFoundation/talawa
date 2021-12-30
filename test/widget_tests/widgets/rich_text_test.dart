import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/rich_text.dart';

const List<Map<String, dynamic>> words = [
  {
    'text': 'Hello',
    'textStyle': TextStyle(color: Colors.red, fontSize: 20),
  },
  {
    'text': 'Hello',
    'textStyle': TextStyle(color: Colors.black, fontSize: 10),
  },
  {
    'text': 'Hello',
    'textStyle': TextStyle(color: Colors.black, fontSize: 10),
  }
];

Widget createCustomRichText(String locale) {
  return MaterialApp(
    locale: Locale(locale),
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
    home: const CustomRichText(key: Key('richText'), words: words),
  );
}

void main() {
  group('Tests for CustomRichText widget', () {
    testWidgets('Check if CustomRichText shows up', (tester) async {
      await tester.pumpWidget(createCustomRichText('en'));
      await tester.pump();

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('Check for TextSpan(s) (en)', (tester) async {
      await tester.pumpWidget(createCustomRichText('en'));
      await tester.pump();

      // Since TextSpan isn't a widget, only way to check if it worked correctly
      // is by looking at the text
      expect(
          (tester.firstWidget(find.byType(RichText)) as RichText)
              .text
              .toPlainText(),
          'Hello Hello Hello ');
    });

    testWidgets('Check for individual TextSpan(s) (en)', (tester) async {
      await tester.pumpWidget(createCustomRichText('en'));
      await tester.pump();

      // First
      expect(
        (tester.firstWidget(find.byType(RichText)) as RichText).text.style,
        isA<TextStyle>()
          ..having((style) => style.color, 'Color', Colors.red)
          ..having((style) => style.fontSize, 'Font size', 20.0),
      );

      // Second
      expect(
        (((tester.firstWidget(find.byType(RichText)) as RichText).text
                    as TextSpan)
                .children![0])
            .style,
        isA<TextStyle>()
          ..having((style) => style.color, 'Color', Colors.black)
          ..having((style) => style.fontSize, 'Font size', 10.0),
      );
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/language_icon.dart';

import 'painter_test_helpers.dart';

void main() {
  group('LanguageIcon Painter Tests', () {
    testWidgets('should render LanguageIcon correctly (golden test)',
        (WidgetTester tester) async {
      const key = ValueKey('language_icon_painter');
      await tester.pumpWidget(
        buildPainterTestWidget(
          painter: LanguageIcon(),
          key: key,
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byKey(key),
        matchesGoldenFile('../../goldens/goldens/language_icon.png'),
      );
    });

    test('LanguageIcon shouldRepaint returns false', () {
      final painter1 = LanguageIcon();
      final painter2 = LanguageIcon();

      expect(painter1.shouldRepaint(painter2), isFalse);
    });

    runPaintSmokeTests(() => LanguageIcon());
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/telegram_logo.dart';

import 'painter_test_helpers.dart';

void main() {
  group('TelegramLogo Painter Tests', () {
    setUp(() {
      setupPainterGoldenComparator();
    });

    tearDown(() {
      tearDownPainterGoldenComparator();
    });

    testWidgets('should render TelegramLogo correctly (golden test)',
        (WidgetTester tester) async {
      const key = ValueKey('telegram_logo_painter');
      await tester.pumpWidget(
        buildPainterTestWidget(
          painter: TelegramLogo(),
          key: key,
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byKey(key),
        matchesGoldenFile('goldens/goldens/telegram_logo.png'),
      );
    });

    test('TelegramLogo shouldRepaint returns false', () {
      final painter1 = TelegramLogo();
      final painter2 = TelegramLogo();

      expect(painter1.shouldRepaint(painter2), isFalse);
    });

    runPaintSmokeTests(() => TelegramLogo());
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/telegram_logo.dart';

void main() {
  group('TelegramLogo Painter Tests', () {
    testWidgets('should render TelegramLogo correctly (golden test)',
        (WidgetTester tester) async {
      // Build a CustomPaint widget with TelegramLogo painter
      const key = ValueKey('telegram_logo_painter');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  key: key,
                  painter: TelegramLogo(),
                ),
              ),
            ),
          ),
        ),
      );

      // Wait for the widget to settle
      await tester.pumpAndSettle();

      // Compare with golden file
      await expectLater(
        find.byKey(key),
        matchesGoldenFile('goldens/telegram_logo.png'),
      );
    });

    test('TelegramLogo shouldRepaint returns true', () {
      // Create two instances of TelegramLogo
      final painter1 = TelegramLogo();
      final painter2 = TelegramLogo();

      // TelegramLogo should return true (always repaints)
      expect(painter1.shouldRepaint(painter2), isTrue);
    });

    test('TelegramLogo shouldRepaint with same instance returns true', () {
      // Create one instance
      final painter = TelegramLogo();

      // Even with the same instance, should return true
      expect(painter.shouldRepaint(painter), isTrue);
    });
  });
}

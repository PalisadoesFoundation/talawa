import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/language_icon.dart';

void main() {
  group('LanguageIcon Painter Tests', () {
    testWidgets('should render LanguageIcon correctly (golden test)',
        (WidgetTester tester) async {
      // Build a CustomPaint widget with LanguageIcon painter
      const key = ValueKey('language_icon_painter');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  key: key,
                  painter: LanguageIcon(),
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
        matchesGoldenFile('goldens/language_icon.png'),
      );
    });

    test('LanguageIcon shouldRepaint returns false', () {
      // Create two instances of LanguageIcon
      final painter1 = LanguageIcon();
      final painter2 = LanguageIcon();

      // LanguageIcon should return false (never repaints)
      expect(painter1.shouldRepaint(painter2), isFalse);
    });

    test('LanguageIcon shouldRepaint with same instance returns false', () {
      // Create one instance
      final painter = LanguageIcon();

      // Even with the same instance, should return false
      expect(painter.shouldRepaint(painter), isFalse);
    });
  });
}

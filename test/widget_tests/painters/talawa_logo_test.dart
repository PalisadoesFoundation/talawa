import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';

void main() {
  group('AppLogo Painter Tests', () {
    testWidgets('should render AppLogo correctly (golden test)',
        (WidgetTester tester) async {
      // Build a CustomPaint widget with AppLogo painter
      const key = ValueKey('app_logo_painter');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  key: key,
                  painter: AppLogo(),
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
        matchesGoldenFile('goldens/talawa_logo.png'),
      );
    });

    test('AppLogo shouldRepaint returns true', () {
      // Create two instances of AppLogo
      final painter1 = AppLogo();
      final painter2 = AppLogo();

      // AppLogo should return true (always repaints)
      expect(painter1.shouldRepaint(painter2), isTrue);
    });

    test('AppLogo shouldRepaint with same instance returns true', () {
      // Create one instance
      final painter = AppLogo();

      // Even with the same instance, should return true
      expect(painter.shouldRepaint(painter), isTrue);
    });
  });
}

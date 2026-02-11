import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/whatsapp_logo.dart';

void main() {
  group('WhatsappLogo Painter Tests', () {
    testWidgets('should render WhatsappLogo correctly (golden test)',
        (WidgetTester tester) async {
      // Build a CustomPaint widget with WhatsappLogo painter
      const key = ValueKey('whatsapp_logo_painter');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  key: key,
                  painter: WhatsappLogo(),
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
        matchesGoldenFile('goldens/whatsapp_logo.png'),
      );
    });

    test('WhatsappLogo shouldRepaint returns true', () {
      // Create two instances of WhatsappLogo
      final painter1 = WhatsappLogo();
      final painter2 = WhatsappLogo();

      // WhatsappLogo should return true (always repaints)
      expect(painter1.shouldRepaint(painter2), isTrue);
    });

    test('WhatsappLogo shouldRepaint with same instance returns true', () {
      // Create one instance
      final painter = WhatsappLogo();

      // Even with the same instance, should return true
      expect(painter.shouldRepaint(painter), isTrue);
    });
  });
}

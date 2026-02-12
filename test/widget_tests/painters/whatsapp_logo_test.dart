import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/whatsapp_logo.dart';

import 'painter_test_helpers.dart';

void main() {
  group('WhatsappLogo Painter Tests', () {
    testWidgets('should render WhatsappLogo correctly (golden test)',
        (WidgetTester tester) async {
      const key = ValueKey('whatsapp_logo_painter');
      await tester.pumpWidget(
        buildPainterTestWidget(
          painter: WhatsappLogo(),
          key: key,
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byKey(key),
        matchesGoldenFile('goldens/whatsapp_logo.png'),
      );
    });

    test('WhatsappLogo shouldRepaint returns true', () {
      final painter1 = WhatsappLogo();
      final painter2 = WhatsappLogo();

      expect(painter1.shouldRepaint(painter2), isTrue);
    });

    runPaintSmokeTests(() => WhatsappLogo());
  });
}

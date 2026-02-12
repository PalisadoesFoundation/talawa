import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';

import 'painter_test_helpers.dart';

void main() {
  group('AppLogo Painter Tests', () {
    setUp(() {
      setupPainterGoldenComparator();
    });

    tearDown(() {
      tearDownPainterGoldenComparator();
    });

    testWidgets('should render AppLogo correctly (golden test)',
        (WidgetTester tester) async {
      const key = ValueKey('app_logo_painter');
      await tester.pumpWidget(
        buildPainterTestWidget(
          painter: AppLogo(),
          key: key,
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byKey(key),
        matchesGoldenFile('goldens/talawa_logo.png'),
      );
    });

    test('AppLogo shouldRepaint returns false', () {
      final painter1 = AppLogo();
      final painter2 = AppLogo();

      expect(painter1.shouldRepaint(painter2), isFalse);
    });

    runPaintSmokeTests(() => AppLogo());
  });
}

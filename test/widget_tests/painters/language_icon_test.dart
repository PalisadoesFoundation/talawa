import 'dart:ui' as ui;

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
        matchesGoldenFile('goldens/language_icon.png'),
      );
    });

    test('LanguageIcon shouldRepaint returns false', () {
      final painter1 = LanguageIcon();
      final painter2 = LanguageIcon();

      expect(painter1.shouldRepaint(painter2), isFalse);
    });

    group('LanguageIcon paint() method tests', () {
      test('paint() completes without throwing on normal size canvas', () {
        final painter = LanguageIcon();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(200, 200);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on zero size canvas', () {
        final painter = LanguageIcon();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size.zero;

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on 1x1 canvas', () {
        final painter = LanguageIcon();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(1, 1);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on oversized canvas', () {
        final painter = LanguageIcon();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(1000, 1000);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on non-square canvas', () {
        final painter = LanguageIcon();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(300, 150);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });
    });
  });
}

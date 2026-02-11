import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/telegram_logo.dart';

import 'painter_test_helpers.dart';

void main() {
  group('TelegramLogo Painter Tests', () {
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
        matchesGoldenFile('goldens/telegram_logo.png'),
      );
    });

    test('TelegramLogo shouldRepaint returns true', () {
      final painter1 = TelegramLogo();
      final painter2 = TelegramLogo();

      expect(painter1.shouldRepaint(painter2), isTrue);
    });

    group('TelegramLogo paint() method tests', () {
      test('paint() completes without throwing on normal size canvas', () {
        final painter = TelegramLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(200, 200);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on zero size canvas', () {
        final painter = TelegramLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size.zero;

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on 1x1 canvas', () {
        final painter = TelegramLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(1, 1);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on oversized canvas', () {
        final painter = TelegramLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(1000, 1000);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on non-square canvas', () {
        final painter = TelegramLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(300, 150);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });
    });
  });
}

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/talawa_logo.dart';

/// Helper function to build a test widget with a CustomPaint painter
Widget buildPainterTestWidget({
  required CustomPainter painter,
  required Key key,
  double width = 200,
  double height = 200,
}) {
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            key: key,
            painter: painter,
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('AppLogo Painter Tests', () {
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

    test('AppLogo shouldRepaint returns true', () {
      final painter1 = AppLogo();
      final painter2 = AppLogo();

      expect(painter1.shouldRepaint(painter2), isTrue);
    });

    group('AppLogo paint() method tests', () {
      test('paint() completes without throwing on normal size canvas', () {
        final painter = AppLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(200, 200);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on zero size canvas', () {
        final painter = AppLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size.zero;

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on 1x1 canvas', () {
        final painter = AppLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(1, 1);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on oversized canvas', () {
        final painter = AppLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(1000, 1000);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });

      test('paint() completes without throwing on non-square canvas', () {
        final painter = AppLogo();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        const size = Size(300, 150);

        expect(() => painter.paint(canvas, size), returnsNormally);
      });
    });
  });
}

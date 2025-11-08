// test/custom_painters/language_icon_test.dart
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/language_icon.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LanguageIcon painter tests', () {
    test('shouldRepaint always returns true', () {
      final painter = LanguageIcon();
      final old = _FakeCustomPainter();
      expect(painter.shouldRepaint(old), isTrue);
    });

    test('paint executes on a raw Canvas (PictureRecorder) without throwing',
        () {
      final recorder = ui.PictureRecorder();
      const size =  Size(200.0, 200.0);
      final canvas =
          Canvas(recorder, Rect.fromLTWH(0, 0, size.width, size.height));

      final painter = LanguageIcon();

      expect(() => painter.paint(canvas, size), returnsNormally);

      final picture = recorder.endRecording();
      expect(picture, isNotNull);
    });

    testWidgets('LanguageIcon renders inside a CustomPaint widget',
        (tester) async {
      final painter = LanguageIcon();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 48,
                height: 48,
                child: CustomPaint(
                  key: const Key('language_icon_paint'),
                  painter: painter,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byKey(const Key('language_icon_paint')), findsOneWidget);

      final render = tester.renderObject<RenderBox>(
        find.byKey(const Key('language_icon_paint')),
      );

      expect(render.size, equals(const Size(48, 48)));
    });
  });
}

class _FakeCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

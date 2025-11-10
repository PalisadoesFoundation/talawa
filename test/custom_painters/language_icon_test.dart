import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/custom_painters/language_icon.dart';

void main() {
  group('LanguageIcon painter tests', () {
    test('shouldRepaint always returns true', () {
      final painter = LanguageIcon();
      final old = _FakeCustomPainter();
      expect(painter.shouldRepaint(old), isTrue);
    });

    test(
        'shouldRepaint returns true even when old delegate is also LanguageIcon',
        () {
      final painter = LanguageIcon();
      final oldPainter = LanguageIcon();
      expect(painter.shouldRepaint(oldPainter), isTrue);
    });
    test('LanguageIcon matches golden reference', () async {
      const size = Size(100.0, 100.0);
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(
        recorder,
        Rect.fromPoints(Offset.zero, const Offset(100.0, 100.0)),
      );

      // Light background
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.grey[200]!,
      );

      final painter = LanguageIcon();
      painter.paint(canvas, size);

      final picture = recorder.endRecording();
      final image = await picture.toImage(100, 100);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final bytes = byteData!.buffer.asUint8List();

      final goldenFile = File('test/goldens/language_icon_golden.png');
      if (!goldenFile.existsSync()) {
        goldenFile.createSync(recursive: true);
        goldenFile.writeAsBytesSync(bytes);
      }

      await expectLater(
        bytes,
        matchesGoldenFile('test/goldens/language_icon_golden.png'),
      );
    });
    test('paint executes on a raw Canvas without throwing', () {
      final recorder = ui.PictureRecorder();
      const size = Size(200.0, 200.0);
      final canvas =
          Canvas(recorder, Rect.fromLTWH(0, 0, size.width, size.height));

      final painter = LanguageIcon();

      expect(() => painter.paint(canvas, size), returnsNormally);

      final picture = recorder.endRecording();
      expect(picture, isNotNull);
    });

    testWidgets('LanguageIcon renders correctly inside CustomPaint',
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

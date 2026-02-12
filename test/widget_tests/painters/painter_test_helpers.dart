import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Helper function to build a test widget with a CustomPaint painter.
///
/// Creates a standard MaterialApp scaffold with a CustomPaint widget for
/// testing custom painters in a consistent way across all tests.
///
/// **params**:
/// * `painter`: The CustomPainter instance to test.
/// * `key`: A unique key to identify the CustomPaint widget in tests.
/// * `width`: The width of the canvas (default: 200).
/// * `height`: The height of the canvas (default: 200).
///
/// **returns**:
/// * `Widget`: A MaterialApp containing the CustomPaint widget for testing.
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

/// Runs smoke tests for the [paint] method of a [CustomPainter].
///
/// Verifies that the [paint] method completes without throwing exceptions
/// for various standard and edge-case canvas sizes.
///
/// **params**:
/// * `createPainter`: A factory function that returns a new instance of the [CustomPainter] to test.
///
/// **returns**:
///   None
void runPaintSmokeTests(CustomPainter Function() createPainter) {
  group('paint() method smoke tests', () {
    final sizes = [
      const MapEntry('normal size', Size(200, 200)),
      const MapEntry('zero size', Size.zero),
      const MapEntry('minimal size', Size(1, 1)),
      const MapEntry('oversized', Size(1000, 1000)),
      const MapEntry('non-square', Size(300, 150)),
    ];

    for (final entry in sizes) {
      test('paint() completes without throwing on ${entry.key} canvas', () {
        final painter = createPainter();
        final recorder = ui.PictureRecorder();
        final canvas = Canvas(recorder);
        final size = entry.value;

        expect(() => painter.paint(canvas, size), returnsNormally);
      });
    }
  });
}

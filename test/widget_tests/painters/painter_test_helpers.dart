import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tolerant golden file comparator for painter tests only.
///
/// This comparator handles cross-platform rendering differences
/// (e.g., macOS dev vs Linux CI) by allowing up to 0.5% pixel difference.
/// Only used for painter tests to preserve strict comparison for other tests.
class _TolerantComparator extends LocalFileComparator {
  /// Creates a tolerant comparator.
  ///
  /// **params**:
  /// * `testUri`: The URI of the test directory.
  _TolerantComparator(super.testUri);

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final ComparisonResult result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (result.passed) {
      return true;
    }

    // Allow up to 0.5% difference to handle cross-platform rendering variations
    if (result.diffPercent <= 0.5) {
      debugPrint(
        'Golden file comparison passed with ${result.diffPercent.toStringAsFixed(2)}% difference (within 0.5% tolerance)',
      );
      return true;
    }

    // If difference is too large, call super.compare to generate failure artifacts
    debugPrint(
      'Golden file comparison failed: ${result.diffPercent.toStringAsFixed(2)}% difference (tolerance: 0.5%)',
    );
    return super.compare(imageBytes, golden);
  }
}

/// Sets up tolerant golden file comparator for painter tests.
///
/// Call this in setUp() for painter tests to enable cross-platform tolerance.
/// The original comparator is restored in tearDown().
///
/// **params**:
///   None
///
/// **returns**:
///   None
void setupPainterGoldenComparator() {
  goldenFileComparator = _TolerantComparator(
    Uri.parse('test/'),
  );
}

/// Restores the default golden file comparator.
///
/// Call this in tearDown() to restore strict comparison after painter tests.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void tearDownPainterGoldenComparator() {
  goldenFileComparator = LocalFileComparator(Uri.parse('test/'));
}


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

        // Cleanup to prevent memory leaks
        recorder.endRecording().dispose();
      });
    }
  });
}

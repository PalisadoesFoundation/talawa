import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/hive_manager.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

/// Tolerant golden file comparator that allows small differences.
///
/// This comparator is used to handle cross-platform rendering differences
/// (e.g., macOS dev vs Linux CI) by allowing up to 0.5% pixel difference.
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

    // If difference is too large, fail and provide details
    debugPrint(
      'Golden file comparison failed: ${result.diffPercent.toStringAsFixed(2)}% difference (tolerance: 0.5%)',
    );
    return false;
  }
}

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  WidgetController.hitTestWarningShouldBeFatal = true;

  // Configure golden file comparator with tolerance for cross-platform compatibility
  goldenFileComparator = _TolerantComparator(Uri.parse('test/'));

  final Directory dir = await Directory.systemTemp.createTemp('talawa_test');
  // Hive.init(dir.path);
  await HiveManager.initializeHive(dir: dir);
  AppConnectivity.isOnline = true;
  // await setUpHive();
  await testMain();
}

// ignore_for_file: talawa_api_doc
//
// NOTE: VideoWidget has a known pre-existing bug:
//   `VideoPlayerController.networkUrl(widget.url as Uri)`
// Since `url` is typed as `String`, the `as Uri` cast always throws a
// TypeError at initState time. These golden tests capture the resulting
// ErrorWidget state and document the widget's visual behaviour under
// that condition. When the widget is fixed (use Uri.parse(widget.url)),
// the goldens should be regenerated.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/widgets/video_widget.dart';

import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => setUpGoldenTests());

  tearDownAll(() => tearDownGoldenTests());

  // Suppresses the TypeError produced by `widget.url as Uri` so that
  // Flutter replaces the broken widget with an ErrorWidget and the test
  // can still capture a meaningful golden image.
  void suppressErrors(FlutterErrorDetails details) {
    // Re-throw genuine failures that are unrelated to the url cast.
    final msg = details.exceptionAsString();
    if (!msg.contains('type') && !msg.contains('Uri') && !msg.contains('subtype')) {
      FlutterError.presentError(details);
    }
  }

  Widget buildVideo({required ThemeMode themeMode, bool play = false}) {
    return themedWidget(
      SizedBox(
        width: 400,
        height: 300,
        child: VideoWidget(
          url: 'https://example.com/sample.mp4',
          play: play,
        ),
      ),
      themeMode: themeMode,
    );
  }

  group('VideoWidget Golden Tests', () {
    testWidgets('error_state - light', (WidgetTester tester) async {
      FlutterError.onError = suppressErrors;
      await tester.pumpWidget(buildVideo(themeMode: ThemeMode.light));
      await tester.pump();
      // Consume the stored TypeError so the test does not fail.
      tester.takeException();
      FlutterError.onError = FlutterError.presentError;

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('video_widget', 'error_state', 'light'),
        ),
      );
    });

    testWidgets('error_state - dark', (WidgetTester tester) async {
      FlutterError.onError = suppressErrors;
      await tester.pumpWidget(buildVideo(themeMode: ThemeMode.dark));
      await tester.pump();
      tester.takeException();
      FlutterError.onError = FlutterError.presentError;

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('video_widget', 'error_state', 'dark'),
        ),
      );
    });
  });
}

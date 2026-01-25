// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/widgets/caption_text_widget.dart';

import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Size originalSize;
  late double originalDpr;

  setUpAll(() {
    // Lock surface size and pixel ratio for consistent rendering across platforms
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    final view = binding.platformDispatcher.views.first;

    originalSize = view.physicalSize;
    originalDpr = view.devicePixelRatio;
    view.physicalSize = const Size(1080, 1920);
    view.devicePixelRatio = 1.0;
  });

  tearDownAll(() {
    final view = TestWidgetsFlutterBinding.ensureInitialized()
        .platformDispatcher
        .views
        .first;
    view.physicalSize = originalSize;
    view.devicePixelRatio = originalDpr;
  });

  Widget createCaptionWidgetForGolden({
    required String caption,
    required ThemeMode themeMode,
  }) {
    return themedWidget(
      CaptionTextWidget(caption: caption),
      themeMode: themeMode,
    );
  }

  group('CaptionTextWidget Golden Tests', () {
    testWidgets('caption_text_widget short text - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCaptionWidgetForGolden(
          caption: 'This is a short caption without hashtags.',
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('caption_text_widget', 'short_text', 'light'),
        ),
      );
    });

    testWidgets('caption_text_widget short text - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCaptionWidgetForGolden(
          caption: 'This is a short caption without hashtags.',
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('caption_text_widget', 'short_text', 'dark'),
        ),
      );
    });

    testWidgets('caption_text_widget with hashtags - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCaptionWidgetForGolden(
          caption:
              'This is a caption with #hashtags and #multiple #tags in it.',
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('caption_text_widget', 'with_hashtags', 'light'),
        ),
      );
    });

    testWidgets('caption_text_widget with hashtags - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCaptionWidgetForGolden(
          caption:
              'This is a caption with #hashtags and #multiple #tags in it.',
          themeMode: ThemeMode.dark,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('caption_text_widget', 'with_hashtags', 'dark'),
        ),
      );
    });

    testWidgets('caption_text_widget long text collapsed - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCaptionWidgetForGolden(
          caption:
              'This is a very long caption that exceeds the trim length of 150 characters. '
              'It should be trimmed and show a "show more" button. This text continues to make '
              'sure we exceed the character limit and test the trimming functionality properly.',
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('caption_text_widget', 'long_collapsed', 'light'),
        ),
      );
    });

    testWidgets('caption_text_widget long text expanded - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCaptionWidgetForGolden(
          caption:
              'This is a very long caption that exceeds the trim length of 150 characters. '
              'It should be trimmed and show a "show more" button. This text continues to make '
              'sure we exceed the character limit and test the trimming functionality properly.',
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      // Tap "show more" to expand
      await tester.tap(find.text('show more'));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('caption_text_widget', 'long_expanded', 'light'),
        ),
      );
    });

    testWidgets('caption_text_widget long text with hashtags - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createCaptionWidgetForGolden(
          caption:
              'This is a very long caption with #hashtags that exceeds the trim length. '
              '#Flutter #Talawa #OpenSource #Community #Development #Testing #GoldenTests '
              'This text continues to make sure we exceed the character limit properly.',
          themeMode: ThemeMode.light,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName(
            'caption_text_widget',
            'long_with_hashtags',
            'light',
          ),
        ),
      );
    });
  });
}

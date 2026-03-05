// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/widgets/rich_text.dart';

import 'golden_test_helpers.dart';

// ---------------------------------------------------------------------------
// Test data
// ---------------------------------------------------------------------------

/// A single word — simplest possible input.
const List<Map<String, dynamic>> singleWord = [
  {
    'text': 'Hello',
    'textStyle': TextStyle(color: Colors.red, fontSize: 20),
  },
];

/// Multiple words with different styles — typical real-world usage.
const List<Map<String, dynamic>> multipleWords = [
  {
    'text': 'Welcome',
    'textStyle': TextStyle(
      color: Color(0xFF008A37),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  },
  {
    'text': 'to',
    'textStyle': TextStyle(color: Colors.black54, fontSize: 14),
  },
  {
    'text': 'Talawa',
    'textStyle': TextStyle(
      color: Color(0xFF008A37),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  },
];

// ---------------------------------------------------------------------------
// Helper
// ---------------------------------------------------------------------------

/// Wraps [CustomRichText] inside [themedWidget] so localization + theme are
/// available.  We center it in a fixed-size box so the golden image is stable
/// regardless of screen size.
Widget buildRichText({
  required List<Map<String, dynamic>> words,
  required ThemeMode themeMode,
}) {
  return themedWidget(
    Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomRichText(
          key: const Key('richText'),
          words: words,
        ),
      ),
    ),
    themeMode: themeMode,
  );
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Lock the screen size so every platform produces the same pixels.
  setUpAll(() => setUpGoldenTests());
  tearDownAll(() => tearDownGoldenTests());

  group('CustomRichText Golden Tests', () {
    // ── single word ────────────────────────────────────────────────────────
    testWidgets('single_word - light theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildRichText(words: singleWord, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(CustomRichText),
        matchesGoldenFile(
          goldenFileName('rich_text', 'single_word', 'light'),
        ),
      );
    });

    testWidgets('single_word - dark theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildRichText(words: singleWord, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(CustomRichText),
        matchesGoldenFile(
          goldenFileName('rich_text', 'single_word', 'dark'),
        ),
      );
    });

    // ── multiple words ─────────────────────────────────────────────────────
    testWidgets('multiple_words - light theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildRichText(words: multipleWords, themeMode: ThemeMode.light),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(CustomRichText),
        matchesGoldenFile(
          goldenFileName('rich_text', 'multiple_words', 'light'),
        ),
      );
    });

    testWidgets('multiple_words - dark theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildRichText(words: multipleWords, themeMode: ThemeMode.dark),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(CustomRichText),
        matchesGoldenFile(
          goldenFileName('rich_text', 'multiple_words', 'dark'),
        ),
      );
    });
  });
}

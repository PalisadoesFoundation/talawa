// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/widgets/custom_avatar.dart';

import 'golden_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => setUpGoldenTests());
  tearDownAll(() => tearDownGoldenTests());

  Widget createAvatarForGolden({
    required ThemeMode themeMode,
    required bool isImageNull,
    String? firstAlphabet,
    double fontSize = 40,
    double maxRadius = 16,
  }) {
    return themedWidget(
      Center(
        child: CustomAvatar(
          isImageNull: isImageNull,
          firstAlphabet: firstAlphabet,
          imageUrl: null, // Golden tests only cover text-based avatars
          fontSize: fontSize,
          maxRadius: maxRadius,
        ),
      ),
      themeMode: themeMode,
    );
  }

  group('CustomAvatar Golden Tests', () {
    testWidgets('custom_avatar with letter A - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.light,
          isImageNull: true,
          firstAlphabet: 'A',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'letter_a', 'light'),
        ),
      );
    });

    testWidgets('custom_avatar with letter A - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.dark,
          isImageNull: true,
          firstAlphabet: 'A',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'letter_a', 'dark'),
        ),
      );
    });

    testWidgets('custom_avatar with letter Z - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.light,
          isImageNull: true,
          firstAlphabet: 'Z',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'letter_z', 'light'),
        ),
      );
    });

    testWidgets('custom_avatar with letter Z - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.dark,
          isImageNull: true,
          firstAlphabet: 'Z',
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'letter_z', 'dark'),
        ),
      );
    });

    testWidgets('custom_avatar with question mark fallback - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.light,
          isImageNull: true,
          firstAlphabet: null,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'fallback', 'light'),
        ),
      );
    });

    testWidgets('custom_avatar with question mark fallback - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.dark,
          isImageNull: true,
          firstAlphabet: null,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'fallback', 'dark'),
        ),
      );
    });

    testWidgets('custom_avatar large size - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.light,
          isImageNull: true,
          firstAlphabet: 'T',
          fontSize: 60,
          maxRadius: 40,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'large_size', 'light'),
        ),
      );
    });

    testWidgets('custom_avatar large size - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.dark,
          isImageNull: true,
          firstAlphabet: 'T',
          fontSize: 60,
          maxRadius: 40,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'large_size', 'dark'),
        ),
      );
    });

    testWidgets('custom_avatar small size - light theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.light,
          isImageNull: true,
          firstAlphabet: 'S',
          fontSize: 20,
          maxRadius: 12,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'small_size', 'light'),
        ),
      );
    });

    testWidgets('custom_avatar small size - dark theme',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        createAvatarForGolden(
          themeMode: ThemeMode.dark,
          isImageNull: true,
          firstAlphabet: 'S',
          fontSize: 20,
          maxRadius: 12,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile(
          goldenFileName('custom_avatar', 'small_size', 'dark'),
        ),
      );
    });
  });
}

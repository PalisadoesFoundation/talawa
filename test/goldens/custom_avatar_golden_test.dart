// ignore_for_file: talawa_api_doc
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/widgets/custom_avatar.dart';

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

  Widget createAvatarForGolden({
    required ThemeMode themeMode,
    required bool isImageNull,
    String? firstAlphabet,
    String? imageUrl,
    double fontSize = 40,
    double maxRadius = 16,
  }) {
    return themedWidget(
      Center(
        child: CustomAvatar(
          isImageNull: isImageNull,
          firstAlphabet: firstAlphabet,
          imageUrl: imageUrl,
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
  });
}

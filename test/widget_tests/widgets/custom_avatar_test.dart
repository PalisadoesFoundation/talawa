import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talawa/widgets/custom_avatar.dart';

/// main function.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  group('CustomAvatar', () {
    testWidgets('renders correctly when image is not null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomAvatar(
            isImageNull: false,
            imageUrl: 'https://example.com/image.jpg',
            firstAlphabet: 'A',
            fontSize: 40,
            maxRadius: 16,
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('renders correctly when image is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomAvatar(
            isImageNull: true,
            firstAlphabet: 'A',
            fontSize: 40,
            maxRadius: 16,
          ),
        ),
      );

      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('renders correctly with default fontSize and maxRadius',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomAvatar(
            isImageNull: true,
            firstAlphabet: 'A',
          ),
        ),
      );

      final textFinder = find.text('A');
      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style!.fontSize, 40);

      final circleAvatarFinder = find.byType(CircleAvatar);
      final circleAvatarWidget =
          tester.widget<CircleAvatar>(circleAvatarFinder);
      expect(circleAvatarWidget.maxRadius, 16);
    });
  });

  testWidgets(
      'CircularAvatar with error icon is shown when image fails to load',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: CustomAvatar(
          isImageNull: false,
          imageUrl: ' ',
          firstAlphabet: 'A',
          fontSize: 40,
          maxRadius: 16,
        ),
      ),
    );

    await widgetTester.pump(const Duration(seconds: 5));

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CachedNetworkImage &&
            widget.errorWidget != null &&
            widget.errorWidget is Function &&
            widget.errorWidget!(
              widgetTester.binding.rootElement!,
              '',
              Exception(),
            ) is CircleAvatar &&
            (widget.errorWidget!(
              widgetTester.binding.rootElement!,
              '',
              Exception(),
            ) as CircleAvatar)
                .child is Icon &&
            ((widget.errorWidget!(
                  widgetTester.binding.rootElement!,
                  '',
                  Exception(),
                ) as CircleAvatar)
                        .child as Icon?)
                    ?.icon ==
                Icons.error,
      ),
      findsOneWidget,
    );
  });
  testWidgets('renders correctly when image is null and checks for theme color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomAvatar(
          isImageNull: true,
          firstAlphabet: 'A',
          fontSize: 40,
          maxRadius: 16,
        ),
      ),
    );

    final circleAvatarFinder = find.byType(CircleAvatar);
    final circleAvatarWidget = tester.widget<CircleAvatar>(circleAvatarFinder);
    expect(
        circleAvatarWidget.backgroundColor,
        Theme.of(tester.element(circleAvatarFinder))
            .iconTheme
            .color!
            .withOpacity(0.2));
  });

  testWidgets(
      'renders correctly when image is not null and checks for theme color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomAvatar(
          isImageNull: false,
          imageUrl: 'https://example.com/image.jpg',
          firstAlphabet: 'A',
          fontSize: 40,
          maxRadius: 16,
        ),
      ),
    );

    final cachedNetworkImageFinder = find.byType(CachedNetworkImage);
    final cachedNetworkImageWidget =
        tester.widget<CachedNetworkImage>(cachedNetworkImageFinder);
    expect(cachedNetworkImageWidget.imageUrl, 'https://example.com/image.jpg');
  });

  testWidgets('renders placeholder correctly when image is loading',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomAvatar(
          isImageNull: false,
          imageUrl: 'https://example.com/image.jpg',
          firstAlphabet: 'A',
          fontSize: 40,
          maxRadius: 16,
        ),
      ),
    );

    await tester.pump(Duration.zero); // Start loading image

    expect(find.byType(Shimmer), findsOneWidget);
  });

  testWidgets('CircleAvatar is shown when image fails to load',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: CustomAvatar(
          isImageNull: false,
          imageUrl: ' ',
          firstAlphabet: 'A',
          fontSize: 40,
          maxRadius: 16,
        ),
      ),
    );

    await widgetTester.pump(const Duration(seconds: 5));

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CachedNetworkImage &&
            widget.errorWidget != null &&
            widget.errorWidget is Function &&
            widget.errorWidget!(
              widgetTester.binding.rootElement!,
              '',
              Exception(),
            ) is CircleAvatar,
      ),
      findsOneWidget,
    );
  });
}

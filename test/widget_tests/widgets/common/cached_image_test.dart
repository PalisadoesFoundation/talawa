import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/widgets/common/cached_image.dart';

void main() {
  group('AppCachedImage', () {
    testWidgets('renders CachedNetworkImage with correct parameters',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        const String testUrl = 'https://example.com/image.png';
        const double testWidth = 100;
        const double testHeight = 100;
        const BoxFit testFit = BoxFit.cover;

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCachedImage(
                url: testUrl,
                width: testWidth,
                height: testHeight,
                fit: testFit,
              ),
            ),
          ),
        );

        final cachedImageFinder = find.byType(CachedNetworkImage);
        expect(cachedImageFinder, findsOneWidget);

        final CachedNetworkImage cachedImage =
            tester.widget(cachedImageFinder) as CachedNetworkImage;
        expect(cachedImage.imageUrl, testUrl);
        expect(cachedImage.width, testWidth);
        expect(cachedImage.height, testHeight);
        expect(cachedImage.fit, testFit);
        expect(cachedImage.memCacheWidth, 1000);
      });
    });

    testWidgets('shows placeholder while loading', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCachedImage(url: 'https://example.com/image.png'),
            ),
          ),
        );

        // Verify that the placeholder (ProgressIndicator) is shown initially
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    testWidgets('shows error widget on failure', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCachedImage(url: 'https://example.com/broken.png'),
            ),
          ),
        );

        // Trigger error builder
        final cachedImageFinder = find.byType(CachedNetworkImage);
        final CachedNetworkImage cachedImage =
            tester.widget(cachedImageFinder) as CachedNetworkImage;

        // Manually invoke the error widget builder
        final Widget errorWidget = cachedImage.errorWidget!(
          tester.element(cachedImageFinder),
          'https://example.com/broken.png',
          Exception('Load failed'),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: errorWidget,
            ),
          ),
        );

        expect(find.byIcon(Icons.broken_image), findsOneWidget);
      });
    });

    testWidgets('uses default height 120 for placeholder when height is null',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppCachedImage(url: 'https://example.com/image.png'),
            ),
          ),
        );

        final CachedNetworkImage cachedImage = tester
            .widget(find.byType(CachedNetworkImage)) as CachedNetworkImage;

        // Invoke placeholder and verify SizedBox height
        final Widget placeholder = cachedImage.placeholder!(
          tester.element(find.byType(CachedNetworkImage)),
          'https://example.com/image.png',
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: placeholder)));

        final SizedBox sizedBox =
            tester.widget(find.byType(SizedBox)) as SizedBox;
        expect(sizedBox.height, 120);
      });
    });
  });
}

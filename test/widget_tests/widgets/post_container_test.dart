import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/widgets/post_container.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// main function.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  const photoUrl =
      'https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg';
  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  group('PostContainer Widget Tests', () {
    testWidgets('PostContainer should be built without crashing',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });

        expect(find.byType(PostContainer), findsOneWidget);
      });
    });
    testWidgets(
        'PostContainer should display an image when photoUrl is provided',
        (tester) async {
      await mockNetworkImages(
        () async => tester.pumpWidget(
          const MaterialApp(
            home: PostContainer(
              photoUrl: photoUrl,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets(
        'PostContainer should not display an image when photoUrl is null',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: PostContainer(photoUrl: null),
        ),
      );
      expect(find.byType(Image), findsNothing);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets(
        'initState should be called and variables should be initialized correctly',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });
        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));
        expect(postContainerState.startedPlaying, isFalse);
        expect(postContainerState.inView, isTrue);
        expect(find.byType(PostContainer), findsOneWidget);
      });
    });

    testWidgets(
        'PageController should be disposed when widget is removed from tree',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });
        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));
        final pageController = postContainerState.controller;

        await tester.pumpWidget(
          MaterialApp(home: Container()),
        );

        try {
          pageController.position;
          fail('Should throw AssertionError');
        } catch (e) {
          expect(e, isInstanceOf<AssertionError>());
        }
      });
    });

    testWidgets('PostContainer should change inView to true when visible',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });

        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));
        expect(postContainerState.inView, isTrue);
      });
    });

    testWidgets('generates unique keys for each instance', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          const MaterialApp(home: PostContainer(photoUrl: photoUrl)),
        );
        final firstKey = tester
            .widget<VisibilityDetector>(find.byType(VisibilityDetector))
            .key;

        await tester.pumpWidget(
          const MaterialApp(home: PostContainer(photoUrl: photoUrl)),
        );
        final secondKey = tester
            .widget<VisibilityDetector>(find.byType(VisibilityDetector))
            .key;

        expect(firstKey != secondKey, isTrue);
      });
    });

    testWidgets(
        'onVisibilityChanged callback should update inView state if image is fully visible',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });

        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));

        // Get the VisibilityDetector widget
        final visibilityDetector = tester.widget<VisibilityDetector>(
          find.byType(VisibilityDetector),
        );

        // Test fully visible case i.e visibleFraction = 1  (> 0.5)
        const fullVisInfo = VisibilityInfo(
          key: Key('test'),
          size: Size(100, 100),
          visibleBounds: Rect.fromLTWH(0, 0, 100, 100),
        );
        visibilityDetector.onVisibilityChanged!(fullVisInfo);
        expect(postContainerState.inView, isTrue);
      });
    });

    testWidgets(
        'onVisibilityChanged callback should update inView state if image is partially visible',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });

        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));

        final visibilityDetector = tester.widget<VisibilityDetector>(
          find.byType(VisibilityDetector),
        );

        // Test partially visible case i.e visibleFraction <= 0.5
        const partialVisInfo1 = VisibilityInfo(
          key: Key('test'),
          size: Size(100, 100),
          visibleBounds: Rect.fromLTWH(0, 0, 49, 100),
        );
        visibilityDetector.onVisibilityChanged!(partialVisInfo1);
        expect(postContainerState.inView, isFalse);

        await tester.pump();

        // Test partially visible case i.e visibleFraction > 0.5
        const partialVisInfo2 = VisibilityInfo(
          key: Key('test'),
          size: Size(100, 100),
          visibleBounds: Rect.fromLTWH(0, 0, 51, 100),
        );
        visibilityDetector.onVisibilityChanged!(partialVisInfo2);
        expect(postContainerState.inView, isTrue);
      });
    });

    testWidgets(
        'onVisibilityChanged callback should update inView state if image is invisible ',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });

        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));

        final visibilityDetector = tester.widget<VisibilityDetector>(
          find.byType(VisibilityDetector),
        );

        // Test fully hidden case i.e visibleFraction = 0  (< 0.5)
        const hiddenVisInfo = VisibilityInfo(
          key: Key('test'),
          size: Size(100, 100),
          visibleBounds: Rect.zero,
        );
        visibilityDetector.onVisibilityChanged!(hiddenVisInfo);
        expect(postContainerState.inView, isFalse);
      });
    });

    testWidgets(
        'onVisibilityChanged should maintain state during rapid updates',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl: photoUrl,
              ),
            ),
          );
        });

        final visibilityDetector = tester.widget<VisibilityDetector>(
          find.byType(VisibilityDetector),
        );
        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));

        // Test sequence of different visibility states
        final visibilityStates = [
          const Rect.fromLTWH(0, 0, 80, 100), // 80% visible
          const Rect.fromLTWH(0, 0, 30, 100), // 30% visible
          const Rect.fromLTWH(0, 0, 60, 100), // 60% visible
          const Rect.fromLTWH(0, 0, 20, 100), // 20% visible
          const Rect.fromLTWH(0, 0, 90, 100), // 90% visible
        ];

        for (final bounds in visibilityStates) {
          final visInfo = VisibilityInfo(
            key: const Key('test'),
            size: const Size(100, 100),
            visibleBounds: bounds,
          );
          visibilityDetector.onVisibilityChanged!(visInfo);

          // Check if inView matches the expected state based on visibleFraction
          expect(
            postContainerState.inView,
            visInfo.visibleFraction > 0.5,
            reason: 'Failed for visible bounds: $bounds',
          );
        }
      });
    });
  });
}

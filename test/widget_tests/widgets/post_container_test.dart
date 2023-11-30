import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:talawa/widgets/post_container.dart';

/// main function.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  group('PostContainer Widget Tests', () {
    testWidgets('PostContainer should be built without crashing',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl:
                    'https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg',
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
              photoUrl:
                  'https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg',
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
                photoUrl:
                    'https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg',
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
                photoUrl:
                    'https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg',
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
                photoUrl:
                    'https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg',
              ),
            ),
          );
        });

        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));
        expect(postContainerState.inView, isTrue);
      });
    });

    testWidgets('PostContainer should change inView to false when not visible',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: PostContainer(
                photoUrl:
                    'https://www.fcbarcelona.com/fcbarcelona/photo/2022/08/02/ae5252d1-b79b-4950-9e34-6e67fac09bb0/LeoMessi20092010_pic_fcb-arsenal62.jpg',
              ),
            ),
          );
        });

        final postContainerState =
            tester.state<PostContainerState>(find.byType(PostContainer));
        postContainerState.inView = false;
        expect(postContainerState.inView, isFalse);
      });
    });
  });
}

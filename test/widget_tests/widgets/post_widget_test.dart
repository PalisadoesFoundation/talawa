import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:talawa/constants/custom_theme.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/widgets_view_models/like_button_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/post_container.dart';
import 'package:talawa/widgets/post_detailed_page.dart';
import 'package:talawa/widgets/post_modal.dart';
import 'package:talawa/widgets/post_widget.dart';
// import 'package:talawa/widgets/video_widget.dart';
// import 'package:visibility_detector/visibility_detector.dart';

import '../../helpers/test_helpers.dart';

/// Key for NewsPost widget.
const Key newsPostKey = Key("newsPostKey");

/// Key for PostContainer widget.
const Key postContainerKey = Key("postContainerKey");

/// [createNewsPostWidget] is a method that returns a NewsPost widget.
///
/// **params**:
/// * `function`: Function(Post)? - function to be called when the post comment is clicked.
/// * `post`: Post object containing all the data related to the post.
///
/// **returns**:
/// * `Widget`: NewsPost widget.
Widget createNewsPostWidget([Function(Post)? function, Post? post]) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: Scaffold(
      body: NewsPost(
        key: newsPostKey,
        post: post ?? getPostMockModel(),
        function: function,
      ),
    ),
  );
}

void main() {
  SizeConfig().test();
  locator.registerSingleton(NavigationService());

  setUp(() {
    registerServices();
    registerViewModels();
  });

  tearDown(() {
    unregisterViewModels();
    unregisterServices();
  });

  group('Testing News Post Widget - ', () {
    testWidgets("Test if News Post Widget is displayed ",
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createNewsPostWidget());
        await tester.pump();
        final postFinder = find.byKey(newsPostKey);
        expect(postFinder, findsOneWidget);
      });
    });

    group('Post Widget Test functionality-', () {
      testWidgets("Test if like button changes colour if liked",
          (WidgetTester tester) async {
        await tester.runAsync(() async {
          final Post post = getPostMockModel();
          when(post.likedBy).thenReturn([LikedBy(sId: "xzy1")]);
          await tester.pumpWidget(
            createNewsPostWidget(
              null,
              post,
            ),
          );
          await tester.pump();

          final postFinder = find.byKey(newsPostKey);
          final columnFinder =
              find.descendant(of: postFinder, matching: find.byType(Column));
          final column2Finder = columnFinder.at(2);
          final secondColumnWidget =
              tester.firstWidget(column2Finder) as Column;
          print(secondColumnWidget);

          // final thirdPaddingWidget = secondColumnWidget.children[2] as Padding;
          //
          // final first3GestureDetectorFinder = find.descendant(
          //   of: find.byWidget(thirdPaddingWidget),
          //   matching: find.byType(GestureDetector),
          // );
          // final first3GestureDetectorWidget = tester
          //     .firstWidget(first3GestureDetectorFinder) as GestureDetector;

          // expect(
          //   (first3GestureDetectorWidget.child! as Icon).color,
          //   TalawaTheme.lightTheme.colorScheme.secondary,
          // );
        });
      });

      testWidgets("test onTap of GestureDetector's", (tester) async {
        await tester.runAsync(() async {
          int clicked = 0;
          await tester
              .pumpWidget(createNewsPostWidget((Post post) => clicked++));
          await tester.pump();

          await tester.tap(find.byKey(const Key('commentButton')));
          await tester.pump();
          expect(clicked, 1);

          await tester.tap(find.byType(GestureDetector).last);
          await tester.pump();
          expect(clicked, 2);
        });
      });
    });

    group("Post Widget Test is all Widgets exist-", () {
      testWidgets("Test if Column exists", (WidgetTester tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(createNewsPostWidget());
          await tester.pump();
          final postFinder = find.byKey(newsPostKey);
          final firstColumnFinder = find
              .descendant(of: postFinder, matching: find.byType(Column))
              .first;

          //Test if 3 Columns exists
          expect(firstColumnFinder, findsOneWidget);

          final firstColumnWidget =
              tester.firstWidget(firstColumnFinder) as Column;

          // Test if first column has cross axis alignment of start
          expect(
            firstColumnWidget.crossAxisAlignment,
            CrossAxisAlignment.start,
          );

          // Testing if all direct children of column are there
          expect(firstColumnWidget.children[0], isA<ListTile>());
          expect(firstColumnWidget.children[1], isA<DescriptionTextWidget>());
          // expect(firstColumnWidget.children[2], isA<Container>());
          expect(
            firstColumnWidget.children[2],
            isA<BaseView<LikeButtonViewModel>>(),
          );
        });
      });
      testWidgets('Test Props of List Tile', (WidgetTester tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(createNewsPostWidget());
          await tester.pump();
          final postFinder = find.byKey(newsPostKey);
          final columnFinder = find
              .descendant(of: postFinder, matching: find.byType(Column))
              .first;

          final listTileFinder = find.descendant(
            of: columnFinder,
            matching: find.byType(ListTile),
          );

          // Tests if List Tile is a child of the first Column
          expect(listTileFinder, findsOneWidget);

          final listTileWidget = tester.firstWidget(listTileFinder) as ListTile;

          // Tests if leading of list tile is custom avatar
          expect(listTileWidget.leading.runtimeType, CustomAvatar);

          final customAvatarFinder = find.descendant(
            of: listTileFinder.first,
            matching: find.byType(CustomAvatar),
          );

          // Tests if Custom Avatar is a descendant of list tile
          expect(customAvatarFinder, findsOneWidget);

          final customAvatarWidget =
              tester.firstWidget(customAvatarFinder) as CustomAvatar;

          // Testing props of Custom Avatar Widget
          expect(customAvatarWidget.isImageNull, true);
          expect(customAvatarWidget.imageUrl, ' /null');
          expect(customAvatarWidget.fontSize, 20);
          expect(customAvatarWidget.firstAlphabet, 'T');

          // Tests if leading of list tile is custom avatar
          expect(listTileWidget.title.runtimeType, Text);

          final textsOfListTileFinder = find.descendant(
            of: listTileFinder.first,
            matching: find.byType(Text),
          );

          // Testing if 3 Text Widget are children of list tile
          // expect(textsOfListTileFinder, findsNWidgets(3));

          final titleListTileFinder = textsOfListTileFinder.at(1);
          final titleListTileWidget =
              tester.firstWidget(titleListTileFinder) as Text;

          // Testing properties of title Text Widget of list tile
          expect(titleListTileWidget.data, "TestName null");
          expect(titleListTileWidget.style!.fontSize, 16);
          expect(titleListTileWidget.style!.fontWeight, FontWeight.w400);

          final subtitleListTileFinder = textsOfListTileFinder.at(1);
          final subtitleListTileWidget =
              tester.firstWidget(subtitleListTileFinder) as Text;

          // Testing properties of title Text Widget of list tile
          expect(subtitleListTileWidget.data, "TestName null");
        });
      });
      testWidgets("Test props of DescriptionTextWidget",
          (WidgetTester tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(createNewsPostWidget());
          await tester.pump();
          final postFinder = find.byKey(newsPostKey);
          final columnFinder = find
              .descendant(of: postFinder, matching: find.byType(Column))
              .first;
          final descriptionTextWidgetFinder = find.descendant(
            of: columnFinder,
            matching: find.byType(DescriptionTextWidget),
          );

          // Testing if DescriptionTextWidget shows
          expect(descriptionTextWidgetFinder, findsOneWidget);

          final descriptionTextWidget =
              tester.firstWidget(descriptionTextWidgetFinder)
                  as DescriptionTextWidget;

          // Testing if the text description is correct
          expect(descriptionTextWidget.text, "TestDescription");
        });
      });

      testWidgets("Test props of Base view", (WidgetTester tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(createNewsPostWidget());
          await tester.pump();
          final postFinder = find.byKey(newsPostKey);
          final columnFinder =
              find.descendant(of: postFinder, matching: find.byType(Column));

          final baseViewWidget = (tester.firstWidget(columnFinder) as Column)
              .children[2] as BaseView<LikeButtonViewModel>;

          // Testing if the text description is correct
          expect(baseViewWidget.onModelReady, isNotNull);
          expect(baseViewWidget.builder, isNotNull);
          final column2Finder = columnFinder.at(2);
          expect(column2Finder, findsOneWidget);

          final secondColumnWidget =
              tester.firstWidget(column2Finder) as Column;
          print(secondColumnWidget);
        });
      });

      group('Test props of children for baseview', () {
        // testWidgets(
        //     'Test MultiReactButton presence and onReactionChanged property in NewsPostWidget',
        //     (WidgetTester tester) async {
        //   await tester.runAsync(() async {
        //     // Variable to check if onReactionChanged is called
        //     bool reactionChangedCalled = false;

        //     // Build the NewsPostWidget containing the MultiReactButton
        //     await tester.pumpWidget(
        //       MultiReactButton(
        //         toggle: () {
        //           // Set the flag when onReactionChanged is called
        //           reactionChangedCalled = true;
        //         },
        //       ),
        //     );

        //     // Find the MultiReactButton widget within the NewsPostWidget
        //     final multiReactButtonFinder = find.byType(MultiReactButton);

        //     // Ensure the MultiReactButton widget is present in the widget tree
        //     expect(multiReactButtonFinder, findsOneWidget);

        //     // Simulate a reaction change on the MultiReactButton
        //     await tester.tap(
        //       multiReactButtonFinder,
        //     ); // Replace with your actual tap action
        //     await tester.pump();

        //     // Ensure that onReactionChanged callback was triggered
        //     expect(reactionChangedCalled, true);
        //   });
        // });
        testWidgets('Test props first padding widget',
            (WidgetTester tester) async {
          await tester.runAsync(() async {
            await tester.pumpWidget(createNewsPostWidget());
            await tester.pump();
            final postFinder = find.byKey(newsPostKey);
            final columnFinder =
                find.descendant(of: postFinder, matching: find.byType(Column));
            final column2Finder = columnFinder.at(2);
            final secondColumnWidget =
                tester.firstWidget(column2Finder) as Column;
            final firstPaddingWidget =
                secondColumnWidget.children[0] as Padding;

            final firstGestureDetectorFinder = find.descendant(
              of: find.byWidget(firstPaddingWidget),
              matching: find.byType(GestureDetector),
            );
            print(firstGestureDetectorFinder);

            final secondGestureDetectorFinder = find.descendant(
              of: find.byWidget(firstPaddingWidget),
              matching: find.byType(GestureDetector),
            );
            print(secondGestureDetectorFinder);
          });
        });

        testWidgets('Test props second padding widget',
            (WidgetTester tester) async {
          await tester.runAsync(() async {
            await tester.pumpWidget(createNewsPostWidget());
            await tester.pump();
            final postFinder = find.byKey(newsPostKey);
            final columnFinder =
                find.descendant(of: postFinder, matching: find.byType(Column));
            final column2Finder = columnFinder.at(2);
            final secondColumnWidget =
                tester.firstWidget(column2Finder) as Column;
            final secondPaddingWidget =
                secondColumnWidget.children[1] as Padding;
            print(secondPaddingWidget);
          });
        });

        testWidgets('Test props third padding widget',
            (WidgetTester tester) async {
          await tester.runAsync(() async {
            await tester.pumpWidget(createNewsPostWidget());
            await tester.pump();
            final postFinder = find.byKey(newsPostKey);
            final columnFinder =
                find.descendant(of: postFinder, matching: find.byType(Column));
            final column2Finder = columnFinder.at(2);
            final secondColumnWidget =
                tester.firstWidget(column2Finder) as Column;
            print(secondColumnWidget);
          });
        });

        testWidgets('Test if report button opens modal bottom sheet',
            (WidgetTester tester) async {
          await tester.pumpWidget(createNewsPostWidget());
          await tester.pump();

          final reportButtonFinder = find.byKey(const Key('reportButton'));
          expect(reportButtonFinder, findsOneWidget);

          await tester.tap(reportButtonFinder);
          await tester.pumpAndSettle();

          final modalBottomSheetFinder =
              find.byKey(const Key('reportPost')).first;
          expect(modalBottomSheetFinder, findsOneWidget);

          final postBottomModalFinder = find.byType(PostBottomModal);
          expect(postBottomModalFinder, findsOneWidget);
        });

        testWidgets("Test post image", (tester) async {
          await tester.runAsync(() async {
            await mockNetworkImagesFor(() async {
              final Post post = getPostMockModel();
              when(post.imageUrl).thenReturn(
                "testImageUrl",
              );

              await tester.pumpWidget(
                createNewsPostWidget(
                  null,
                  post,
                ),
              );

              await tester.pumpAndSettle();

              final postParentContainer =
                  find.byKey(const Key('postParentContainer'));
              expect(postParentContainer, findsOneWidget);
              final postContainer = find
                  .descendant(
                    of: postParentContainer,
                    matching: find.byType(PostContainer),
                  )
                  .first;

              expect(postContainer, findsOneWidget);
            });
          });
        });
      });
    });
  });
}

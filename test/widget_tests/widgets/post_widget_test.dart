// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

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
import 'package:talawa/widgets/post_detailed_page.dart';
import 'package:talawa/widgets/post_widget.dart';
import 'package:talawa/widgets/video_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../helpers/test_helpers.dart';

const Key newsPostKey = Key("newsPostKey");
const Key postContainerKey = Key("postContainerKey");

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

Widget createPostContainerWidget() {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    themeMode: ThemeMode.light,
    theme: TalawaTheme.lightTheme,
    home: const Scaffold(
      body: PostContainer(
        id: "Post Id",
        key: postContainerKey,
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

          final thirdPaddingWidget = secondColumnWidget.children[2] as Padding;

          final first3GestureDetectorFinder = find.descendant(
            of: find.byWidget(thirdPaddingWidget),
            matching: find.byType(GestureDetector),
          );
          final first3GestureDetectorWidget = tester
              .firstWidget(first3GestureDetectorFinder) as GestureDetector;

          expect(
            (first3GestureDetectorWidget.child! as Icon).color,
            TalawaTheme.lightTheme.colorScheme.secondary,
          );
        });
      });
      testWidgets("Test if onTap is functional", (WidgetTester tester) async {
        await tester.runAsync(() async {
          int clicked = 0;
          void func(Post post) {
            clicked++;
          }

          await tester.pumpWidget(createNewsPostWidget(func));
          await tester.pump();

          final postFinder = find.byKey(newsPostKey);
          final columnFinder =
              find.descendant(of: postFinder, matching: find.byType(Column));
          final column2Finder = columnFinder.at(2);
          final secondColumnWidget =
              tester.firstWidget(column2Finder) as Column;
          final firstPaddingWidget = secondColumnWidget.children[0] as Padding;
          final firstGestureDetectorFinder = find.descendant(
            of: find.byWidget(firstPaddingWidget),
            matching: find.byType(GestureDetector),
          );
          final firstGestureDetectorWidget =
              tester.firstWidget(firstGestureDetectorFinder) as GestureDetector;
          await tester.tap(find.byWidget(firstGestureDetectorWidget).first);
          await tester.pump();
          expect(clicked, 1);

          final secondGestureDetectorFinder = find.descendant(
            of: find.byWidget(firstPaddingWidget),
            matching: find.byType(GestureDetector),
          );
          final secondGestureDetectorWidget = tester
              .firstWidget(secondGestureDetectorFinder.last) as GestureDetector;
          await tester.tap(find.byWidget(secondGestureDetectorWidget).first);
          await tester.pump();
          expect(clicked, 2);

          final thirdPaddingWidget = secondColumnWidget.children[2] as Padding;

          final second3GestureDetectorFinder = find.descendant(
            of: find.byWidget(thirdPaddingWidget),
            matching: find.byType(GestureDetector),
          );
          final second3GestureDetectorWidget =
              tester.firstWidget(second3GestureDetectorFinder.last)
                  as GestureDetector;
          await tester.tap(find.byWidget(second3GestureDetectorWidget));
          await tester.pump();
          expect(clicked, 3);

          final first3GestureDetectorFinder = find.descendant(
            of: find.byWidget(thirdPaddingWidget),
            matching: find.byType(GestureDetector),
          );
          final first3GestureDetectorWidget = tester
              .firstWidget(first3GestureDetectorFinder) as GestureDetector;
          await tester.tap(find.byWidget(first3GestureDetectorWidget));
          await tester.pump();

          expect(
            first3GestureDetectorWidget.child,
            isA<Icon>()
                .having((icon) => icon.icon, "icon", Icons.thumb_up)
                .having(
                  (icon) => icon.color,
                  "color",
                  equals(
                    const Color(0xff737373),
                  ),
                ),
          );
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
          expect(firstColumnWidget.children[2], isA<Container>());
          expect(
            firstColumnWidget.children[3],
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
          expect(customAvatarWidget.imageUrl, null);
          expect(customAvatarWidget.fontSize, 24);
          expect(customAvatarWidget.firstAlphabet, 'T');

          // Tests if leading of list tile is custom avatar
          expect(listTileWidget.title.runtimeType, Text);

          final textsOfListTileFinder = find.descendant(
            of: listTileFinder.first,
            matching: find.byType(Text),
          );

          // Testing if 3 Text Widget are children of list tile
          expect(textsOfListTileFinder, findsNWidgets(3));

          final titleListTileFinder = textsOfListTileFinder.at(1);
          final titleListTileWidget =
              tester.firstWidget(titleListTileFinder) as Text;

          // Testing properties of title Text Widget of list tile
          expect(titleListTileWidget.data, "TestName null");
          expect(titleListTileWidget.style!.fontSize, 20);
          expect(titleListTileWidget.style!.fontWeight, FontWeight.w400);

          final subtitleListTileFinder = textsOfListTileFinder.at(2);
          final subtitleListTileWidget =
              tester.firstWidget(subtitleListTileFinder) as Text;

          // Testing properties of title Text Widget of list tile
          expect(subtitleListTileWidget.data, "2 Months Ago");
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
      testWidgets("Test props of Container containing the Post Container",
          (WidgetTester tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(createNewsPostWidget());
          await tester.pump();
          final postFinder = find.byKey(newsPostKey);
          final columnFinder = find
              .descendant(of: postFinder, matching: find.byType(Column))
              .first;

          final containerWidget = (tester.firstWidget(columnFinder) as Column)
              .children[2] as Container;

          // Testing if the text description is correct
          expect(containerWidget.constraints!.maxHeight, 400);
          expect(containerWidget.constraints!.minHeight, 400);

          expect(
            containerWidget.color,
            TalawaTheme.lightTheme.colorScheme.primaryContainer
                .withOpacity(0.5),
          );

          final postContainerFinder = find.descendant(
            of: find.byWidget(containerWidget),
            matching: find.byType(PostContainer),
          );
          expect(postContainerFinder, findsOneWidget);
          expect(
            (tester.firstWidget(postContainerFinder) as PostContainer).id,
            "PostID",
          );
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
              .children[3] as BaseView<LikeButtonViewModel>;

          // Testing if the text description is correct
          expect(baseViewWidget.onModelReady, isNotNull);
          expect(baseViewWidget.builder, isNotNull);
          final column2Finder = columnFinder.at(2);
          expect(column2Finder, findsOneWidget);

          final secondColumnWidget =
              tester.firstWidget(column2Finder) as Column;

          // Testing if all direct children of column are there
          expect(secondColumnWidget.children[0], isA<Padding>());
          expect(secondColumnWidget.children[1], isA<Padding>());
          expect(secondColumnWidget.children[2], isA<Padding>());
        });
      });

      group('Test props of children for baseview', () {
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
            expect(
              firstPaddingWidget.padding,
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            );
            expect(
              firstPaddingWidget.child,
              isA<Row>()
                  .having(
                (row) => row.mainAxisAlignment,
                'mainAxisAlignment',
                MainAxisAlignment.spaceBetween,
              )
                  .having(
                (row) => row.children,
                "children",
                [
                  isA<GestureDetector>(),
                  isA<GestureDetector>(),
                ],
              ),
            );
            final firstGestureDetectorFinder = find.descendant(
              of: find.byWidget(firstPaddingWidget),
              matching: find.byType(GestureDetector),
            );
            final firstGestureDetectorWidget = tester
                .firstWidget(firstGestureDetectorFinder) as GestureDetector;
            expect(firstGestureDetectorWidget.onTap, isNotNull);
            expect(firstGestureDetectorWidget.onTap, isA<Function>());
            expect(
              firstGestureDetectorWidget.child,
              isA<Text>().having((text) => text.data, "data", "0 Likes").having(
                    (text) => text.style,
                    "style",
                    const TextStyle(
                      fontFamily: 'open-sans',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
            );

            final secondGestureDetectorFinder = find.descendant(
              of: find.byWidget(firstPaddingWidget),
              matching: find.byType(GestureDetector),
            );
            final secondGestureDetectorWidget =
                tester.firstWidget(secondGestureDetectorFinder.last)
                    as GestureDetector;
            expect(secondGestureDetectorWidget.onTap, isNotNull);
            expect(secondGestureDetectorWidget.onTap, isA<Function>());
            expect(
              secondGestureDetectorWidget.child,
              isA<Text>().having((text) => text.data, "data", "0 comments"),
            );
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
            expect(
              secondPaddingWidget.padding,
              const EdgeInsets.symmetric(horizontal: 16.0),
            );
            expect(
              secondPaddingWidget.child,
              isA<Divider>(),
            );
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

            final thirdPaddingWidget =
                secondColumnWidget.children[2] as Padding;
            expect(
              thirdPaddingWidget.padding,
              const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            );
            expect(
              thirdPaddingWidget.child,
              isA<Row>().having(
                (row) => row.children,
                "children",
                [
                  isA<GestureDetector>(),
                  isA<GestureDetector>(),
                ],
              ),
            );
            final first3GestureDetectorFinder = find.descendant(
              of: find.byWidget(thirdPaddingWidget),
              matching: find.byType(GestureDetector),
            );
            final first3GestureDetectorWidget = tester
                .firstWidget(first3GestureDetectorFinder) as GestureDetector;
            expect(first3GestureDetectorWidget.onTap, isNotNull);
            expect(first3GestureDetectorWidget.onTap, isA<Function>());
            expect(
              first3GestureDetectorWidget.child,
              isA<Icon>()
                  .having((icon) => icon.icon, "icon", Icons.thumb_up)
                  .having(
                    (icon) => icon.color,
                    "color",
                    const Color(0xff737373),
                  ),
            );

            final second3GestureDetectorFinder = find.descendant(
              of: find.byWidget(thirdPaddingWidget),
              matching: find.byType(GestureDetector),
            );
            final second3GestureDetectorWidget =
                tester.firstWidget(second3GestureDetectorFinder.last)
                    as GestureDetector;
            expect(second3GestureDetectorWidget.onTap, isNotNull);
            expect(second3GestureDetectorWidget.onTap, isA<Function>());
            expect(
              second3GestureDetectorWidget.child,
              isA<Padding>()
                  .having(
                    (padding) => padding.padding,
                    "padding",
                    const EdgeInsets.only(left: 18.0),
                  )
                  .having(
                    (padding) => padding.child,
                    "child",
                    isA<Icon>()
                        .having((icon) => icon.icon, "icon", Icons.comment)
                        .having(
                          (icon) => icon.color,
                          "color",
                          const Color(0xff737373),
                        ),
                  ),
            );
          });
        });
      });
    });
  });

  group('Testing Post Container Widget -', () {
    testWidgets('Test if Post Container Widget shows',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createPostContainerWidget());
        await tester.pump();
        final postContainerFinder = find.byKey(postContainerKey);
        expect(postContainerFinder, findsOneWidget);
      });
    });
    testWidgets('Test props of Visibility Detector',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createPostContainerWidget());
        await tester.pump();
        final postContainerFinder = find.byKey(postContainerKey);
        final visibilityDetectorFinder = find.descendant(
          of: postContainerFinder,
          matching: find.byType(VisibilityDetector),
        );
        final visibilityDetectorWidget =
            tester.firstWidget(visibilityDetectorFinder) as VisibilityDetector;

        expect(visibilityDetectorFinder, findsOneWidget);
        expect(visibilityDetectorWidget.key, const Key('Post Id'));
        expect(visibilityDetectorWidget.onVisibilityChanged, isNotNull);
        expect(visibilityDetectorWidget.onVisibilityChanged, isA<Function>());
        expect(
          visibilityDetectorWidget.child,
          isA<Stack>().having(
            (stack) => stack.children,
            "children",
            [
              isA<PageView>(),
              isA<Padding>(),
            ],
          ),
        );
      });
    });
    testWidgets('Test props of PageView', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createPostContainerWidget());
        await tester.pump();
        final postContainerFinder = find.byKey(postContainerKey);
        final pageViewFinder = find.descendant(
          of: postContainerFinder,
          matching: find.byType(PageView),
        );
        final pageViewWidget = tester.firstWidget(pageViewFinder) as PageView;
        expect(pageViewFinder, findsOneWidget);
        expect(pageViewWidget.scrollDirection, Axis.horizontal);
        expect(
          pageViewWidget.controller,
          isA<PageController>().having(
            (pageController) => pageController.initialPage,
            "initial page",
            0,
          ),
        );
        expect(pageViewWidget.onPageChanged, isA<Function>());
      });
    });
    testWidgets('Test children of PageView', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(createPostContainerWidget());
          await tester.pump();
          final postContainerFinder = find.byKey(postContainerKey);
          final pageViewFinder = find.descendant(
            of: postContainerFinder,
            matching: find.byType(PageView),
          );
          final centerFinder = find.ancestor(
            of: find.byType(VideoWidget),
            matching: find.descendant(
              of: pageViewFinder,
              matching: find.byType(Center),
            ),
          );
          final imageFinder = find.descendant(
            of: pageViewFinder,
            matching: find.byType(Image),
          );

          expect(centerFinder, findsOneWidget);
          expect(imageFinder, findsNothing);

          final centerWidget = tester.firstWidget(centerFinder) as Center;
          expect(
            centerWidget.child,
            isA<VideoWidget>()
                .having(
                  (video) => video.url,
                  "url",
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                )
                .having((video) => video.play, "play", true),
          );

          await tester.dragFrom(
            Offset(
              SizeConfig.screenWidth!,
              tester.getCenter(pageViewFinder).dy,
            ),
            Offset(-SizeConfig.screenWidth! * 2, 0),
          );
          await tester.pump();

          expect(centerFinder, findsOneWidget);
          expect(imageFinder, findsOneWidget);
          expect(
            tester.firstWidget(imageFinder),
            isA<Image>().having(
              (image) => image.image,
              "image",
              const NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              ),
            ),
          );

          final paddingFinder = find.descendant(
            of: postContainerFinder,
            matching: find.byType(Padding),
          );
          final paddingFinders = find.descendant(
            of: paddingFinder.at(1),
            matching: find.byType(Padding),
          );
          final padding1Widgets =
              tester.firstWidget(paddingFinders.at(0)) as Padding;
          final padding2Widgets =
              tester.firstWidget(paddingFinders.at(3)) as Padding;
          await tester.pump();
          expect((padding1Widgets.child! as Divider).color, Colors.grey);
          expect(
            (padding2Widgets.child! as Divider).color,
            TalawaTheme.lightTheme.colorScheme.primary,
          );
          expect(
            (tester.firstWidget(pageViewFinder) as PageView).controller.page,
            0.9,
          );
        });
      });
    });
    testWidgets('Test props of Padding', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createPostContainerWidget());
        await tester.pump();
        final postContainerFinder = find.byKey(postContainerKey);
        final paddingFinder = find.descendant(
          of: postContainerFinder,
          matching: find.byType(Padding),
        );
        final paddingWidget = tester.firstWidget(paddingFinder) as Padding;
        expect(
          paddingWidget.padding,
          const EdgeInsets.symmetric(horizontal: 8.0),
        );
        expect(
          paddingWidget.child,
          isA<Column>()
              .having(
                (column) => column.crossAxisAlignment,
                "cross axis alignment",
                CrossAxisAlignment.center,
              )
              .having(
                (column) => column.mainAxisAlignment,
                "main axis alignment",
                MainAxisAlignment.end,
              )
              .having(
                (column) => column.mainAxisSize,
                "main axis size",
                MainAxisSize.max,
              )
              .having(
            (column) => column.children,
            "children",
            [isA<Padding>()],
          ),
        );
      });
    });
    testWidgets('Test props of second Padding', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(createPostContainerWidget());
        await tester.pump();
        final postContainerFinder = find.byKey(postContainerKey);
        final paddingFinder = find.descendant(
          of: postContainerFinder,
          matching: find.byType(Padding),
        );
        final paddingWidget =
            tester.firstWidget(paddingFinder.at(1)) as Padding;
        expect(
          paddingWidget.padding,
          const EdgeInsets.symmetric(
            horizontal: 100.0,
            vertical: 10.0,
          ),
        );
        expect(
          paddingWidget.child,
          isA<Row>().having(
            (row) => row.children,
            "children",
            [
              isA<Expanded>().having(
                (expanded) => expanded.child,
                "child",
                isA<Padding>(),
              ),
              isA<Expanded>().having(
                (expanded) => expanded.child,
                "child",
                isA<Padding>(),
              ),
              isA<Expanded>().having(
                (expanded) => expanded.child,
                "child",
                isA<Padding>(),
              ),
              isA<Expanded>().having(
                (expanded) => expanded.child,
                "child",
                isA<Padding>(),
              ),
            ],
          ),
        );
        final paddingFinders = find.descendant(
          of: paddingFinder.at(1),
          matching: find.byType(Padding),
        );
        final padding1Widgets =
            tester.firstWidget(paddingFinders.at(0)) as Padding;
        final padding2Widgets =
            tester.firstWidget(paddingFinders.at(3)) as Padding;

        expect(
          padding1Widgets.padding,
          const EdgeInsets.symmetric(horizontal: 5.0),
        );
        expect(
          padding1Widgets.child,
          isA<Divider>()
              .having(
                (divider) => divider.thickness,
                "thickness",
                3.0,
              )
              .having(
                (divider) => divider.color,
                "color",
                TalawaTheme.lightTheme.colorScheme.primary,
              ),
        );

        expect(
          padding2Widgets.padding,
          const EdgeInsets.symmetric(horizontal: 5.0),
        );
        expect(
          padding2Widgets.child,
          isA<Divider>()
              .having(
                (divider) => divider.thickness,
                "thickness",
                3.0,
              )
              .having(
                (divider) => divider.color,
                "color",
                Colors.grey,
              ),
        );
      });
    });
  });
}

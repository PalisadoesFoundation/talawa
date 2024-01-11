import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';

/// Generates carousel for pinned posts on the Home Screen's top.
///
/// Tapping on a post will redirect you to the respective post screen.
class PinnedPostCarousel extends StatelessWidget {
  const PinnedPostCarousel({
    super.key,
    required this.pinnedPosts,
    required this.navigateToPinnedPostPage,
    required this.navigateToIndividualPostPage,
  });

  /// List of 'Post' objects representing pinned posts.
  final List<Post> pinnedPosts;

  /// Function that navigates to a page displaying pinned posts.
  final Function() navigateToPinnedPostPage;

  /// Function that navigates to an individual post page.
  final Function navigateToIndividualPostPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 220,
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
          child: CustomCarouselScroller(
            pinnedPosts: pinnedPosts,
            key: const Key('Carousel'),
            navigateToIndividualPostPage: navigateToIndividualPostPage,
          ),
        ),
        // Gesture Detector in Flutter is used to detect
        // the user's gestures on the application.
        // It is a non-visual widget. Inside the gesture detector,
        // another widget is placed and
        // the gesture detector will capture all these
        // events (gestures) and execute the tasks accordingly.
        GestureDetector(
          onTap: () => navigateToPinnedPostPage(),
          child: Container(
            height: 50,
            width: SizeConfig.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.article,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Text(
                    AppLocalizations.of(context)!
                        .strictTranslate("See all Pinned news"),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Class defining custom carousel.
@visibleForTesting
class CustomCarouselScroller extends StatefulWidget {
  const CustomCarouselScroller({
    super.key,
    required this.pinnedPosts,
    required this.navigateToIndividualPostPage,
  });

  /// List of pinnedposts.
  final List<Post> pinnedPosts;

  /// function to navigate to IndividualPostPage.
  final Function navigateToIndividualPostPage;

  @override
  CustomCarouselScrollerState createState() => CustomCarouselScrollerState();
}

@visibleForTesting
class CustomCarouselScrollerState extends State<CustomCarouselScroller> {
  /// pageController.
  final PageController controller = PageController(initialPage: 0);

  /// pageIndex.
  int pindex = 0;

  @override
  Widget build(BuildContext context) {
    // Stack is a widget that positions its
    // children relative to the edges of its box.
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Color(0xff737373),
                ),
                title: Text(
                  "${widget.pinnedPosts[pindex].creator!.firstName} ${widget.pinnedPosts[pindex].creator!.lastName}",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.pinnedPosts[pindex].description!.length > 90
                      ? "${widget.pinnedPosts[pindex].description!.substring(0, 90)}..."
                      : widget.pinnedPosts[pindex].description!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: const Color(0xFF737373)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Divider(
                            thickness: 3.0,
                            color: pindex == i
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              pindex = index;
            });
          },
          children: List.generate(
            widget.pinnedPosts.length,
            (index) => Container(),
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/models/post/post_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';

/// PinnedPostCarousel class returns a widget for pinned posts in
/// the slider/carousel on the top of the Home Screen.
/// Tapping on a post will redirect you to the respective post screen.
class PinnedPostCarousel extends StatelessWidget {
  const PinnedPostCarousel({
    Key? key,
    required this.pinnedPosts,
    required this.navigateToPinnedPostPage,
    required this.navigateToIndividualPostPage,
  }) : super(key: key);

  // variables
  final List<Post> pinnedPosts;
  final Function navigateToPinnedPostPage;
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
        // Gesture Detector in Flutter is used to detect the user's gestures on the application.
        // It is a non-visual widget. Inside the gesture detector, another widget is placed and
        // the gesture detector will capture all these events (gestures) and execute the tasks accordingly.
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
                const Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
        )
      ],
    );
  }
}

@visibleForTesting
class CustomCarouselScroller extends StatefulWidget {
  const CustomCarouselScroller({
    Key? key,
    required this.pinnedPosts,
    required this.navigateToIndividualPostPage,
  }) : super(key: key);
  final List<Post> pinnedPosts;
  final Function navigateToIndividualPostPage;

  @override
  CustomCarouselScrollerState createState() => CustomCarouselScrollerState();
}

/// CustomCarouselScrollerState class return a widget that is
/// used to generate slider for pinned post on the top of the Home Screen.
@visibleForTesting
class CustomCarouselScrollerState extends State<CustomCarouselScroller> {
  // variables
  final PageController controller = PageController(initialPage: 0);
  int pindex = 0;

  @override
  Widget build(BuildContext context) {
    // Stack is a widget that positions its children relative to the edges of its box.
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
                      )
                  ],
                ),
              )
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

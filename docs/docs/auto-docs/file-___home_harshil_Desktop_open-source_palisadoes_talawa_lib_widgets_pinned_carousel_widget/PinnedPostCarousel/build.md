




build method - PinnedPostCarousel class - pinned\_carousel\_widget library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/pinned\_carousel\_widget.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/)
3. [PinnedPostCarousel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/PinnedPostCarousel-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [pinned\_carousel\_widget](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/)
3. [PinnedPostCarousel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_pinned_carousel_widget/PinnedPostCarousel-class.html)
4. build method

##### PinnedPostCarousel class





talawa
1.0.0+1







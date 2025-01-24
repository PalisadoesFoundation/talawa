




FocusTarget constructor - FocusTarget - app\_tour library - Dart API







menu

1. [talawa](../../index.html)
2. [models/app\_tour.dart](../../models_app_tour/models_app_tour-library.html)
3. [FocusTarget](../../models_app_tour/FocusTarget-class.html)
4. FocusTarget constructor

FocusTarget


dark\_mode

light\_mode




# FocusTarget constructor


FocusTarget({

1. required [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>> key,
2. required String keyName,
3. required String description,
4. required [AppTour](../../models_app_tour/AppTour-class.html) appTour,
5. bool isCircle = false,
6. [ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/ContentAlign.html) align = ContentAlign.bottom,
7. [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) crossAlign = CrossAxisAlignment.start,
8. [Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html) skipAlignment = Alignment.topRight,
9. dynamic next()?,
10. [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) nextCrossAlign = CrossAxisAlignment.end,
11. bool isEnd = false,

})

This returns a widget for a step in a tutorial.

**params**:

* `key`: key of type GlobalKey.
* `keyName`: key where the widget shows.
* `description`: description of the step.
* `isCircle`: bool to specify if circle
* `align`: align of type ContentAlign to align button.
* `crossAlign`: Cross align axes
* `skipAlignment`: to give alignment of skip option
* `next`: Function`type, this show the next step or`key` to show the tour of.
* `nextCrossAlign`: nextCrossAlign to give alignment of next option
* `isEnd`: true if last step of the tour.
* `tutorialCoachMark`: instance of tutorialCoachMark to which this focusTarget is linked.

## Implementation

```
FocusTarget({
  required this.key,
  required this.keyName,
  required this.description,
  required this.appTour,
  this.isCircle = false,
  this.align = ContentAlign.bottom,
  this.crossAlign = CrossAxisAlignment.start,
  this.skipAlignment = Alignment.topRight,
  this.next,
  this.nextCrossAlign = CrossAxisAlignment.end,
  this.isEnd = false,
}) {
  this.focusWidget = TargetFocus(
    enableOverlayTab: true,
    color: Colors.transparent,
    identify: keyName,
    keyTarget: key,
    alignSkip: skipAlignment,
    shape: isCircle ? ShapeLightFocus.Circle : ShapeLightFocus.RRect,
    contents: [
      TargetContent(
        align: align,
        builder: (context, controller) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: crossAlign,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.strictTranslate(description),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(
          bottom: SizeConfig.screenHeight! * 0.025,
        ),
        builder: (context, controller) {
          return GestureDetector(
            onTap: () {
              next?.call();
              appTour.tutorialCoachMark.next();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: nextCrossAlign,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!
                      .strictTranslate(isEnd ? 'COMPLETE' : 'NEXT'),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [app\_tour](../../models_app_tour/models_app_tour-library.html)
3. [FocusTarget](../../models_app_tour/FocusTarget-class.html)
4. FocusTarget constructor

##### FocusTarget class





talawa
1.0.0+1







::::::: {#dartdoc-main-content .main-content above-sidebar="models_app_tour/FocusTarget-class-sidebar.html" below-sidebar=""}
<div>

# [FocusTarget]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[FocusTarget]{.name}({

1.  [required
    [[GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.type-annotation}
    [key]{.parameter-name}, ]{#-param-key .parameter}
2.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [keyName]{.parameter-name}, ]{#-param-keyName .parameter}
3.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [description]{.parameter-name}, ]{#-param-description .parameter}
4.  [required
    [[AppTour](../../models_app_tour/AppTour-class.html)]{.type-annotation}
    [appTour]{.parameter-name}, ]{#-param-appTour .parameter}
5.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [isCircle]{.parameter-name} = [false]{.default-value},
    ]{#-param-isCircle .parameter}
6.  [[[ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/ContentAlign.html)]{.type-annotation}
    [align]{.parameter-name} = [ContentAlign.bottom]{.default-value},
    ]{#-param-align .parameter}
7.  [[[CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)]{.type-annotation}
    [crossAlign]{.parameter-name} =
    [CrossAxisAlignment.start]{.default-value}, ]{#-param-crossAlign
    .parameter}
8.  [[[Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html)]{.type-annotation}
    [skipAlignment]{.parameter-name} =
    [Alignment.topRight]{.default-value}, ]{#-param-skipAlignment
    .parameter}
9.  [[dynamic]{.type-annotation} [next]{.parameter-name}()?,
    ]{#-param-next .parameter}
10. [[[CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html)]{.type-annotation}
    [nextCrossAlign]{.parameter-name} =
    [CrossAxisAlignment.end]{.default-value}, ]{#-param-nextCrossAlign
    .parameter}
11. [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [isEnd]{.parameter-name} = [false]{.default-value}, ]{#-param-isEnd
    .parameter}

})
:::

::: {.section .desc .markdown}
This returns a widget for a step in a tutorial.

**params**:

-   `key`: key of type GlobalKey.
-   `keyName`: key where the widget shows.
-   `description`: description of the step.
-   `isCircle`: bool to specify if circle
-   `align`: align of type ContentAlign to align button.
-   `crossAlign`: Cross align axes
-   `skipAlignment`: to give alignment of skip option
-   `next`: Function`type, this show the next step or`key\` to show the
    tour of.
-   `nextCrossAlign`: nextCrossAlign to give alignment of next option
-   `isEnd`: true if last step of the tour.
-   `tutorialCoachMark`: instance of tutorialCoachMark to which this
    focusTarget is linked.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [app_tour](../../models_app_tour/)
3.  [FocusTarget](../../models_app_tour/FocusTarget-class.html)
4.  FocusTarget constructor

##### FocusTarget class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::

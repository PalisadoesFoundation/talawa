::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/pinned_carousel_widget.dart](../../widgets_pinned_carousel_widget/)
3.  [PinnedPostCarousel](../../widgets_pinned_carousel_widget/PinnedPostCarousel-class.html)
4.  build method

::: self-name
build
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_pinned_carousel_widget/PinnedPostCarousel-class-sidebar.html" below-sidebar=""}
<div>

# [build]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[build]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#build-param-context .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
and when the dependencies of this widget change (e.g., an
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
referenced by this widget changes). This method can potentially be
called in every frame and should not have any side effects beyond
building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor and from the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. A given widget might be built
with multiple different
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

-   the fields of the widget, which themselves must not change over
    time, and
-   any ambient state obtained from the `context` using
    [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget\'s
[build](../../widgets_pinned_carousel_widget/PinnedPostCarousel/build.html)
method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [pinned_carousel_widget](../../widgets_pinned_carousel_widget/)
3.  [PinnedPostCarousel](../../widgets_pinned_carousel_widget/PinnedPostCarousel-class.html)
4.  build method

##### PinnedPostCarousel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}

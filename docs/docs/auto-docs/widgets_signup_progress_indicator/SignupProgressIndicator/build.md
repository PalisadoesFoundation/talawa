
<div>

# build method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
build(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    context]

)


override




Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the
tree in a given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
and when the dependencies of this widget change (e.g., an
[InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.md)
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
[build](../../widgets_signup_progress_indicator/SignupProgressIndicator/build.md)
method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
instead.

See also:

-   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html),
    which contains the discussion on performance considerations.



## Implementation

``` language-dart
@override
Widget build(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: SizeConfig.screenHeight! * 0.15,
    child: Timeline.tileBuilder(
      scrollDirection: Axis.horizontal,
      physics: const ,
      padding: EdgeInsets.zero,
      builder: TimelineTileBuilder.connected(
        contentsBuilder: (_, index) => Text(
          AppLocalizations.of(context)!.strictTranslate(progressLabel[index]),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                /// Sets the color of the text.
                /// If the step index is less than or equal to `currentPageIndex`,
                /// the color is green (visited). Otherwise, show fade(not visited) color.
                color: index <= currentPageIndex
                    ? const Color(0xFF008A37)
                    : const Color(0xFF737373),
              ),
          textAlign: TextAlign.center,
        ),
        connectorBuilder: (_, index, __) {
          return SolidLineConnector(
            space: 30,

            /// Sets the color of the connector line.
            /// If the step index is less than `currentPageIndex`,
            /// the color is green (visited). Otherwise, show fade(not visited) color.
            color: index < currentPageIndex
                ? const Color(0xFF008A37)
                : const Color(0xFF737373),
          );
        },
        indicatorBuilder: (_, index) {
          return DotIndicator(
            size: 25,
            color: index <= currentPageIndex
                ? const Color(0xFF008A37)
                : const Color(0xFF737373),
            child: index < currentPageIndex
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  )
                : const ,
          );
        },
        itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / 3,
        itemCount: 3,
      ),
    ),
  );
}
```







1.  [talawa](../../index.md)
2.  [signup_progress_indicator](../../widgets_signup_progress_indicator/)
3.  [SignupProgressIndicator](../../widgets_signup_progress_indicator/SignupProgressIndicator-class.md)
4.  build method

##### SignupProgressIndicator class








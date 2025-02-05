


# build method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Describes the part of the user interface represented by this widget.</p>
<p>The framework calls this method when this widget is inserted into the tree
in a given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> and when the dependencies of this widget change
(e.g., an <a href="https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html">InheritedWidget</a> referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.</p>
<p>The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling <a href="https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html">Widget.canUpdate</a>.</p>
<p>Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>.</p>
<p>The given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.</p>
<p>The implementation of this method must only depend on:</p>
<ul>
<li>the fields of the widget, which themselves must not change over time,
and</li>
<li>any ambient state obtained from the <code>context</code> using
<a href="https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html">BuildContext.dependOnInheritedWidgetOfExactType</a>.</li>
</ul>
<p>If a widget's <a href="../../widgets_signup_progress_indicator/SignupProgressIndicator/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    height: SizeConfig.screenHeight! * 0.15,
    child: Timeline.tileBuilder(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      builder: TimelineTileBuilder.connected(
        contentsBuilder: (_, index) => Text(
          AppLocalizations.of(context)!.strictTranslate(progressLabel[index]),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                // If the flow index is greater than currentPageIndex then
                // show green(visited) color else show fade(not visited) color.
                color: index <= currentPageIndex
                    ? const Color(0xFF008A37)
                    : const Color(0xFF737373),
              ),
          textAlign: TextAlign.center,
        ),
        connectorBuilder: (_, index, __) {
          return SolidLineConnector(
            space: 30,
            // If the flow index is greater than currentPageIndex then
            // show green(visited) color else show fade(not visited) color.
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
                : const SizedBox(),
          );
        },
        itemExtentBuilder: (_, __) => MediaQuery.of(context).size.width / 3,
        itemCount: 3,
      ),
    ),
  );
}
```











# focusTarget method








[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html) focusTarget
([GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>> key, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) keyName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isCircle = false, [ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/ContentAlign.html) align = ContentAlign.bottom, [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) crossAlign = CrossAxisAlignment.start, [Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html) skipAlignment = Alignment.topRight, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html)? next, [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) nextCrossAlign = CrossAxisAlignment.end, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isEnd = false})





<p>This returns a widget for a step in a tutorial.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>key</code>: key of type GlobalKey.</li>
<li><code>keyName</code>: key where the widget shows.</li>
<li><code>description</code>: description of the step.</li>
<li><code>isCircle</code>: bool to specify if circle</li>
<li><code>align</code>: align of type ContentAlign to align button.</li>
<li><code>crossAlign</code>: Cross align axes</li>
<li><code>skipAlignment</code>: to give alignment of skip option</li>
<li><code>next</code>: Function<code>type, this show the next step or</code>key` to show the tour of.</li>
<li><code>nextCrossAlign</code>: nextCrossAlign to give alignment of next option</li>
<li><code>isEnd</code>: true if last step of the tour.</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>TargetFocus</code>: This return widget foa a step in a tut</li>
</ul>



## Implementation

```dart
TargetFocus focusTarget(
  GlobalKey key,
  String keyName,
  String description, {
  bool isCircle = false,
  ContentAlign align = ContentAlign.bottom,
  CrossAxisAlignment crossAlign = CrossAxisAlignment.start,
  Alignment skipAlignment = Alignment.topRight,
  Function? next,
  CrossAxisAlignment nextCrossAlign = CrossAxisAlignment.end,
  bool isEnd = false,
}) {
  return TargetFocus(
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
                  description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
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
              if (next != null) {
                // ignore: avoid_dynamic_calls
                next();
              }
              tutorialCoachMark.next();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: nextCrossAlign,
              children: <Widget>[
                Text(
                  isEnd ? 'COMPLETE' : 'NEXT',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
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











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
<p>If a widget's <a href="../../widgets_custom_list_tile/CustomListTile/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  return InkWell(
    // checking wheather the tapped tile is of user or org.
    onTap: () => type == TileType.org
        ? onTapOrgInfo!(orgInfo!)
        : type == TileType.user
            ? onTapUserInfo!()
            // ignore: avoid_dynamic_calls
            : onTapOption!(),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 70,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Text(
                  type == TileType.org
                      ? orgInfo!.name!
                      : type == TileType.user
                          ? '${userInfo!.firstName!} ${userInfo!.lastName!}'
                          : option!.title,
                  style: type == TileType.org
                      ? Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 18, color: Colors.black)
                      : type == TileType.user
                          ? Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18, color: Colors.black)
                          : option!.trailingIconButton == null
                              ? Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 18, color: Colors.black)
                              : Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: type != TileType.user
                  ? type == TileType.org
                      ? Icon(
                          orgInfo!.isPublic! ? Icons.lock_open : Icons.lock,
                          color: orgInfo!.isPublic!
                              ? const Color(0xFF34AD64)
                              : const Color(0xffFABC57),
                        )
                      : option!.trailingIconButton ?? const SizedBox()
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    ),
  );
}
```








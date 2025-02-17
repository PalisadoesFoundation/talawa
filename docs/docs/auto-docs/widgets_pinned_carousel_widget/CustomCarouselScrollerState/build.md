
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

The framework calls this method in a number of different situations. For
example:

-   After calling
    [initState](https://api.flutter.dev/flutter/widgets/State/initState.html).
-   After calling
    [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html).
-   After receiving a call to
    [setState](https://api.flutter.dev/flutter/widgets/State/setState.html).
-   After a dependency of this
    [State](https://api.flutter.dev/flutter/widgets/State-class.html)
    object changes (e.g., an
    [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.md)
    referenced by the previous
    [build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md)
    changes).
-   After calling
    [deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html)
    and then reinserting the
    [State](https://api.flutter.dev/flutter/widgets/State-class.html)
    object into the tree at another location.

This method can potentially be called in every frame and should not have
any side effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether
the widget returned by this method can update the root of the existing
subtree, as determined by calling
[Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of
widgets that are configured with information from this widget\'s
constructor, the given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html),
and the internal state of this
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object.

The given
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
contains information about the location in the tree at which this widget
is being built. For example, the context provides the set of inherited
widgets for this location in the tree. The
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
argument is always the same as the `context` property of this
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
and will remain the same for the lifetime of this object. The
[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
argument is provided redundantly here so that this method matches the
signature for a
[WidgetBuilder](https://api.flutter.dev/flutter/widgets/WidgetBuilder.html).

## Design discussion

### Why is the [build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md) method on [State](https://api.flutter.dev/flutter/widgets/State-class.html), and not [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)?

Putting a `Widget build(BuildContext context)` method on
[State](https://api.flutter.dev/flutter/widgets/State-class.html) rather
than putting a `Widget build(BuildContext context, State state)` method
on
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
gives developers more flexibility when subclassing
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).

For example,
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html)
is a subclass of
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
that introduces an abstract `Widget build(BuildContext context)` method
for its subclasses to implement. If
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
already had a
[build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md)
method that took a
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
argument,
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html)
would be forced to provide its
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
to subclasses even though its
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
is an internal implementation detail of
[AnimatedWidget](https://api.flutter.dev/flutter/widgets/AnimatedWidget-class.html).

Conceptually,
[StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
could also be implemented as a subclass of
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
in a similar manner. If the
[build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md)
method were on
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
rather than
[State](https://api.flutter.dev/flutter/widgets/State-class.html), that
would not be possible anymore.

Putting the
[build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md)
function on
[State](https://api.flutter.dev/flutter/widgets/State-class.html) rather
than
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
also helps avoid a category of bugs related to closures implicitly
capturing `this`. If you defined a closure in a
[build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md)
function on a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html),
that closure would implicitly capture `this`, which is the current
widget instance, and would have the (immutable) fields of that instance
in scope:

``` language-dart
// (this is not valid Flutter code)
class MyButton extends StatefulWidgetX {
  MyButton({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, State state) {
    return SpecialWidget(
      handler: () { print('color: $color'); },
    );
  }
}
```

For example, suppose the parent builds `MyButton` with `color` being
blue, the `$color` in the print function refers to blue, as expected.
Now, suppose the parent rebuilds `MyButton` with green. The closure
created by the first build still implicitly refers to the original
widget and the `$color` still prints blue even through the widget has
been updated to green; should that closure outlive its widget, it would
print outdated information.

In contrast, with the
[build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md)
function on the
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, closures created during
[build](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState/build.md)
implicitly capture the
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
instance instead of the widget instance:

``` language-dart
class MyButton extends StatefulWidget {
  const MyButton({super.key, this.color = Colors.teal});

  final Color color;
  // ...
}

class MyButtonState extends State<MyButton> {
  // ...
  @override
  Widget build(BuildContext context) {
    return SpecialWidget(
      handler: () { print('color: ${widget.color}'); },
    );
  }
}
```

Now when the parent rebuilds `MyButton` with green, the closure created
by the first build still refers to
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, which is preserved across rebuilds, but the framework has
updated that
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object\'s
[widget](https://api.flutter.dev/flutter/widgets/State/widget.html)
property to refer to the new `MyButton` instance and `${widget.color}`
prints green, as expected.

See also:

-   [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html),
    which contains the discussion on performance considerations.



## Implementation

``` language-dart
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
          (index) => ,
        ),
      ),
    ],
  );
}
```







1.  [talawa](../../index.md)
2.  [pinned_carousel_widget](../../widgets_pinned_carousel_widget/)
3.  [CustomCarouselScrollerState](../../widgets_pinned_carousel_widget/CustomCarouselScrollerState-class.md)
4.  build method

##### CustomCarouselScrollerState class








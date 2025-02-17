
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
[build](../../widgets_talawa_error_snackbar/TalawaErrorSnackBar/build.md)
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
  final ScrollController scrollController = ;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: duration,
      curve: Curves.linear,
    );
  });

  return Row(
    children: [
      Container(
        width: 20,
        height: 80,
        decoration: BoxDecoration(
          color: messageType == MessageType.error
              ? Colors.red
              : messageType == MessageType.warning
                  ? Colors.yellow
                  : messageType == MessageType.info
                      ? Colors.green
                      : Colors.red,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Icon(
        messageType == MessageType.error
            ? Icons.error
            : messageType == MessageType.warning
                ? Icons.error
                : messageType == MessageType.info
                    ? Icons.info_outline
                    : Icons.error,
        // Icons.error,
        color: messageType == MessageType.error
            ? Colors.red
            : messageType == MessageType.warning
                ? Colors.yellow
                : messageType == MessageType.info
                    ? Colors.green
                    : Colors.red,
        size: 35,
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          child: Text(
            AppLocalizations.of(context)!.strictTranslate(errorMessage),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
```







1.  [talawa](../../index.md)
2.  [talawa_error_snackbar](../../widgets_talawa_error_snackbar/)
3.  [TalawaErrorSnackBar](../../widgets_talawa_error_snackbar/TalawaErrorSnackBar-class.md)
4.  build method

##### TalawaErrorSnackBar class








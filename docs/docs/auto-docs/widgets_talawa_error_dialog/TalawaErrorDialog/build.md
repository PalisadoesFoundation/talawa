
<div>

# build method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
build(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]
    context]

)


override




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
[build](../../widgets_talawa_error_dialog/TalawaErrorDialog/build.html)
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
  final screenWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: screenWidth * 0.8, // Adjust the width based on screen size
    child: AlertDialog(
      content: SizedBox(
        width: SizeConfig.screenWidth! * 0.65,
        height: SizeConfig.screenWidth! * 0.38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              messageType == MessageType.error
                  ? 'assets/images/Vector.svg'
                  : messageType == MessageType.warning
                      ? 'assets/images/Vector.svg'
                      : messageType == MessageType.info
                          ? 'assets/icons/Info.svg'
                          : 'assets/images/Vector.svg',
              colorFilter: ColorFilter.mode(
                messageType == MessageType.error
                    ? Colors.red
                    : messageType == MessageType.warning
                        ? Colors.yellow
                        : messageType == MessageType.info
                            ? Colors.green
                            : Colors.red,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              messageType == MessageType.error
                  ? AppLocalizations.of(context)!.strictTranslate('Error')
                  : messageType == MessageType.warning
                      ? AppLocalizations.of(context)!
                          .strictTranslate('Warning')
                      : messageType == MessageType.info
                          ? AppLocalizations.of(context)!
                              .strictTranslate('Information')
                          : AppLocalizations.of(context)!
                              .strictTranslate('Error'),
              style: TextStyle(
                color: messageType == MessageType.error
                    ? Colors.red
                    : messageType == MessageType.warning
                        ? Colors.yellow
                        : messageType == MessageType.info
                            ? Colors.green
                            : Colors.red,
                fontSize: screenWidth *
                    0.04, // Adjust the font size based on screen width
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: AutoSizeText(
                AppLocalizations.of(context)!.strictTranslate(errorMessage),
                style: const TextStyle(fontSize: 16),
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 19,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: messageType == MessageType.error
                ? Colors.red
                : messageType == MessageType.warning
                    ? Colors.red
                    : messageType == MessageType.info
                        ? Colors.black26
                        : Colors.red,
            foregroundColor: Colors.red,
          ),
          child: Text(
            messageType == MessageType.error
                ? 'Dismiss'
                : messageType == MessageType.warning
                    ? 'Dismiss'
                    : messageType == MessageType.info
                        ? 'Close'
                        : 'Dismiss',
            style: const TextStyle(color: Color.fromRGBO(202, 202, 202, 1)),
          ),
          onPressed: () {
            Navigator.of(context).;
          },
        ),
      ],
    ),
  );
}
```







1.  [talawa](../../index.html)
2.  [talawa_error_dialog](../../widgets_talawa_error_dialog/)
3.  [TalawaErrorDialog](../../widgets_talawa_error_dialog/TalawaErrorDialog-class.html)
4.  build method

##### TalawaErrorDialog class









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
[build](../../views_after_auth_screens_chat_widgets_chat_message_bubble/Message/build.md)
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
  // styling
  return Padding(
    padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 2),
    child: Row(
      mainAxisAlignment:
          message.sender!.firstName == userConfig.currentUser.firstName
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal! * 2,
            vertical: SizeConfig.blockSizeVertical! * 1.2,
          ),
          decoration: BoxDecoration(
            // if the message is sent by current user, then the background color will be white else green
            color:
                message.sender!.firstName == userConfig.currentUser.firstName
                    ? Colors.white
                    : Colors.green,
            borderRadius:
                message.sender!.firstName == userConfig.currentUser.firstName
                    ? const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    : const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
          ),
          child: Text(
            message.messageContent!,
            // if the message is sent by current user, then the text color will be black else theme bodyText color
            style: TextStyle(
              color: message.sender!.firstName ==
                      userConfig.currentUser.firstName
                  ? Colors.black
                  : Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
      ],
    ),
  );
}
```







1.  [talawa](../../index.md)
2.  [chat_message_bubble](../../views_after_auth_screens_chat_widgets_chat_message_bubble/)
3.  [Message](../../views_after_auth_screens_chat_widgets_chat_message_bubble/Message-class.md)
4.  build method

##### Message class








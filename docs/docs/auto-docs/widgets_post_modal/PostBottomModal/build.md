




build method - PostBottomModal class - post\_modal library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_modal.dart](../../widgets_post_modal/widgets_post_modal-library.html)
3. [PostBottomModal](../../widgets_post_modal/PostBottomModal-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
build(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the tree
in a given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) and when the dependencies of this widget change
(e.g., an [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling [Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

* the fields of the widget, which themselves must not change over time,
  and
* any ambient state obtained from the `context` using
  [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget's [build](../../widgets_post_modal/PostBottomModal/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

## Implementation

```
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(
                Icons.report_gmailerrorred_outlined,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            TextButton(
              key: const Key('reportPost'),
              onPressed: () {
                navigationService.showTalawaErrorSnackBar(
                  'Your Report has been sent to the Admin',
                  MessageType.info,
                );
                Navigator.pop(context);
              },
              child: Text(
                'Report the post to the Admin',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      Center(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            TextButton(
              key: const Key('deletePost'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext builder) {
                    return AlertDialog(
                      title: const Text("Warning"),
                      content: const Text(
                        "Do you really want to delete the post?",
                      ),
                      actions: <Widget>[
                        TextButton(
                          key: const Key('alert_dialog_yes_btn'),
                          onPressed: () {
                            navigationService.pop();
                            deletePost?.call(post);
                            navigationService.pop();
                            navigationService.pushDialog(
                              const CustomProgressDialog(
                                key: Key('deletePost'),
                              ),
                            );
                          },
                          child: const Text("Yes"),
                        ),
                        TextButton(
                          key: const Key('alert_dialog_no_btn'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'The post was deleted',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [post\_modal](../../widgets_post_modal/widgets_post_modal-library.html)
3. [PostBottomModal](../../widgets_post_modal/PostBottomModal-class.html)
4. build method

##### PostBottomModal class





talawa
1.0.0+1







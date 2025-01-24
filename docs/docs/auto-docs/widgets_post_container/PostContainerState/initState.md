




initState method - PostContainerState class - post\_container library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_container.dart](../../widgets_post_container/widgets_post_container-library.html)
3. [PostContainerState](../../widgets_post_container/PostContainerState-class.html)
4. initState method

initState


dark\_mode

light\_mode




# initState method


1. @override

void
initState()
override

Called when this object is inserted into the tree.

The framework will call this method exactly once for each [State](https://api.flutter.dev/flutter/widgets/State-class.html) object
it creates.

Override this method to perform initialization that depends on the
location at which this object was inserted into the tree (i.e., [context](https://api.flutter.dev/flutter/widgets/State/context.html))
or on the widget used to configure this object (i.e., [widget](https://api.flutter.dev/flutter/widgets/State/widget.html)).

If a [State](https://api.flutter.dev/flutter/widgets/State-class.html)'s [build](../../widgets_post_container/PostContainerState/build.html) method depends on an object that can itself
change state, for example a [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html) or `Stream`, or some
other object to which one can subscribe to receive notifications, then
be sure to subscribe and unsubscribe properly in [initState](../../widgets_post_container/PostContainerState/initState.html),
[didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html), and [dispose](../../widgets_post_container/PostContainerState/dispose.html):

* In [initState](../../widgets_post_container/PostContainerState/initState.html), subscribe to the object.
* In [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html) unsubscribe from the old object and subscribe
  to the new one if the updated widget configuration requires
  replacing the object.
* In [dispose](../../widgets_post_container/PostContainerState/dispose.html), unsubscribe from the object.

You should not use [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html) from this
method. However, [didChangeDependencies](https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html) will be called immediately
following this method, and [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html) can
be used there.

Implementations of this method should start with a call to the inherited
method, as in `super.initState()`.


## Implementation

```
@override
void initState() {
  super.initState();
}
```

 


1. [talawa](../../index.html)
2. [post\_container](../../widgets_post_container/widgets_post_container-library.html)
3. [PostContainerState](../../widgets_post_container/PostContainerState-class.html)
4. initState method

##### PostContainerState class





talawa
1.0.0+1












createState method - PostContainer class - post\_container library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/post\_container.dart](../../widgets_post_container/widgets_post_container-library.html)
3. [PostContainer](../../widgets_post_container/PostContainer-class.html)
4. createState method

createState


dark\_mode

light\_mode




# createState method


1. @override

[PostContainerState](../../widgets_post_container/PostContainerState-class.html)
createState()
override

Creates the mutable state for this widget at a given location in the tree.

Subclasses should override this method to return a newly created
instance of their associated [State](https://api.flutter.dev/flutter/widgets/State-class.html) subclass:

```
@override
State<SomeWidget> createState() => _SomeWidgetState();

```

The framework can call this method multiple times over the lifetime of
a [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html). For example, if the widget is inserted into the tree
in multiple locations, the framework will create a separate [State](https://api.flutter.dev/flutter/widgets/State-class.html) object
for each location. Similarly, if the widget is removed from the tree and
later inserted into the tree again, the framework will call [createState](../../widgets_post_container/PostContainer/createState.html)
again to create a fresh [State](https://api.flutter.dev/flutter/widgets/State-class.html) object, simplifying the lifecycle of
[State](https://api.flutter.dev/flutter/widgets/State-class.html) objects.


## Implementation

```
@override
PostContainerState createState() => PostContainerState();
```

 


1. [talawa](../../index.html)
2. [post\_container](../../widgets_post_container/widgets_post_container-library.html)
3. [PostContainer](../../widgets_post_container/PostContainer-class.html)
4. createState method

##### PostContainer class





talawa
1.0.0+1







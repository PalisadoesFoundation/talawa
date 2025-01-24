




createState method - AddPost class - add\_post\_page library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/add\_post\_page.dart](../../views_after_auth_screens_add_post_page/views_after_auth_screens_add_post_page-library.html)
3. [AddPost](../../views_after_auth_screens_add_post_page/AddPost-class.html)
4. createState method

createState


dark\_mode

light\_mode




# createState method


1. @override

[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[AddPost](../../views_after_auth_screens_add_post_page/AddPost-class.html)>
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
later inserted into the tree again, the framework will call [createState](../../views_after_auth_screens_add_post_page/AddPost/createState.html)
again to create a fresh [State](https://api.flutter.dev/flutter/widgets/State-class.html) object, simplifying the lifecycle of
[State](https://api.flutter.dev/flutter/widgets/State-class.html) objects.


## Implementation

```
@override
State<AddPost> createState() => _AddPostState();
```

 


1. [talawa](../../index.html)
2. [add\_post\_page](../../views_after_auth_screens_add_post_page/views_after_auth_screens_add_post_page-library.html)
3. [AddPost](../../views_after_auth_screens_add_post_page/AddPost-class.html)
4. createState method

##### AddPost class





talawa
1.0.0+1







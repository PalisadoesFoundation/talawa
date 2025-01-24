




createState method - MainScreen class - main\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/main\_screen.dart](../../views_main_screen/views_main_screen-library.html)
3. [MainScreen](../../views_main_screen/MainScreen-class.html)
4. createState method

createState


dark\_mode

light\_mode




# createState method


1. @override

[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[MainScreen](../../views_main_screen/MainScreen-class.html)>
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
later inserted into the tree again, the framework will call [createState](../../views_main_screen/MainScreen/createState.html)
again to create a fresh [State](https://api.flutter.dev/flutter/widgets/State-class.html) object, simplifying the lifecycle of
[State](https://api.flutter.dev/flutter/widgets/State-class.html) objects.


## Implementation

```
@override
State<MainScreen> createState() => _MainScreenState();
```

 


1. [talawa](../../index.html)
2. [main\_screen](../../views_main_screen/views_main_screen-library.html)
3. [MainScreen](../../views_main_screen/MainScreen-class.html)
4. createState method

##### MainScreen class





talawa
1.0.0+1












createState method - BaseView class - base\_view library - Dart API







menu

1. [talawa](../../index.html)
2. [views/base\_view.dart](../../views_base_view/views_base_view-library.html)
3. [BaseView<T extends ChangeNotifier>](../../views_base_view/BaseView-class.html)
4. createState method

createState


dark\_mode

light\_mode




# createState method


1. @override

\_BaseViewState<T>
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
later inserted into the tree again, the framework will call [createState](../../views_base_view/BaseView/createState.html)
again to create a fresh [State](https://api.flutter.dev/flutter/widgets/State-class.html) object, simplifying the lifecycle of
[State](https://api.flutter.dev/flutter/widgets/State-class.html) objects.


## Implementation

```
@override
_BaseViewState<T> createState() => _BaseViewState<T>();
```

 


1. [talawa](../../index.html)
2. [base\_view](../../views_base_view/views_base_view-library.html)
3. [BaseView<T extends ChangeNotifier>](../../views_base_view/BaseView-class.html)
4. createState method

##### BaseView class





talawa
1.0.0+1







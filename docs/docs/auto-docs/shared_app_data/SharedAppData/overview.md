# Overview for `SharedAppData`

## Description

Enables sharing key/value data with its `child` and all of the
 child's descendants.

 - `SharedAppData.getValue(context, key, initCallback)` creates a dependency
 on the key and returns the value for the key from the shared data table.
 If no value exists for key then the initCallback is used to create
 the initial value.

 - `SharedAppData.setValue(context, key, value)` changes the value of an entry
 in the shared data table and forces widgets that depend on that entry
 to be rebuilt.

 A widget whose build method uses SharedAppData.getValue(context,
 keyword, initCallback) creates a dependency on the SharedAppData. When
 the value of keyword changes with SharedAppData., the widget
 will be rebuilt. The values managed by the SharedAppData are expected
 to be immutable: intrinsic changes to values will not cause
 dependent widgets to be rebuilt.

 An instance of this widget is created automatically by [WidgetsApp].

 There are many ways to share data with a widget subtree. This
 class is based on [InheritedModel], which is an [InheritedWidget].
 It's intended to be used by packages that need to share a modest
 number of values among their own components.

 SharedAppData is not intended to be a substitute for Provider or any of
 the other general purpose application state systems. SharedAppData is
 for situations where a package's custom widgets need to share one
 or a handful of immutable data objects that can be lazily
 initialized. It exists so that packages like that can deliver
 custom widgets without requiring the developer to add a
 package-specific umbrella widget to their application.

 A good way to create an SharedAppData key that avoids potential
 collisions with other packages is to use a static `` value.
 The `SharedObject` example below does this.

 
 The following sample demonstrates using the automatically created
 [SharedAppData]. Button presses cause changes to the values for keys
 'foo', and 'bar', and those changes only cause the widgets that
 depend on those keys to be rebuilt.

 ** See code in examples/api/lib/widgets/shared_app_data/shared_app_data.0.dart **
 

 
 The following sample demonstrates how a single lazily computed
 value could be shared within an app. A Flutter package that
 provided custom widgets might use this approach to share a (possibly
 private) value with instances of those widgets.

 ** See code in examples/api/lib/widgets/shared_app_data/shared_app_data.1.dart **
 

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates a widget based on [InheritedModel] that supports build
 dependencies qualified by keywords. Descendant widgets create
 such dependencies with [SharedAppData.getValue] and they trigger
 rebuilds with [SharedAppData.setValue].

 This widget is automatically created by the [WidgetsApp].


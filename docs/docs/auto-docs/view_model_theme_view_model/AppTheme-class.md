




AppTheme class - theme\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/theme\_view\_model.dart](../view_model_theme_view_model/view_model_theme_view_model-library.html)
3. AppTheme class

AppTheme


dark\_mode

light\_mode




# AppTheme class


AppTheme class is a type of ViewModel to serve data from model to views in the context of App Themes.

Methods include:

* `switchTheme`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* AppTheme



## Constructors

[AppTheme](../view_model_theme_view_model/AppTheme/AppTheme.html)()




## Properties

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[isdarkTheme](../view_model_theme_view_model/AppTheme/isdarkTheme.html)
→ bool

flag to check darkMode.
no setter

[key](../view_model_theme_view_model/AppTheme/key.html)
→ String

Key for dynamic theme.
final

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[theme](../view_model_theme_view_model/AppTheme/theme.html)
→ [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)

getter to fetch current theme.
no setter



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[initialize](../view_model_theme_view_model/AppTheme/initialize.html)()
→ void


Initializes the theme settings.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[switchTheme](../view_model_theme_view_model/AppTheme/switchTheme.html)({required bool isOn})
→ void


This function switches the app theme.

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [theme\_view\_model](../view_model_theme_view_model/view_model_theme_view_model-library.html)
3. AppTheme class

##### theme\_view\_model library





talawa
1.0.0+1












operator == method - MainScreenArgs class - mainscreen\_navigation\_args library - Dart API







menu

1. [talawa](../../index.html)
2. [models/mainscreen\_navigation\_args.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_mainscreen_navigation_args/)
3. [MainScreenArgs](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_mainscreen_navigation_args/MainScreenArgs-class.html)
4. operator == method

operator ==


dark\_mode

light\_mode




# operator == method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
operator ==(

1. [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other

)
override

Overrides the equality operator to compare instances of the MainScreenArgs class.

Checks whether the `other` object is of the same type and compares its properties:
If all properties match, returns `true`; otherwise, returns `false`.

**params**:

* `other`: The object to compare against this MainScreenArgs instance.

**returns**:

* `bool`: Returns `true` if the properties of both instances match; otherwise, `false`.

## Implementation

```
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is MainScreenArgs &&
        other.fromSignUp == fromSignUp &&
        other.mainScreenIndex == mainScreenIndex &&
        other.toggleDemoMode == toggleDemoMode;
```

 


1. [talawa](../../index.html)
2. [mainscreen\_navigation\_args](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_mainscreen_navigation_args/)
3. [MainScreenArgs](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_mainscreen_navigation_args/MainScreenArgs-class.html)
4. operator == method

##### MainScreenArgs class





talawa
1.0.0+1







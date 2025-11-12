



menu

1.  [talawa](../../index.md)
2.  [models/mainscreen_navigation_args.dart](../../models_mainscreen_navigation_args/)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.md)
4.  operator == method


operator ==


 dark_mode   light_mode 




<div>

# operator == method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
operator ==(

1.  [[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)]
    other]

)


override




Overrides the equality operator to compare instances of the
MainScreenArgs class.

Checks whether the `other` object is of the same type and compares its
properties: If all properties match, returns `true`; otherwise, returns
`false`.

**params**:

-   `other`: The object to compare against this MainScreenArgs instance.

**returns**:

-   `bool`: Returns `true` if the properties of both instances match;
    otherwise, `false`.



## Implementation

``` language-dart
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is MainScreenArgs &&
        other.fromSignUp == fromSignUp &&
        other.mainScreenIndex == mainScreenIndex &&
        other.toggleDemoMode == toggleDemoMode;
```







1.  [talawa](../../index.md)
2.  [mainscreen_navigation_args](../../models_mainscreen_navigation_args/)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.md)
4.  operator == method

##### MainScreenArgs class









 talawa 1.0.0+1 

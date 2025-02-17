
<div>

# hashCode property

</div>



<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
get hashCode


override




Overrides the hashCode getter to generate a hash code based on the
properties of the MainScreenArgs instance.

Returns an integer value representing the combined hash codes.



## Implementation

``` language-dart
@override
int get hashCode =>
    fromSignUp.hashCode ^ mainScreenIndex.hashCode ^ toggleDemoMode.hashCode;
```








1.  [talawa](../../index.html)
2.  [mainscreen_navigation_args](../../models_mainscreen_navigation_args/)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.html)
4.  hashCode property

##### MainScreenArgs class








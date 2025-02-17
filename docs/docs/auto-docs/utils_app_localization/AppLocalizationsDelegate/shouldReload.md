
<div>

# shouldReload method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
shouldReload(

1.  [covariant
    [[AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)]
    old]

)


override




Returns true if the resources for this delegate should be loaded again
by calling the
[load](../../utils_app_localization/AppLocalizationsDelegate/load.html)
method.

This method is called whenever its
[Localizations](https://api.flutter.dev/flutter/widgets/Localizations-class.html)
widget is rebuilt. If it returns true then dependent widgets will be
rebuilt after
[load](../../utils_app_localization/AppLocalizationsDelegate/load.html)
has completed.



## Implementation

``` language-dart
@override
bool shouldReload(AppLocalizationsDelegate old) => false;
```







1.  [talawa](../../index.html)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4.  shouldReload method

##### AppLocalizationsDelegate class













shouldReload method - AppLocalizationsDelegate class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4. shouldReload method

shouldReload


dark\_mode

light\_mode




# shouldReload method


1. @override

bool
shouldReload(

1. covariant [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html) old

)
override

Returns true if the resources for this delegate should be loaded
again by calling the [load](../../utils_app_localization/AppLocalizationsDelegate/load.html) method.

This method is called whenever its [Localizations](https://api.flutter.dev/flutter/widgets/Localizations-class.html) widget is
rebuilt. If it returns true then dependent widgets will be rebuilt
after [load](../../utils_app_localization/AppLocalizationsDelegate/load.html) has completed.


## Implementation

```
@override
bool shouldReload(AppLocalizationsDelegate old) => false;
```

 


1. [talawa](../../index.html)
2. [app\_localization](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4. shouldReload method

##### AppLocalizationsDelegate class





talawa
1.0.0+1







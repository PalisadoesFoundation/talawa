
<div>

# createState method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[AppSettingsPage](../../views_after_auth_screens_app_settings_app_settings_page/AppSettingsPage-class.md)]\>]]



override




Creates the mutable state for this widget at a given location in the
tree.

Subclasses should override this method to return a newly created
instance of their associated
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
subclass:

``` language-dart
@override
State<SomeWidget>  => ;
```

The framework can call this method multiple times over the lifetime of a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html).
For example, if the widget is inserted into the tree in multiple
locations, the framework will create a separate
[State](https://api.flutter.dev/flutter/widgets/State-class.html) object
for each location. Similarly, if the widget is removed from the tree and
later inserted into the tree again, the framework will call
[createState](../../views_after_auth_screens_app_settings_app_settings_page/AppSettingsPage/createState.md)
again to create a fresh
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
object, simplifying the lifecycle of
[State](https://api.flutter.dev/flutter/widgets/State-class.html)
objects.



## Implementation

``` language-dart
@override
State<AppSettingsPage>  => ;
```







1.  [talawa](../../index.md)
2.  [app_settings_page](../../views_after_auth_screens_app_settings_app_settings_page/)
3.  [AppSettingsPage](../../views_after_auth_screens_app_settings_app_settings_page/AppSettingsPage-class.md)
4.  createState method

##### AppSettingsPage class








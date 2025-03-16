
<div>

# AppLocalizationsDelegate class

</div>



Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [LocalizationsDelegate](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate-class.html)[\<[[AppLocalizations](../utils_app_localization/AppLocalizations-class.md)]\>]
    -   AppLocalizationsDelegate



## Constructors

[[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate/AppLocalizationsDelegate.md)][]

:   ::: 
    const
    :::



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[isTest](../utils_app_localization/AppLocalizationsDelegate/isTest.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    final
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[type](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/type.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   The type of the object returned by the
    [load](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/load.html)
    method, T by default.
    ::: features
    no setterinherited
    :::



## Methods

[[isSupported](../utils_app_localization/AppLocalizationsDelegate/isSupported.md)][([[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)] locale]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Whether resources for the given locale can be loaded by this
    delegate.
    ::: features
    override
    :::

[[load](../utils_app_localization/AppLocalizationsDelegate/load.md)][([[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)] locale]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[AppLocalizations](../utils_app_localization/AppLocalizations-class.md)]\>]] ]
:   Start loading the resources for `locale`. The returned future
    completes when the resources have finished loading.
    ::: features
    override
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[shouldReload](../utils_app_localization/AppLocalizationsDelegate/shouldReload.md)][([covariant [[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate-class.md)] old]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Returns true if the resources for this delegate should be loaded
    again by calling the
    [load](../utils_app_localization/AppLocalizationsDelegate/load.md)
    method.
    ::: features
    override
    :::

[[toString](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [app_localization](../utils_app_localization/)
3.  AppLocalizationsDelegate class

##### app_localization library













AppLocalizationsDelegate class - app\_localization library - Dart API







menu

1. [talawa](../index.html)
2. [utils/app\_localization.dart](../utils_app_localization/utils_app_localization-library.html)
3. AppLocalizationsDelegate class

AppLocalizationsDelegate


dark\_mode

light\_mode




# AppLocalizationsDelegate class


Inheritance

* Object
* [LocalizationsDelegate](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate-class.html)<[AppLocalizations](../utils_app_localization/AppLocalizations-class.html)>
* AppLocalizationsDelegate



## Constructors

[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate/AppLocalizationsDelegate.html)({bool isTest = false})

const



## Properties

[hashCode](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[isTest](../utils_app_localization/AppLocalizationsDelegate/isTest.html)
→ bool

final

[runtimeType](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[type](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/type.html)
→ Type

The type of the object returned by the [load](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/load.html) method, T by default.
no setterinherited



## Methods

[isSupported](../utils_app_localization/AppLocalizationsDelegate/isSupported.html)([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) locale)
→ bool


Whether resources for the given locale can be loaded by this delegate.
override

[load](../utils_app_localization/AppLocalizationsDelegate/load.html)([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) locale)
→ Future<[AppLocalizations](../utils_app_localization/AppLocalizations-class.html)>


Start loading the resources for `locale`. The returned future completes
when the resources have finished loading.
override

[noSuchMethod](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[shouldReload](../utils_app_localization/AppLocalizationsDelegate/shouldReload.html)(covariant [AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate-class.html) old)
→ bool


Returns true if the resources for this delegate should be loaded
again by calling the [load](../utils_app_localization/AppLocalizationsDelegate/load.html) method.
override

[toString](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [app\_localization](../utils_app_localization/utils_app_localization-library.html)
3. AppLocalizationsDelegate class

##### app\_localization library





talawa
1.0.0+1







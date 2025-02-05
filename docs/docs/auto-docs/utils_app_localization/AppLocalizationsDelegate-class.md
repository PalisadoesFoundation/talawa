


# AppLocalizationsDelegate class












**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [LocalizationsDelegate](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate-class.html)&lt;[AppLocalizations](../utils_app_localization/AppLocalizations-class.md)>
- AppLocalizationsDelegate








## Constructors

[AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate/AppLocalizationsDelegate.md) ({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isTest = false})

  _const_ 


## Properties

##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isTest](../utils_app_localization/AppLocalizationsDelegate/isTest.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">final</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [type](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/type.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



The type of the object returned by the <a href="../utils_app_localization/AppLocalizationsDelegate/load.md">load</a> method, T by default.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [isSupported](../utils_app_localization/AppLocalizationsDelegate/isSupported.md)([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) locale) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether resources for the given locale can be loaded by this delegate.  
_<span class="feature">override</span>_



##### [load](../utils_app_localization/AppLocalizationsDelegate/load.md)([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) locale) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[AppLocalizations](../utils_app_localization/AppLocalizations-class.md)>



Start loading the resources for <code>locale</code>. The returned future completes
when the resources have finished loading.  
_<span class="feature">override</span>_



##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [shouldReload](../utils_app_localization/AppLocalizationsDelegate/shouldReload.md)(covariant [AppLocalizationsDelegate](../utils_app_localization/AppLocalizationsDelegate-class.md) old) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Returns true if the resources for this delegate should be loaded
again by calling the <a href="../utils_app_localization/AppLocalizationsDelegate/load.md">load</a> method.  
_<span class="feature">override</span>_



##### [toString](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_
















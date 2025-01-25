




AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/lang\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. AppLanguage class

AppLanguage


dark\_mode

light\_mode




# AppLanguage class


AppLanguage view model class interact with modal in the context of the App Language.

The class provides methods that set's the language, change the language in the modal.

Methods include:

* `fetchLocale`
* `changeLanguage`
* `selectLanguagePress`
* `dbLanguageUpdate`
* `appLanguageQuery`
* `userLanguageQuery`

## Constructors

[AppLanguage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/AppLanguage.html)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isTest = false})




## Properties

[appLocal](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/appLocal.html)
→ dynamic

getter for appLocal.
no setter

[databaseFunctions](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/databaseFunctions.html)
→ dynamic

Functions related to database mutations.
final

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[isTest](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/isTest.html)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Represents a boolean value indicating whether the current environment is a test environment.
final

[navigationService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/navigationService.html)
→ dynamic

A service that provides navigation-related functionalities.
final

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[appLanguageQuery](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/appLanguageQuery.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Queries the app language.

[changeLanguage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/changeLanguage.html)(dynamic type)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function change the app default language.

[dbLanguageUpdate](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/dbLanguageUpdate.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function updates the Database Language by running the graphQL `mutations`.

[fetchLocale](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/fetchLocale.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function fetch the language of the user's app.

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/initialize.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


initialiser.

[localeResoultion](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/localeResoultion.html)(dynamic locale, [Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.html) supportedLocales)
→ dynamic


This function fetches the appropriate locale for the user's app based on the provided locale and supported locales.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[selectLanguagePress](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/selectLanguagePress.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Navigates the user after choosing lthe anguage.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[userLanguageQuery](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage/userLanguageQuery.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function perform graphQL query to check the user's language in the database.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [lang\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. AppLanguage class

##### lang\_view\_model library





talawa
1.0.0+1







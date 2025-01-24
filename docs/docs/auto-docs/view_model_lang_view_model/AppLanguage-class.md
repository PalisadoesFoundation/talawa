




AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/lang\_view\_model.dart](../view_model_lang_view_model/view_model_lang_view_model-library.html)
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

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* AppLanguage



## Constructors

[AppLanguage](../view_model_lang_view_model/AppLanguage/AppLanguage.html)({bool isTest = false})




## Properties

[appLocal](../view_model_lang_view_model/AppLanguage/appLocal.html)
→ [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)

getter for appLocal.
no setter

[databaseFunctions](../view_model_lang_view_model/AppLanguage/databaseFunctions.html)
→ [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.html)

Functions related to database mutations.
final

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[isTest](../view_model_lang_view_model/AppLanguage/isTest.html)
→ bool

Represents a boolean value indicating whether the current environment is a test environment.
final

[navigationService](../view_model_lang_view_model/AppLanguage/navigationService.html)
→ [NavigationService](../services_navigation_service/NavigationService-class.html)

A service that provides navigation-related functionalities.
final

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[appLanguageQuery](../view_model_lang_view_model/AppLanguage/appLanguageQuery.html)()
→ Future<void>


Queries the app language.

[changeLanguage](../view_model_lang_view_model/AppLanguage/changeLanguage.html)([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) type)
→ Future<void>


This function change the app default language.

[dbLanguageUpdate](../view_model_lang_view_model/AppLanguage/dbLanguageUpdate.html)()
→ Future<void>


This function updates the Database Language by running the graphQL `mutations`.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[fetchLocale](../view_model_lang_view_model/AppLanguage/fetchLocale.html)()
→ Future<void>


This function fetch the language of the user's app.

[initialize](../view_model_lang_view_model/AppLanguage/initialize.html)()
→ Future<void>


initialiser.

[localeResoultion](../view_model_lang_view_model/AppLanguage/localeResoultion.html)([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)? locale, Iterable<[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)> supportedLocales)
→ [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)


This function fetches the appropriate locale for the user's app based on the provided locale and supported locales.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[selectLanguagePress](../view_model_lang_view_model/AppLanguage/selectLanguagePress.html)()
→ Future<void>


Navigates the user after choosing lthe anguage.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[userLanguageQuery](../view_model_lang_view_model/AppLanguage/userLanguageQuery.html)(String userId)
→ Future<void>


This function perform graphQL query to check the user's language in the database.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [lang\_view\_model](../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. AppLanguage class

##### lang\_view\_model library





talawa
1.0.0+1







<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/lang_view_model.dart](../view_model_lang_view_model/)
3.  AppLanguage class

<div class="self-name">

AppLanguage

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_lang_view_model/view_model_lang_view_model-library-sidebar.html"
below-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html">

<div>

# <span class="kind-class">AppLanguage</span> class

</div>

<div class="section desc markdown">

AppLanguage view model class interact with modal in the context of the
App Language.

The class provides methods that set's the language, change the language
in the modal.

Methods include:

- `fetchLocale`
- `changeLanguage`
- `selectLanguagePress`
- `dbLanguageUpdate`
- `appLanguageQuery`
- `userLanguageQuery`

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- AppLanguage

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[AppLanguage](../view_model_lang_view_model/AppLanguage/AppLanguage.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[appLocal](../view_model_lang_view_model/AppLanguage/appLocal.md)</span> <span class="signature">→ [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)</span>  
getter for appLocal.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[databaseFunctions](../view_model_lang_view_model/AppLanguage/databaseFunctions.md)</span> <span class="signature">→ [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.md)</span>  
Functions related to database mutations.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isTest](../view_model_lang_view_model/AppLanguage/isTest.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Represents a boolean value indicating whether the current environment is
a test environment.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[navigationService](../view_model_lang_view_model/AppLanguage/navigationService.md)</span> <span class="signature">→ [NavigationService](../services_navigation_service/NavigationService-class.md)</span>  
A service that provides navigation-related functionalities.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[appLanguageQuery](../view_model_lang_view_model/AppLanguage/appLanguageQuery.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Queries the app language.

<span class="name">[changeLanguage](../view_model_lang_view_model/AppLanguage/changeLanguage.md)</span><span class="signature">(<span id="changeLanguage-param-type" class="parameter"><span class="type-annotation">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)</span> <span class="parameter-name">type</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function change the app default language.

<span class="name">[dbLanguageUpdate](../view_model_lang_view_model/AppLanguage/dbLanguageUpdate.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function updates the Database Language by running the graphQL
`mutations`.

<span class="name">[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[fetchLocale](../view_model_lang_view_model/AppLanguage/fetchLocale.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function fetch the language of the user's app.

<span class="name">[initialize](../view_model_lang_view_model/AppLanguage/initialize.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
initialiser.

<span class="name">[localeResoultion](../view_model_lang_view_model/AppLanguage/localeResoultion.md)</span><span class="signature">(<span id="localeResoultion-param-locale" class="parameter"><span class="type-annotation">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)?</span> <span class="parameter-name">locale</span>, </span><span id="localeResoultion-param-supportedLocales" class="parameter"><span class="type-annotation">[Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.html)<span class="signature">\<<span class="type-parameter">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)</span>\></span></span> <span class="parameter-name">supportedLocales</span></span>) <span class="returntype parameter">→ [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)</span> </span>  
This function fetches the appropriate locale for the user's app based on
the provided locale and supported locales.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[selectLanguagePress](../view_model_lang_view_model/AppLanguage/selectLanguagePress.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Navigates the user after choosing lthe anguage.

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[userLanguageQuery](../view_model_lang_view_model/AppLanguage/userLanguageQuery.md)</span><span class="signature">(<span id="userLanguageQuery-param-userId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">userId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function perform graphQL query to check the user's language in the
database.

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [lang_view_model](../view_model_lang_view_model/)
3.  AppLanguage class

##### lang_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

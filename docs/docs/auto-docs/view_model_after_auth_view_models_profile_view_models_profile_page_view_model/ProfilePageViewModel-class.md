




ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/view_model_after_auth_view_models_profile_view_models_profile_page_view_model-library.html)
3. ProfilePageViewModel class

ProfilePageViewModel


dark\_mode

light\_mode




# ProfilePageViewModel class


ProfilePageViewModel class helps to interact with model to serve data and react to user's input in Profile Page view.

Methods include:

* `logout`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* ProfilePageViewModel



## Constructors

[ProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/ProfilePageViewModel.html)()




## Properties

[bottomSheetHeight](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/bottomSheetHeight.html)
↔ double

Size of Bottom Sheet Height.
getter/setter pair

[currentOrg](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentOrg.html)
↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)

Holds Current Organization.
getter/setter pair

[currentUser](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentUser.html)
↔ [User](../models_user_user_info/User-class.html)

Holds Current user.
getter/setter pair

[denomination](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/denomination.html)
→ List<String>

denomination.
final

[donationAmount](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationAmount.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

Text Controller for donation Amount.
getter/setter pair

[donationCurrency](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrency.html)
↔ String

donationCurrency.
getter/setter pair

[donationCurrencySymbol](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrencySymbol.html)
↔ String

Currency Symbol.
getter/setter pair

[donationField](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationField.html)
→ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

FocusNode for donationField.
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

[organisation](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/organisation.html)
↔ [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)<[OrgInfo](../models_organization_org_info/OrgInfo-class.html)>

Hive Box of organisation.
latefinal

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[scaffoldKey](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/scaffoldKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[ScaffoldState](https://api.flutter.dev/flutter/material/ScaffoldState-class.html)>

GlobalKey for scaffoldKey.
final

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[url](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/url.html)
↔ [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)

Hive Box of url.
latefinal

[user](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/user.html)
↔ [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)<[User](../models_user_user_info/User-class.html)>

Hive Box of user.
latefinal



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[attachListener](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/attachListener.html)(void setter(void ()))
→ void


This widget returns button for domination.

[changeCurrency](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/changeCurrency.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, void setter(void ()))
→ void


This method changes the currency of the user for donation purpose.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[dominationButton](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/dominationButton.html)(String amount, [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, void setter(void ()))
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)


This widget returns button for domination.

[iconButton](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/iconButton.html)([Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon, void onTap())
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)


This widget returns the button for social media sharing option.

[initialize](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/initialize.html)()
→ void


First function to initialize the viewmodel.

[invite](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/invite.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ void


This Function creates a QR Code for latest release .

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[popBottomSheet](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/popBottomSheet.html)()
→ void


pop the route from `navigationService`.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[showSnackBar](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/showSnackBar.html)(String message)
→ void


show message on Snack Bar.

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updateSheetHeight](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/updateSheetHeight.html)()
→ void


to update the bottom sheet height.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [profile\_page\_view\_model](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/view_model_after_auth_view_models_profile_view_models_profile_page_view_model-library.html)
3. ProfilePageViewModel class

##### profile\_page\_view\_model library





talawa
1.0.0+1







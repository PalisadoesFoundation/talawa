




ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. ProfilePageViewModel class

ProfilePageViewModel


dark\_mode

light\_mode




# ProfilePageViewModel class


ProfilePageViewModel class helps to interact with model to serve data and react to user's input in Profile Page view.

Methods include:

* `logout`

## Constructors

[ProfilePageViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/ProfilePageViewModel.html)()




## Properties

[bottomSheetHeight](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/bottomSheetHeight.html)
↔ [double](https://api.flutter.dev/flutter/dart-core/double-class.html)

Size of Bottom Sheet Height.
getter/setter pair

[currentOrg](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentOrg.html)
↔ dynamic

Holds Current Organization.
getter/setter pair

[currentUser](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentUser.html)
↔ dynamic

Holds Current user.
getter/setter pair

[denomination](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/denomination.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>

denomination.
final

[donationAmount](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationAmount.html)
↔ dynamic

Text Controller for donation Amount.
getter/setter pair

[donationCurrency](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrency.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

donationCurrency.
getter/setter pair

[donationCurrencySymbol](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrencySymbol.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Currency Symbol.
getter/setter pair

[donationField](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationField.html)
→ dynamic

FocusNode for donationField.
final

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[organisation](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/organisation.html)
↔ dynamic

Hive Box of organisation.
latefinal

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[scaffoldKey](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/scaffoldKey.html)
→ dynamic

GlobalKey for scaffoldKey.
final

[url](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/url.html)
↔ dynamic

Hive Box of url.
latefinal

[user](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/user.html)
↔ dynamic

Hive Box of user.
latefinal



## Methods

[attachListener](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/attachListener.html)(void setter(void ()))
→ void


This widget returns button for domination.

[changeCurrency](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/changeCurrency.html)(dynamic context, void setter(void ()))
→ void


This method changes the currency of the user for donation purpose.

[dominationButton](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/dominationButton.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) amount, dynamic context, void setter(void ()))
→ dynamic


This widget returns button for domination.

[iconButton](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/iconButton.html)(dynamic icon, void onTap())
→ dynamic


This widget returns the button for social media sharing option.

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/initialize.html)()
→ void


First function to initialize the viewmodel.

[invite](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/invite.html)(dynamic context)
→ void


This Function creates a QR Code for latest release .

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[popBottomSheet](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/popBottomSheet.html)()
→ void


pop the route from `navigationService`.

[showSnackBar](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/showSnackBar.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) message)
→ void


show message on Snack Bar.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateSheetHeight](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/updateSheetHeight.html)()
→ void


to update the bottom sheet height.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [profile\_page\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. ProfilePageViewModel class

##### profile\_page\_view\_model library





talawa
1.0.0+1







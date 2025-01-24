




SetUrlViewModel class - set\_url\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/pre\_auth\_view\_models/set\_url\_view\_model.dart](../view_model_pre_auth_view_models_set_url_view_model/view_model_pre_auth_view_models_set_url_view_model-library.html)
3. SetUrlViewModel class

SetUrlViewModel


dark\_mode

light\_mode




# SetUrlViewModel class


SetUrlViewModel class helps to interact with model to serve data.

and react to user's input for Set Url Section.
Methods include:

* `checkURLandNavigate`
* `scanQR`
* `initialise`
* `checkURLandNavigate`
* `checkURLandShowPopUp`
* `scanQR`
* `_onQRViewCreated`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* SetUrlViewModel



## Constructors

[SetUrlViewModel](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/SetUrlViewModel.html)()




## Properties

[formKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/formKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>

formKey.
final

[greeting](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/greeting.html)
↔ List<Map<String, dynamic>>

qrController.
getter/setter pair

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

[orgId](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/orgId.html)
↔ String

organizationID.
getter/setter pair

[qrKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/qrKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[State](https://api.flutter.dev/flutter/widgets/State-class.html)<[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>

qrKey.
final

[result](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/result.html)
↔ [Barcode](https://pub.dev/documentation/qr_code_scanner/1.0.1/qr_code_scanner/Barcode-class.html)

qrText.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[url](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/url.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

url.
getter/setter pair

[urlFocus](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

urlFocus.
getter/setter pair

[validate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/validate.html)
↔ [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)

qrValidator.
getter/setter pair



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[checkURLandNavigate](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandNavigate.html)(String navigateTo, String argument)
→ Future<void>


This function check the URL and navigate to the respective URL.

[checkURLandShowPopUp](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/checkURLandShowPopUp.html)(String argument)
→ Future<void>


This function check the URL and navigate to the respective URL.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[initialise](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/initialise.html)({String inviteUrl = ''})
→ void


This function initialises the variables.

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

[scanQR](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/scanQR.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ void


This function create a widget which is used to scan the QR-code.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



## Constants

[imageUrlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/imageUrlKey-constant.html)
→ const String

imageUrlKey.

[urlKey](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel/urlKey-constant.html)
→ const String

urlKey.



 


1. [talawa](../index.html)
2. [set\_url\_view\_model](../view_model_pre_auth_view_models_set_url_view_model/view_model_pre_auth_view_models_set_url_view_model-library.html)
3. SetUrlViewModel class

##### set\_url\_view\_model library





talawa
1.0.0+1







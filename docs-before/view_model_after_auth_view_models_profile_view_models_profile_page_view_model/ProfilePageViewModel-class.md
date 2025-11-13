<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  ProfilePageViewModel class

<div class="self-name">

ProfilePageViewModel

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/view_model_after_auth_view_models_profile_view_models_profile_page_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class-sidebar.html">

<div>

# <span class="kind-class">ProfilePageViewModel</span> class

</div>

<div class="section desc markdown">

ProfilePageViewModel class helps to interact with model to serve data
and react to user's input in Profile Page view.

Methods include:

- `logout`

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- ProfilePageViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ProfilePageViewModel.new](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/ProfilePageViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[bottomSheetHeight](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/bottomSheetHeight.md)</span> <span class="signature">↔ [double](https://api.flutter.dev/flutter/dart-core/double-class.html)</span>  
Size of Bottom Sheet Height.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[currentOrg](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentOrg.md)</span> <span class="signature">↔ [OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>  
Holds Current Organization.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[currentUser](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/currentUser.md)</span> <span class="signature">↔ [User](../models_user_user_info/User-class.md)</span>  
Holds Current user.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[denomination](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/denomination.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span></span>  
denomination.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[donationAmount](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationAmount.md)</span> <span class="signature">↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)</span>  
Text Controller for donation Amount.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[donationCurrency](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrency.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
donationCurrency.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[donationCurrencySymbol](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationCurrencySymbol.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>  
Currency Symbol.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[donationField](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/donationField.md)</span> <span class="signature">→ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)</span>  
FocusNode for donationField.

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

<span class="name">[organisation](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/organisation.md)</span> <span class="signature">↔ [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)<span class="signature">\<<span class="type-parameter">[OrgInfo](../models_organization_org_info/OrgInfo-class.md)</span>\></span></span>  
Hive Box of organisation.

<div class="features">

<span class="feature">late</span><span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[scaffoldKey](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/scaffoldKey.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[ScaffoldState](https://api.flutter.dev/flutter/material/ScaffoldState-class.html)</span>\></span></span>  
GlobalKey for scaffoldKey.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[url](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/url.md)</span> <span class="signature">↔ [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)</span>  
Hive Box of url.

<div class="features">

<span class="feature">late</span><span class="feature">final</span>

</div>

<span class="name">[user](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/user.md)</span> <span class="signature">↔ [Box](https://pub.dev/documentation/hive/2.2.3/hive/Box-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span>  
Hive Box of user.

<div class="features">

<span class="feature">late</span><span class="feature">final</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[attachListener](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/attachListener.md)</span><span class="signature">(<span id="attachListener-param-setter" class="parameter"><span class="type-annotation">void</span> <span class="parameter-name">setter</span>(<span id="param-" class="parameter"><span class="type-annotation">void</span> <span class="parameter-name"></span></span>)</span>) <span class="returntype parameter">→ void</span> </span>  
This widget returns button for domination.

<span class="name">[changeCurrency](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/changeCurrency.md)</span><span class="signature">(<span id="changeCurrency-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span>, </span><span id="changeCurrency-param-setter" class="parameter"><span class="type-annotation">void</span> <span class="parameter-name">setter</span>(<span id="param-" class="parameter"><span class="type-annotation">void</span> <span class="parameter-name"></span></span>)</span>) <span class="returntype parameter">→ void</span> </span>  
This method changes the currency of the user for donation purpose.

<span class="name">[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[dominationButton](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/dominationButton.md)</span><span class="signature">(<span id="dominationButton-param-amount" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">amount</span>, </span><span id="dominationButton-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)</span> <span class="parameter-name">context</span>, </span><span id="dominationButton-param-setter" class="parameter"><span class="type-annotation">void</span> <span class="parameter-name">setter</span>(<span id="param-" class="parameter"><span class="type-annotation">void</span> <span class="parameter-name"></span></span>)</span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
This widget returns button for domination.

<span class="name">[iconButton](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/iconButton.md)</span><span class="signature">(<span id="iconButton-param-icon" class="parameter"><span class="type-annotation">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.md)</span> <span class="parameter-name">icon</span>, </span><span id="iconButton-param-onTap" class="parameter"><span class="type-annotation">void</span> <span class="parameter-name">onTap</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
This widget returns the button for social media sharing option.

<span class="name">[initialize](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/initialize.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
First function to initialize the viewmodel.

<span class="name">[invite](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/invite.md)</span><span class="signature">(<span id="invite-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ void</span> </span>  
This Function creates a QR Code for latest release .

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

<span class="name">[popBottomSheet](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/popBottomSheet.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
pop the route from `navigationService`.

<span class="name">[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[showSnackBar](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/showSnackBar.md)</span><span class="signature">(<span id="showSnackBar-param-message" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">message</span></span>) <span class="returntype parameter">→ void</span> </span>  
show message on Snack Bar.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateSheetHeight](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel/updateSheetHeight.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
to update the bottom sheet height.

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
2.  [profile_page_view_model](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3.  ProfilePageViewModel class

##### profile_page_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

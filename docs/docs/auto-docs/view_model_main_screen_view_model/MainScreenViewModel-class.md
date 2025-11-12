<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/main_screen_view_model.dart](../view_model_main_screen_view_model/)
3.  MainScreenViewModel class

<div class="self-name">

MainScreenViewModel

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_main_screen_view_model/view_model_main_screen_view_model-library-sidebar.html"
below-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html">

<div>

# <span class="kind-class">MainScreenViewModel</span> class

</div>

<div class="section desc markdown">

MainScreenViewModel class provide methods to interact with the modal to
serve data in user's action in Main Screen Views.

The functions in this class are mainly in the context of Tutorials for
different componenets of the App.

Functions include:

- `showTutorial`
- `showHome`
- `tourEventTargets`
- `tourAddPost`
- `tourChat`
- `tourProfile`

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- MainScreenViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel/MainScreenViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[appTour](../view_model_main_screen_view_model/MainScreenViewModel/appTour.md)</span> <span class="signature">↔ [AppTour](../models_app_tour/AppTour-class.md)</span>  
tutorialCoachMark consist of coach used to give tutorial.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[context](../view_model_main_screen_view_model/MainScreenViewModel/context.md)</span> <span class="signature">↔ [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)</span>  
context consist of parent info.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[currentPageIndex](../view_model_main_screen_view_model/MainScreenViewModel/currentPageIndex.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
var for current page in index.

<div class="features">

<span class="feature">getter/setter pair</span>

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

<span class="name">[keyBNChat](../view_model_main_screen_view_model/MainScreenViewModel/keyBNChat.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNDemoEvents](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoEvents.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNDemoHome](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoHome.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNDemoPost](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoPost.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNDemoProfile](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoProfile.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNEvents](../view_model_main_screen_view_model/MainScreenViewModel/keyBNEvents.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNFunds](../view_model_main_screen_view_model/MainScreenViewModel/keyBNFunds.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNHome](../view_model_main_screen_view_model/MainScreenViewModel/keyBNHome.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNPost](../view_model_main_screen_view_model/MainScreenViewModel/keyBNPost.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyBNProfile](../view_model_main_screen_view_model/MainScreenViewModel/keyBNProfile.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyDrawerCurOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerCurOrg.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyDrawerJoinOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerJoinOrg.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyDrawerLeaveCurrentOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerLeaveCurrentOrg.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keyDrawerSwitchableOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerSwitchableOrg.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySEAdd](../view_model_main_screen_view_model/MainScreenViewModel/keySEAdd.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySECard](../view_model_main_screen_view_model/MainScreenViewModel/keySECard.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySECategoryMenu](../view_model_main_screen_view_model/MainScreenViewModel/keySECategoryMenu.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySEDateFilter](../view_model_main_screen_view_model/MainScreenViewModel/keySEDateFilter.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySHMenuIcon](../view_model_main_screen_view_model/MainScreenViewModel/keySHMenuIcon.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySHOrgName](../view_model_main_screen_view_model/MainScreenViewModel/keySHOrgName.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySHPinnedPost](../view_model_main_screen_view_model/MainScreenViewModel/keySHPinnedPost.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySHPost](../view_model_main_screen_view_model/MainScreenViewModel/keySHPost.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySPAppSetting](../view_model_main_screen_view_model/MainScreenViewModel/keySPAppSetting.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySPDonateUs](../view_model_main_screen_view_model/MainScreenViewModel/keySPDonateUs.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySPEditProfile](../view_model_main_screen_view_model/MainScreenViewModel/keySPEditProfile.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySPHelp](../view_model_main_screen_view_model/MainScreenViewModel/keySPHelp.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySPInvite](../view_model_main_screen_view_model/MainScreenViewModel/keySPInvite.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySPLogout](../view_model_main_screen_view_model/MainScreenViewModel/keySPLogout.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[keySPPalisadoes](../view_model_main_screen_view_model/MainScreenViewModel/keySPPalisadoes.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[State](https://api.flutter.dev/flutter/widgets/State-class.html)<span class="signature">\<<span class="type-parameter">[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)</span>\></span></span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[navBarItems](../view_model_main_screen_view_model/MainScreenViewModel/navBarItems.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html)</span>\></span></span>  
Actual
[BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html)s
that show up on the screen.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[pages](../view_model_main_screen_view_model/MainScreenViewModel/pages.md)</span> <span class="signature">↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span>\></span></span>  
Contains the Widgets to be rendered for corresponding navbar items.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[scaffoldKey](../view_model_main_screen_view_model/MainScreenViewModel/scaffoldKey.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[ScaffoldState](https://api.flutter.dev/flutter/material/ScaffoldState-class.html)</span>\></span></span>  
static variables.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[showAppTour](../view_model_main_screen_view_model/MainScreenViewModel/showAppTour.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
bool to determine if we wanna show the apptour.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[targets](../view_model_main_screen_view_model/MainScreenViewModel/targets.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[FocusTarget](../models_app_tour/FocusTarget-class.md)</span>\></span></span>  
array of target.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[tourComplete](../view_model_main_screen_view_model/MainScreenViewModel/tourComplete.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
bool to determine if apptour is complete.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[tourSkipped](../view_model_main_screen_view_model/MainScreenViewModel/tourSkipped.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
bool to determine if apptour is skipped.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[appTourDialog](../view_model_main_screen_view_model/MainScreenViewModel/appTourDialog.md)</span><span class="signature">(<span id="appTourDialog-param-ctx" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">ctx</span></span>) <span class="returntype parameter">→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span> </span>  
Builds and returns an AppTourDialog.

<span class="name">[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[initialise](../view_model_main_screen_view_model/MainScreenViewModel/initialise.md)</span><span class="signature">(<span id="initialise-param-ctx" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">ctx</span>, ) <span class="returntype parameter">→ void</span> </span>  
Initalizing function.

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

<span class="name">[onTabTapped](../view_model_main_screen_view_model/MainScreenViewModel/onTabTapped.md)</span><span class="signature">(<span id="onTabTapped-param-index" class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.md)</span> <span class="parameter-name">index</span></span>) <span class="returntype parameter">→ void</span> </span>  
Handles click on
[BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html).

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

<span class="name">[setupNavigationItems](../view_model_main_screen_view_model/MainScreenViewModel/setupNavigationItems.md)</span><span class="signature">(<span id="setupNavigationItems-param-context" class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ void</span> </span>  
Dynamically adds `BottomNavigationBarItems` in `BottomNavigationBar`.

<span class="name">[showHome](../view_model_main_screen_view_model/MainScreenViewModel/showHome.md)</span><span class="signature">(<span id="showHome-param-clickedTarget" class="parameter"><span class="type-annotation">dynamic</span> <span class="parameter-name">clickedTarget</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function shows the Home screen.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[tourAddPost](../view_model_main_screen_view_model/MainScreenViewModel/tourAddPost.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function show the tutorial to add Post in the organization.

<span class="name">[tourChat](../view_model_main_screen_view_model/MainScreenViewModel/tourChat.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function show the tour of chats.

<span class="name">[tourEventTargets](../view_model_main_screen_view_model/MainScreenViewModel/tourEventTargets.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function show the tutorial for Events.

<span class="name">[tourHomeTargets](../view_model_main_screen_view_model/MainScreenViewModel/tourHomeTargets.md)</span><span class="signature">(\[<span id="tourHomeTargets-param-givenUserConfig" class="parameter"><span class="type-annotation">[UserConfig](../services_user_config/UserConfig-class.md)?</span> <span class="parameter-name">givenUserConfig</span></span>\]) <span class="returntype parameter">→ void</span> </span>  
Starts the tour and info to be displayed is mentioned in this functions.

<span class="name">[tourProfile](../view_model_main_screen_view_model/MainScreenViewModel/tourProfile.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function show the tutorial for the profile page.

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="static-properties" class="section summary offset-anchor">

## Static Properties

<span class="name">[demoMode](../view_model_main_screen_view_model/MainScreenViewModel/demoMode.md)</span> <span class="signature">↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
flag to represent if app is in demoMode.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [main_screen_view_model](../view_model_main_screen_view_model/)
3.  MainScreenViewModel class

##### main_screen_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

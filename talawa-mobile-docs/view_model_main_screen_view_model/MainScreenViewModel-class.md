


# MainScreenViewModel class









<p>MainScreenViewModel class provide methods to interact with the modal to serve data in user's action in Main Screen Views.</p>
<p>The functions in this class are
mainly in the context of Tutorials for different componenets of the App.</p>
<p>Functions include:</p>
<ul>
<li><code>showTutorial</code></li>
<li><code>showHome</code></li>
<li><code>tourEventTargets</code></li>
<li><code>tourAddPost</code></li>
<li><code>tourChat</code></li>
<li><code>tourProfile</code></li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- MainScreenViewModel








## Constructors

[MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel/MainScreenViewModel.md) ()

   


## Properties

##### [context](../view_model_main_screen_view_model/MainScreenViewModel/context.md) &#8596; [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)



context consist of parent info.  
_<span class="feature">read / write</span>_



##### [currentPageIndex](../view_model_main_screen_view_model/MainScreenViewModel/currentPageIndex.md) &#8596; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



var for current page in index.  
_<span class="feature">read / write</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [keyBNChat](../view_model_main_screen_view_model/MainScreenViewModel/keyBNChat.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keyBNEvents](../view_model_main_screen_view_model/MainScreenViewModel/keyBNEvents.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keyBNHome](../view_model_main_screen_view_model/MainScreenViewModel/keyBNHome.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keyBNPost](../view_model_main_screen_view_model/MainScreenViewModel/keyBNPost.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keyBNProfile](../view_model_main_screen_view_model/MainScreenViewModel/keyBNProfile.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySEAdd](../view_model_main_screen_view_model/MainScreenViewModel/keySEAdd.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySECard](../view_model_main_screen_view_model/MainScreenViewModel/keySECard.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySECategoryMenu](../view_model_main_screen_view_model/MainScreenViewModel/keySECategoryMenu.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySEDateFilter](../view_model_main_screen_view_model/MainScreenViewModel/keySEDateFilter.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySHMenuIcon](../view_model_main_screen_view_model/MainScreenViewModel/keySHMenuIcon.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySHOrgName](../view_model_main_screen_view_model/MainScreenViewModel/keySHOrgName.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySHPinnedPost](../view_model_main_screen_view_model/MainScreenViewModel/keySHPinnedPost.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySHPost](../view_model_main_screen_view_model/MainScreenViewModel/keySHPost.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySPAppSetting](../view_model_main_screen_view_model/MainScreenViewModel/keySPAppSetting.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySPDonateUs](../view_model_main_screen_view_model/MainScreenViewModel/keySPDonateUs.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySPEditProfile](../view_model_main_screen_view_model/MainScreenViewModel/keySPEditProfile.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySPHelp](../view_model_main_screen_view_model/MainScreenViewModel/keySPHelp.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySPInvite](../view_model_main_screen_view_model/MainScreenViewModel/keySPInvite.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySPLogout](../view_model_main_screen_view_model/MainScreenViewModel/keySPLogout.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keySPPalisadoes](../view_model_main_screen_view_model/MainScreenViewModel/keySPPalisadoes.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [navBarItems](../view_model_main_screen_view_model/MainScreenViewModel/navBarItems.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html)>



Actual <code>BottomNavigationBarItem</code>s that show up on the screen.  
_<span class="feature">read / write</span>_



##### [pages](../view_model_main_screen_view_model/MainScreenViewModel/pages.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)>



Contains the Widgets to be rendered for corresponding navbar items.  
_<span class="feature">read / write</span>_



##### [pluginList](../view_model_main_screen_view_model/MainScreenViewModel/pluginList.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)



list of all the pluginList.  
_<span class="feature">read / write</span>_



##### [pluginPrototypeData](../view_model_main_screen_view_model/MainScreenViewModel/pluginPrototypeData.md) &#8596; [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)



Maps the feature names with their proper Icon and Page.  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [showAppTour](../view_model_main_screen_view_model/MainScreenViewModel/showAppTour.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



bool to determine if we wanna show the apptour.  
_<span class="feature">read / write</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [targets](../view_model_main_screen_view_model/MainScreenViewModel/targets.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html)>



array of target.  
_<span class="feature">final</span>_



##### [tourComplete](../view_model_main_screen_view_model/MainScreenViewModel/tourComplete.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



bool to determine if apptour is complete.  
_<span class="feature">read / write</span>_



##### [tourSkipped](../view_model_main_screen_view_model/MainScreenViewModel/tourSkipped.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



bool to determine if apptour is skipped.  
_<span class="feature">read / write</span>_



##### [tutorialCoachMark](../view_model_main_screen_view_model/MainScreenViewModel/tutorialCoachMark.md) &#8596; [TutorialCoachMark](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TutorialCoachMark-class.html)



tutorialCoachMark consist of coach used to give tutorial.  
_<span class="feature">read / write</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [fetchAndAddPlugins](../view_model_main_screen_view_model/MainScreenViewModel/fetchAndAddPlugins.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) void



Dynamically adds <code>BottomNavigationBarItems</code> in <code>BottomNavigationBar</code>.  




##### [focusTarget](../view_model_main_screen_view_model/MainScreenViewModel/focusTarget.md)([GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>> key, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) keyName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isCircle = false, [ContentAlign](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/ContentAlign.html) align = ContentAlign.bottom, [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) crossAlign = CrossAxisAlignment.start, [Alignment](https://api.flutter.dev/flutter/painting/Alignment-class.html) skipAlignment = Alignment.topRight, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html)? next, [CrossAxisAlignment](https://api.flutter.dev/flutter/rendering/CrossAxisAlignment.html) nextCrossAlign = CrossAxisAlignment.end, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isEnd = false}) [TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html)



This returns a widget for a step in a tutorial.  




##### [initialise](../view_model_main_screen_view_model/MainScreenViewModel/initialise.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) ctx, {required [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) fromSignUp, required [int](https://api.flutter.dev/flutter/dart-core/int-class.html) mainScreenIndex}) void



Initalizing function.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [onTabTapped](../view_model_main_screen_view_model/MainScreenViewModel/onTabTapped.md)([int](https://api.flutter.dev/flutter/dart-core/int-class.html) index) void



Handles click on <a href="https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html">BottomNavigationBarItem</a>.  




##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [showHome](../view_model_main_screen_view_model/MainScreenViewModel/showHome.md)([TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html) clickedTarget) void



This function shows the Home screen.  




##### [showTutorial](../view_model_main_screen_view_model/MainScreenViewModel/showTutorial.md)({required dynamic onClickTarget([TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html)), required dynamic onFinish()}) void



This function show tutorial to user.  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_



##### [tourAddPost](../view_model_main_screen_view_model/MainScreenViewModel/tourAddPost.md)() void



This function show the tutorial to add Post in the organization.  




##### [tourChat](../view_model_main_screen_view_model/MainScreenViewModel/tourChat.md)() void



This function show the tour of chats.  




##### [tourEventTargets](../view_model_main_screen_view_model/MainScreenViewModel/tourEventTargets.md)() void



This function show the tutorial for Events.  




##### [tourHomeTargets](../view_model_main_screen_view_model/MainScreenViewModel/tourHomeTargets.md)() void



this functions starts the tour and info to be displayed is mentioned in this functions.  




##### [tourProfile](../view_model_main_screen_view_model/MainScreenViewModel/tourProfile.md)() void



This function show the tutorial for the profile page.  






## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_





## Static Properties

##### [keyDrawerCurOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerCurOrg.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keyDrawerJoinOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerJoinOrg.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keyDrawerLeaveCurrentOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerLeaveCurrentOrg.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [keyDrawerSwitchableOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerSwitchableOrg.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[State](https://api.flutter.dev/flutter/widgets/State-class.html)&lt;[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)>>



static variables.  
_<span class="feature">final</span>_



##### [scaffoldKey](../view_model_main_screen_view_model/MainScreenViewModel/scaffoldKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[ScaffoldState](https://api.flutter.dev/flutter/material/ScaffoldState-class.html)>



static variables.  
_<span class="feature">final</span>_














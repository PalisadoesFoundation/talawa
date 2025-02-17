::::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_main_screen_view_model/view_model_main_screen_view_model-library-sidebar.html" below-sidebar="view_model_main_screen_view_model/MainScreenViewModel-class-sidebar.html"}
<div>

# [MainScreenViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
MainScreenViewModel class provide methods to interact with the modal to
serve data in user\'s action in Main Screen Views.

The functions in this class are mainly in the context of Tutorials for
different componenets of the App.

Functions include:

-   `showTutorial`
-   `showHome`
-   `tourEventTargets`
-   `tourAddPost`
-   `tourChat`
-   `tourProfile`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   MainScreenViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel/MainScreenViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[appTour](../view_model_main_screen_view_model/MainScreenViewModel/appTour.html)]{.name} [↔ [AppTour](../models_app_tour/AppTour-class.html)]{.signature}
:   tutorialCoachMark consist of coach used to give tutorial.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[context](../view_model_main_screen_view_model/MainScreenViewModel/context.html)]{.name} [↔ [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.signature}
:   context consist of parent info.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[currentPageIndex](../view_model_main_screen_view_model/MainScreenViewModel/currentPageIndex.html)]{.name} [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   var for current page in index.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[keyBNChat](../view_model_main_screen_view_model/MainScreenViewModel/keyBNChat.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNDemoEvents](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoEvents.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNDemoHome](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoHome.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNDemoPost](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoPost.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNDemoProfile](../view_model_main_screen_view_model/MainScreenViewModel/keyBNDemoProfile.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNEvents](../view_model_main_screen_view_model/MainScreenViewModel/keyBNEvents.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNHome](../view_model_main_screen_view_model/MainScreenViewModel/keyBNHome.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNPost](../view_model_main_screen_view_model/MainScreenViewModel/keyBNPost.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyBNProfile](../view_model_main_screen_view_model/MainScreenViewModel/keyBNProfile.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySEAdd](../view_model_main_screen_view_model/MainScreenViewModel/keySEAdd.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySECard](../view_model_main_screen_view_model/MainScreenViewModel/keySECard.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySECategoryMenu](../view_model_main_screen_view_model/MainScreenViewModel/keySECategoryMenu.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySEDateFilter](../view_model_main_screen_view_model/MainScreenViewModel/keySEDateFilter.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySHMenuIcon](../view_model_main_screen_view_model/MainScreenViewModel/keySHMenuIcon.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySHOrgName](../view_model_main_screen_view_model/MainScreenViewModel/keySHOrgName.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySHPinnedPost](../view_model_main_screen_view_model/MainScreenViewModel/keySHPinnedPost.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySHPost](../view_model_main_screen_view_model/MainScreenViewModel/keySHPost.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySPAppSetting](../view_model_main_screen_view_model/MainScreenViewModel/keySPAppSetting.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySPDonateUs](../view_model_main_screen_view_model/MainScreenViewModel/keySPDonateUs.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySPEditProfile](../view_model_main_screen_view_model/MainScreenViewModel/keySPEditProfile.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySPHelp](../view_model_main_screen_view_model/MainScreenViewModel/keySPHelp.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySPInvite](../view_model_main_screen_view_model/MainScreenViewModel/keySPInvite.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySPLogout](../view_model_main_screen_view_model/MainScreenViewModel/keySPLogout.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keySPPalisadoes](../view_model_main_screen_view_model/MainScreenViewModel/keySPPalisadoes.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[navBarItems](../view_model_main_screen_view_model/MainScreenViewModel/navBarItems.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Actual
    [BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html)s
    that show up on the screen.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[pages](../view_model_main_screen_view_model/MainScreenViewModel/pages.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Contains the Widgets to be rendered for corresponding navbar items.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[pluginList](../view_model_main_screen_view_model/MainScreenViewModel/pluginList.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)]{.signature}
:   list of all the pluginList.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[pluginPrototypeData](../view_model_main_screen_view_model/MainScreenViewModel/pluginPrototypeData.html)]{.name} [↔ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)]{.signature}
:   Maps the feature names with their proper Icon and Page.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[showAppTour](../view_model_main_screen_view_model/MainScreenViewModel/showAppTour.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   bool to determine if we wanna show the apptour.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[targets](../view_model_main_screen_view_model/MainScreenViewModel/targets.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[FocusTarget](../models_app_tour/FocusTarget-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   array of target.
    ::: features
    [final]{.feature}
    :::

[[testMode](../view_model_main_screen_view_model/MainScreenViewModel/testMode.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   flag to represent if app is in testMode.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[tourComplete](../view_model_main_screen_view_model/MainScreenViewModel/tourComplete.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   bool to determine if apptour is complete.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[tourSkipped](../view_model_main_screen_view_model/MainScreenViewModel/tourSkipped.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   bool to determine if apptour is skipped.
    ::: features
    [getter/setter pair]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[appTourDialog](../view_model_main_screen_view_model/MainScreenViewModel/appTourDialog.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [ctx]{.parameter-name}]{#appTourDialog-param-ctx .parameter}) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype .parameter} ]{.signature}
:   Builds and returns an AppTourDialog.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[fetchAndAddPlugins](../view_model_main_screen_view_model/MainScreenViewModel/fetchAndAddPlugins.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [context]{.parameter-name}]{#fetchAndAddPlugins-param-context .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Dynamically adds `BottomNavigationBarItems` in
    `BottomNavigationBar`.

[[initialise](../view_model_main_screen_view_model/MainScreenViewModel/initialise.html)]{.name}[([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation} [ctx]{.parameter-name}, {]{#initialise-param-ctx .parameter}[required [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [fromSignUp]{.parameter-name}, ]{#initialise-param-fromSignUp .parameter}[required [[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [mainScreenIndex]{.parameter-name}, ]{#initialise-param-mainScreenIndex .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [demoMode]{.parameter-name} = [false]{.default-value}, ]{#initialise-param-demoMode .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [testMode]{.parameter-name} = [false]{.default-value}]{#initialise-param-testMode .parameter}}) [→ void]{.returntype .parameter} ]{.signature}
:   Initalizing function.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[onTabTapped](../view_model_main_screen_view_model/MainScreenViewModel/onTabTapped.html)]{.name}[([[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.type-annotation} [index]{.parameter-name}]{#onTabTapped-param-index .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Handles click on
    [BottomNavigationBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html).

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[showHome](../view_model_main_screen_view_model/MainScreenViewModel/showHome.html)]{.name}[([[[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)]{.type-annotation} [clickedTarget]{.parameter-name}]{#showHome-param-clickedTarget .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function shows the Home screen.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[tourAddPost](../view_model_main_screen_view_model/MainScreenViewModel/tourAddPost.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function show the tutorial to add Post in the organization.

[[tourChat](../view_model_main_screen_view_model/MainScreenViewModel/tourChat.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function show the tour of chats.

[[tourEventTargets](../view_model_main_screen_view_model/MainScreenViewModel/tourEventTargets.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function show the tutorial for Events.

[[tourHomeTargets](../view_model_main_screen_view_model/MainScreenViewModel/tourHomeTargets.html)]{.name}[(\[[[[UserConfig](../services_user_config/UserConfig-class.html)?]{.type-annotation} [givenUserConfig]{.parameter-name}]{#tourHomeTargets-param-givenUserConfig .parameter}\]) [→ void]{.returntype .parameter} ]{.signature}
:   Starts the tour and info to be displayed is mentioned in this
    functions.

[[tourProfile](../view_model_main_screen_view_model/MainScreenViewModel/tourProfile.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function show the tutorial for the profile page.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#static-properties .section .summary .offset-anchor}
## Static Properties

[[demoMode](../view_model_main_screen_view_model/MainScreenViewModel/demoMode.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   flag to represent if app is in demoMode.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[keyDrawerCurOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerCurOrg.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyDrawerJoinOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerJoinOrg.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyDrawerLeaveCurrentOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerLeaveCurrentOrg.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[keyDrawerSwitchableOrg](../view_model_main_screen_view_model/MainScreenViewModel/keyDrawerSwitchableOrg.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[State](https://api.flutter.dev/flutter/widgets/State-class.html)[\<[[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::

[[scaffoldKey](../view_model_main_screen_view_model/MainScreenViewModel/scaffoldKey.html)]{.name} [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[ScaffoldState](https://api.flutter.dev/flutter/material/ScaffoldState-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   static variables.
    ::: features
    [final]{.feature}
    :::
:::
:::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [main_screen_view_model](../view_model_main_screen_view_model/)
3.  MainScreenViewModel class

##### main_screen_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::

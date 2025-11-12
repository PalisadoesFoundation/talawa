



menu

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/select_contact_view_model.dart](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  SelectContactViewModel class


SelectContactViewModel


 dark_mode   light_mode 




<div>

# SelectContactViewModel class

</div>


SelectContactViewModel class have different functions to interact with
model.

Functions include:

-   `getCurrentOrgUsersList` : to get all users of current organization.
-   `createChatWithUser` : to create a new chat with selected user.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   SelectContactViewModel



## Constructors

[SelectContactViewModel](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel/SelectContactViewModel.md)

:   



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[orgMembersList](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel/orgMembersList.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.md)]\>]]
:   orgMembersList is used to store all users of current organization.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[userConfig](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel/userConfig.md)] [→ [UserConfig](../services_user_config/UserConfig-class.md)]
:   User configuration service for accessing current user and
    organization information.
    ::: features
    final
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[checkExistingChat](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel/checkExistingChat.md)][([[[User](../models_user_user_info/User-class.md)] selectedUser]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]\>]] ]
:   Helper method to check if a chat already exists with the given user.

[[createChatWithUser](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel/createChatWithUser.md)][([[[User](../models_user_user_info/User-class.md)] selectedUser]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]\>]] ]
:   Function to create a new chat with a selected user.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[getCurrentOrgUsersList](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel/getCurrentOrgUsersList.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   function to get all users of current organization.

[initialise](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel/initialise.md) [→ void ]
:   This function initializes the
    [SelectContactViewModel](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.md)
    class.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [select_contact_view_model](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/)
3.  SelectContactViewModel class

##### select_contact_view_model library









 talawa 1.0.0+1 


<div>

# BaseModel class

</div>



Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   BaseModel

Implementers

:   -   [AccessScreenViewModel](../view_model_access_request_view_model/AccessScreenViewModel-class.md)
    -   [AddPostViewModel](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.md)
    -   [AppConnectivity](../view_model_connectivity_view_model/AppConnectivity-class.md)
    -   [AppLanguage](../view_model_lang_view_model/AppLanguage-class.md)
    -   [AppSettingViewModel](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.md)
    -   [AppTheme](../view_model_theme_view_model/AppTheme-class.md)
    -   [CommentsViewModel](../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.md)
    -   [CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md)
    -   [CustomDrawerViewModel](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
    -   [DemoViewModel](../main/DemoViewModel-class.md)
    -   [DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)
    -   [EditAgendaItemViewModel](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.md)
    -   [EditEventViewModel](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class.md)
    -   [EditProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.md)
    -   [EventCalendarViewModel](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.md)
    -   [EventInfoViewModel](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.md)
    -   [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)
    -   [LikeButtonViewModel](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.md)
    -   [LoginViewModel](../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.md)
    -   [MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel-class.md)
    -   [ManageVolunteerGroupViewModel](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.md)
    -   [OrganizationFeedViewModel](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.md)
    -   [ProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.md)
    -   [ProgressDialogViewModel](../view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class.md)
    -   [SelectContactViewModel](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.md)
    -   [SelectOrganizationViewModel](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.md)
    -   [SetUrlViewModel](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.md)
    -   [SignupDetailsViewModel](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.md)
    -   [WaitingViewModel](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.md)



## Constructors

[BaseModel](../view_model_base_view_model/BaseModel/BaseModel.md)

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
    no setter
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

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

:   

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
2.  [base_view_model](../view_model_base_view_model/)
3.  BaseModel class

##### base_view_model library








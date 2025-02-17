
<div>

# BaseModel class

</div>



Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   BaseModel

Implementers

:   -   [AccessScreenViewModel](../view_model_access_request_view_model/AccessScreenViewModel-class.html)
    -   [AddPostViewModel](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class.html)
    -   [AppConnectivity](../view_model_connectivity_view_model/AppConnectivity-class.html)
    -   [AppLanguage](../view_model_lang_view_model/AppLanguage-class.html)
    -   [AppSettingViewModel](../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
    -   [AppTheme](../view_model_theme_view_model/AppTheme-class.html)
    -   [CommentsViewModel](../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
    -   [CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
    -   [CustomDrawerViewModel](../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
    -   [DemoViewModel](../main/DemoViewModel-class.html)
    -   [DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.html)
    -   [EditAgendaItemViewModel](../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
    -   [EditEventViewModel](../view_model_after_auth_view_models_event_view_models_edit_event_view_model/EditEventViewModel-class.html)
    -   [EditProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class.html)
    -   [EventCalendarViewModel](../view_model_after_auth_view_models_event_view_models_event_calendar_view_model/EventCalendarViewModel-class.html)
    -   [EventInfoViewModel](../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
    -   [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
    -   [LikeButtonViewModel](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
    -   [LoginViewModel](../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
    -   [MainScreenViewModel](../view_model_main_screen_view_model/MainScreenViewModel-class.html)
    -   [ManageVolunteerGroupViewModel](../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
    -   [OrganizationFeedViewModel](../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
    -   [ProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
    -   [ProgressDialogViewModel](../view_model_widgets_view_models_progress_dialog_view_model/ProgressDialogViewModel-class.html)
    -   [SelectContactViewModel](../view_model_after_auth_view_models_chat_view_models_select_contact_view_model/SelectContactViewModel-class.html)
    -   [SelectOrganizationViewModel](../view_model_pre_auth_view_models_select_organization_view_model/SelectOrganizationViewModel-class.html)
    -   [SetUrlViewModel](../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
    -   [SignupDetailsViewModel](../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
    -   [WaitingViewModel](../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)



## Constructors

[BaseModel](../view_model_base_view_model/BaseModel/BaseModel.html)

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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setter
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [base_view_model](../view_model_base_view_model/)
3.  BaseModel class

##### base_view_model library








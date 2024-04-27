


# CreateEventViewModel class









<p>CreateEventViewModel class have methods to interact with model in.</p>
<p>the context of creating the event in the organization.</p>
<p>Methods include:</p>
<ul>
<li><code>createEvent</code> : to create an event.</li>
<li><code>getImageFromGallery</code> : to select image for a post.</li>
<li><code>removeImage</code> : to remove the image.</li>
<li><code>getCurrentOrgUsersList</code> : to get all user list of current organization.</li>
<li><code>removeUserFromList</code> : to remove a user from list.</li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- CreateEventViewModel








## Constructors

[CreateEventViewModel](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/CreateEventViewModel.md) ()

   


## Properties

##### [descriptionFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/descriptionFocus.md) &#8596; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



DescriptionFocus FocusNode.  
_<span class="feature">read / write</span>_



##### [eventDescriptionTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventDescriptionTextController.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



Event Description Text Controller.  
_<span class="feature">read / write</span>_



##### [eventEndDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndDate.md) &#8596; [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)



Event End Date.  
_<span class="feature">read / write</span>_



##### [eventEndTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventEndTime.md) &#8596; [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)



Event End Time.  
_<span class="feature">read / write</span>_



##### [eventLocationTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventLocationTextController.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



Event Location Text Controller.  
_<span class="feature">read / write</span>_



##### [eventStartDate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartDate.md) &#8596; [DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)



Event Start Date.  
_<span class="feature">read / write</span>_



##### [eventStartTime](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventStartTime.md) &#8596; [TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)



Event Start Time.  
_<span class="feature">read / write</span>_



##### [eventTitleTextController](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/eventTitleTextController.md) &#8596; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



Event Title Text Controller.  
_<span class="feature">read / write</span>_



##### [formKey](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/formKey.md) &#8594; [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)&lt;[FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)>



Global FormKey.  
_<span class="feature">final</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [imageFile](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/imageFile.md) &#8594; [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?



Getter to return imageFile.  
_<span class="feature">read-only</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isPublicSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isPublicSwitch.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Public Event or Not.  
_<span class="feature">read / write</span>_



##### [isRegisterableSwitch](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/isRegisterableSwitch.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



If event is registerable after creation.  
_<span class="feature">read / write</span>_



##### [latitude](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/latitude.md) &#8596; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?



Latitude store.  
_<span class="feature">read / write</span>_



##### [locationFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/locationFocus.md) &#8596; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



LocationFocus FocusNode.  
_<span class="feature">read / write</span>_



##### [longitude](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/longitude.md) &#8596; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?



Longitude store.  
_<span class="feature">read / write</span>_



##### [memberCheckedMap](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/memberCheckedMap.md) &#8594; [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)>



Getter to return members map.  
_<span class="feature">read-only</span>_



##### [orgMembersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/orgMembersList.md) &#8596; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[User](../models_user_user_info/User-class.md)>



Organisation Members List.  
_<span class="feature">read / write</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [selectedMembers](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/selectedMembers.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[User](../models_user_user_info/User-class.md)>



Getter to return selected members.  
_<span class="feature">read-only</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [titleFocus](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/titleFocus.md) &#8596; [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)



TitleFocus FocusNode.  
_<span class="feature">read / write</span>_



##### [validate](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/validate.md) &#8596; [AutovalidateMode](https://api.flutter.dev/flutter/widgets/AutovalidateMode.html)



AutoValidateMode default to disabled.  
_<span class="feature">read / write</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [buildUserList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/buildUserList.md)() void



This function build the user list.  




##### [createEvent](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/createEvent.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to create the event for the organization.  




##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [getCurrentOrgUsersList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getCurrentOrgUsersList.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[User](../models_user_user_info/User-class.md)>>



This function fetch all the users in the current organization and return <code>List</code>.  




##### [getImageFromGallery](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/getImageFromGallery.md)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to get the image from gallery.  




##### [initialize](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/initialize.md)() void



Function To Initialize.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [removeImage](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeImage.md)() void



This function remove the selected image.  




##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [removeUserFromList](../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel/removeUserFromList.md)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId}) void



This function is used to remove a user from user's list.  




##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_
















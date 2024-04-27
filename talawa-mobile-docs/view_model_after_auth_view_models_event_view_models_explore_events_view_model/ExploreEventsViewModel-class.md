


# ExploreEventsViewModel class









<p>ExploreEventsViewModel class helps to interact with model to serve data to view for event explore section.</p>
<p>Methods include:</p>
<ul>
<li><code>fetchNewEvents</code> : to fetch new events in the organization.</li>
<li><code>refreshEvents</code> : to refersh the event.</li>
<li><code>checkIfExistsAndAddNewEvent</code> : to check if the event exists or not, if now add a new event.</li>
<li><code>deleteEvent</code> : to delete the event.</li>
<li><code>choseValueFromDropdown</code> : to return the relevant message in the dropdown after any action.</li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- ExploreEventsViewModel








## Constructors

[ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/ExploreEventsViewModel.md) ()

   


## Properties

##### [chosenValue](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/chosenValue.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read-only</span>_



##### [emptyListMessage](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/emptyListMessage.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read-only</span>_



##### [events](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/events.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Event](../models_events_event_model/Event-class.md)>



  
_<span class="feature">read-only</span>_



##### [eventService](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/eventService.md) &#8594; [EventService](../services_event_service/EventService-class.md)



  
_<span class="feature">read-only</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [checkIfExistsAndAddNewEvent](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/checkIfExistsAndAddNewEvent.md)([Event](../models_events_event_model/Event-class.md) newEvent) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function add a new event if the event not exist.  




##### [choseValueFromDropdown](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/choseValueFromDropdown.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function takes the choosen value from dropdown and
return the filter events, if empty list then return relevant message.  




##### [deleteEvent](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/deleteEvent.md)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function deletes the event.  




##### [dispose](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/dispose.md)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">override</span>_



##### [fetchNewEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/fetchNewEvents.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to fetch new events in the organization.
The function uses <code>getEvents</code> method from <code>EventService</code>.  




##### [initialise](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/initialise.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [refreshEvents](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel/refreshEvents.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to refresh the events in the organization.
The function uses <code>getEvents</code> method from <code>EventService</code>.  




##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_
















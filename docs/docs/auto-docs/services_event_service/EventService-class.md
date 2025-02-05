


# EventService class









<p>EventService class provides different services in the context of Event.</p>
<p>Services include:</p>
<ul>
<li><code>setOrgStreamSubscription</code> : to set organization stream subscription for user.</li>
<li><code>getEvents</code> : to get all events of the organization.</li>
<li><code>fetchRegistrantsByEvent</code> : to fetch all registrants of an event.</li>
<li><code>registerForAnEvent</code> : to register for an event.</li>
<li><code>deleteEvent</code> : to delete an event.</li>
<li><code>editEvent</code> : to edit the event.</li>
<li><code>dispose</code> : to cancel the stream subscription of an organization.</li>
</ul>




## Constructors

[EventService](../services_event_service/EventService/EventService.md) ()

   


## Properties

##### [eventStream](../services_event_service/EventService/eventStream.md) &#8594; [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)&lt;[Event](../models_events_event_model/Event-class.md)>



The event stream.  
_<span class="feature">read-only</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [deleteEvent](../services_event_service/EventService/deleteEvent.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to delete the event.  




##### [dispose](../services_event_service/EventService/dispose.md)() void



This function is used to cancel the stream subscription of an organization.  




##### [editEvent](../services_event_service/EventService/editEvent.md)({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId, required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to edit an event.  




##### [fetchRegistrantsByEvent](../services_event_service/EventService/fetchRegistrantsByEvent.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to fetch all registrants of an event.  




##### [getEvents](../services_event_service/EventService/getEvents.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to fetch all the events of an organization.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [registerForAnEvent](../services_event_service/EventService/registerForAnEvent.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function is used to register user for an event.  




##### [setOrgStreamSubscription](../services_event_service/EventService/setOrgStreamSubscription.md)() void



This function is used to set stream subscription for an organization.  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_
















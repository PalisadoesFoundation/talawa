<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [chat_subscription_service](../services_chat_subscription_service/services_chat_subscription_service-library.md)
3.  ChatSubscriptionService class

<div class="self-name">

ChatSubscriptionService

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_subscription_service/services_chat_subscription_service-library-sidebar.html"
below-sidebar="services_chat_subscription_service/ChatSubscriptionService-class-sidebar.html">

<div>

# <span class="kind-class">ChatSubscriptionService</span> class

</div>

<div class="section desc markdown">

Provides real-time subscription services for chat messages.

Services include:

- `subscribeToChatMessages` - subscribes to real-time messages
- `stopSubscription` - stops the current subscription

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ChatSubscriptionService](../services_chat_subscription_service/ChatSubscriptionService/ChatSubscriptionService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[chatMessagesStream](../services_chat_subscription_service/ChatSubscriptionService/chatMessagesStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>  
Getter for chat messages stream.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[dispose](../services_chat_subscription_service/ChatSubscriptionService/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Disposes the service and closes streams.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[stopSubscription](../services_chat_subscription_service/ChatSubscriptionService/stopSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Stops the current chat subscription.

<span class="name">[subscribeToChatMessages](../services_chat_subscription_service/ChatSubscriptionService/subscribeToChatMessages.md)</span><span class="signature">(<span id="subscribeToChatMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span> </span>  
Subscribes to real-time chat messages for a specific chat.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

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
2.  [chat_subscription_service](../services_chat_subscription_service/services_chat_subscription_service-library.md)
3.  ChatSubscriptionService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

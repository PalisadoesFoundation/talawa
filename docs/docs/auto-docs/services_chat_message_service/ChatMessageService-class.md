<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/chat_message_service.dart](../services_chat_message_service/)
3.  ChatMessageService class

<div class="self-name">

ChatMessageService

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_message_service/services_chat_message_service-library-sidebar.html"
below-sidebar="services_chat_message_service/ChatMessageService-class-sidebar.html">

<div>

# <span class="kind-class">ChatMessageService</span> class

</div>

<div class="section desc markdown">

Provides message services for the PostgreSQL-based chat system.

Services include:

- `getChatDetails` - gets chat details with messages
- `sendMessage` - sends a message to a chat
- `loadMoreMessages` - loads older messages with pagination
- `hasMoreMessages` - checks if more messages are available
- Real-time subscription services delegated to ChatSubscriptionService

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ChatMessageService.new](../services_chat_message_service/ChatMessageService/ChatMessageService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[beforeCursor](../services_chat_message_service/ChatMessageService/beforeCursor.md)</span> <span class="signature">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>\></span></span>  
`before` cursor for loading older messages.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[chatMessagesStream](../services_chat_message_service/ChatMessageService/chatMessagesStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>  
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

<span class="name">[messagePageSize](../services_chat_message_service/ChatMessageService/messagePageSize.md)</span> <span class="signature">↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
`last` parameter for limiting the number of messages fetched.

<div class="features">

<span class="feature">getter/setter pair</span>

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

<span class="name">[dispose](../services_chat_message_service/ChatMessageService/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Disposes the service and closes streams.

<span class="name">[getChatDetails](../services_chat_message_service/ChatMessageService/getChatDetails.md)</span><span class="signature">(<span id="getChatDetails-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span>, ) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)?</span>\></span></span> </span>  
Retrieves chat details with initial messages.

<span class="name">[hasMoreMessages](../services_chat_message_service/ChatMessageService/hasMoreMessages.md)</span><span class="signature">(<span id="hasMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Checks if there are more messages to load for a specific chat.

<span class="name">[loadMoreMessages](../services_chat_message_service/ChatMessageService/loadMoreMessages.md)</span><span class="signature">(<span id="loadMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>\></span></span> </span>  
Loads more messages (older messages) for a specific chat.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[sendMessage](../services_chat_message_service/ChatMessageService/sendMessage.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)?</span>\></span></span> </span>  
Sends a message to a chat.

<span class="name">[stopSubscription](../services_chat_message_service/ChatMessageService/stopSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Stops the current chat subscription.

<span class="name">[subscribeToChatMessages](../services_chat_message_service/ChatMessageService/subscribeToChatMessages.md)</span><span class="signature">(<span id="subscribeToChatMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span> </span>  
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
2.  [chat_message_service](../services_chat_message_service/)
3.  ChatMessageService class

##### chat_message_service library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

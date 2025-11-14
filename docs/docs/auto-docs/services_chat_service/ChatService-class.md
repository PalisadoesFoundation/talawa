<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [chat_service](../services_chat_service/services_chat_service-library.md)
3.  ChatService class

<div class="self-name">

ChatService

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_service/services_chat_service-library-sidebar.html"
below-sidebar="services_chat_service/ChatService-class-sidebar.html">

<div>

# <span class="kind-class">ChatService</span> class

</div>

<div class="section desc markdown">

Unified service that provides all chat-related functionality.

This service acts as a facade that delegates to specialized services:

- ChatCoreService: Core chat operations (CRUD)
- ChatMembershipService: Member management operations
- ChatMessageService: Message and subscription operations

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ChatService](../services_chat_service/ChatService/ChatService.md)</span><span class="signature">(<span id="-param-coreService" class="parameter"></span>)</span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[chatListStream](../services_chat_service/ChatService/chatListStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)</span>\></span></span>  
Stream for individual chat updates.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[chatMessagesStream](../services_chat_service/ChatService/chatMessagesStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>  
Stream for chat messages.

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

<span class="name">[addChatMember](../services_chat_service/ChatService/addChatMember.md)</span><span class="signature">(<span id="addChatMember-param-chatId" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Adds a member to an existing chat.

<span class="name">[createChat](../services_chat_service/ChatService/createChat.md)</span><span class="signature">(<span id="createChat-param-name" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)?</span>\></span></span> </span>  
Creates a new chat.

<span class="name">[createChatMembership](../services_chat_service/ChatService/createChatMembership.md)</span><span class="signature">(<span id="createChatMembership-param-chatId" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Creates a chat membership (adds a user to a chat).

<span class="name">[deleteChat](../services_chat_service/ChatService/deleteChat.md)</span><span class="signature">(<span id="deleteChat-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Deletes a chat.

<span class="name">[dispose](../services_chat_service/ChatService/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Disposes the service and closes streams.

<span class="name">[fetchChatMembers](../services_chat_service/ChatService/fetchChatMembers.md)</span><span class="signature">(<span id="fetchChatMembers-param-chatId" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span>?</span>\></span></span> </span>  
Fetches members of a specific chat with pagination support.

<span class="name">[getChatDetails](../services_chat_service/ChatService/getChatDetails.md)</span><span class="signature">(<span id="getChatDetails-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span>, </span><span id="getChatDetails-param-isInitialLoad" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)?</span>\></span></span> </span>  
Retrieves chat details with initial messages.

<span class="name">[getChatsByUser](../services_chat_service/ChatService/getChatsByUser.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)</span>\></span></span>\></span></span> </span>  
Retrieves all chats for the current user.

<span class="name">[hasMoreMessages](../services_chat_service/ChatService/hasMoreMessages.md)</span><span class="signature">(<span id="hasMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Checks if there are more messages to load for a specific chat.

<span class="name">[loadMoreMessages](../services_chat_service/ChatService/loadMoreMessages.md)</span><span class="signature">(<span id="loadMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>\></span></span> </span>  
Loads more messages (older messages) for a specific chat.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[removeChatMember](../services_chat_service/ChatService/removeChatMember.md)</span><span class="signature">(<span id="removeChatMember-param-chatId" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Removes a member from a chat.

<span class="name">[sendMessage](../services_chat_service/ChatService/sendMessage.md)</span><span class="signature">(<span id="sendMessage-param-chatId" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)?</span>\></span></span> </span>  
Sends a message to a chat.

<span class="name">[stopSubscription](../services_chat_service/ChatService/stopSubscription.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Stops the current chat subscription.

<span class="name">[subscribeToChatMessages](../services_chat_service/ChatService/subscribeToChatMessages.md)</span><span class="signature">(<span id="subscribeToChatMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span> </span>  
Subscribes to real-time chat messages for a specific chat.

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateChat](../services_chat_service/ChatService/updateChat.md)</span><span class="signature">(<span id="updateChat-param-chatId" class="parameter"></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Updates a chat's name and/or description.

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
2.  [chat_service](../services_chat_service/services_chat_service-library.md)
3.  ChatService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

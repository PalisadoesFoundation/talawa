<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [services/chat_core_service.dart](../services_chat_core_service/)
3.  ChatCoreService class

<div class="self-name">

ChatCoreService

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_core_service/services_chat_core_service-library-sidebar.html"
below-sidebar="services_chat_core_service/ChatCoreService-class-sidebar.html">

<div>

# <span class="kind-class">ChatCoreService</span> class

</div>

<div class="section desc markdown">

Provides core chat management services for the PostgreSQL-based chat
system.

Services include:

- `createChat` - creates a new chat
- `getChatsByUser` - gets all chats for a user
- `deleteChat` - deletes a chat
- `updateChat` - updates chat name/description

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ChatCoreService](../services_chat_core_service/ChatCoreService/ChatCoreService.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[chatListStream](../services_chat_core_service/ChatCoreService/chatListStream.md)</span> <span class="signature">→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)</span>\></span></span>  
Getter for chat list stream.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[navigationService](../services_chat_core_service/ChatCoreService/navigationService.md)</span> <span class="signature">→ [NavigationService](../services_navigation_service/NavigationService-class.md)</span>  
Navigation service instance.

<div class="features">

<span class="feature">final</span>

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

<span class="name">[createChat](../services_chat_core_service/ChatCoreService/createChat.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)?</span>\></span></span> </span>  
Creates a new chat.

<span class="name">[deleteChat](../services_chat_core_service/ChatCoreService/deleteChat.md)</span><span class="signature">(<span id="deleteChat-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Deletes a chat.

<span class="name">[dispose](../services_chat_core_service/ChatCoreService/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Disposes the service and closes streams.

<span class="name">[getChatsByUser](../services_chat_core_service/ChatCoreService/getChatsByUser.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)</span>\></span></span>\></span></span> </span>  
Retrieves all chats for the current user.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateChat](../services_chat_core_service/ChatCoreService/updateChat.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
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
2.  [chat_core_service](../services_chat_core_service/)
3.  ChatCoreService class

##### chat_core_service library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

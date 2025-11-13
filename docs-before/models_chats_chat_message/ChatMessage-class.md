<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [models/chats/chat_message.dart](../models_chats_chat_message/)
3.  ChatMessage class

<div class="self-name">

ChatMessage

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_chats_chat_message/models_chats_chat_message-library-sidebar.html"
below-sidebar="models_chats_chat_message/ChatMessage-class-sidebar.html">

<div>

# <span class="kind-class">ChatMessage</span> class

</div>

<div class="section desc markdown">

The `ChatMessage` class represents a message in the new PostgreSQL-based
chat system.

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ChatMessage.new](../models_chats_chat_message/ChatMessage/ChatMessage.md)</span><span class="signature"></span>  
Constructs a `ChatMessage` instance.

<span class="name">[ChatMessage.fromJson](../models_chats_chat_message/ChatMessage/ChatMessage.fromJson.md)</span><span class="signature">(<span id="fromJson-param-json" class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> <span class="parameter-name">json</span></span>)</span>  
Creates a `ChatMessage` instance from a JSON object.

<div class="constructor-modifier features">

factory

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[body](../models_chats_chat_message/ChatMessage/body.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The actual text content of the message.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[chatId](../models_chats_chat_message/ChatMessage/chatId.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The ID of the chat this message belongs to.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[createdAt](../models_chats_chat_message/ChatMessage/createdAt.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The timestamp when the message was created.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[creator](../models_chats_chat_message/ChatMessage/creator.md)</span> <span class="signature">↔ [ChatUser](../models_chats_chat_user/ChatUser-class.md)?</span>  
The user who created the message.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[id](../models_chats_chat_message/ChatMessage/id.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The unique identifier of the message.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[parentMessage](../models_chats_chat_message/ChatMessage/parentMessage.md)</span> <span class="signature">↔ [ChatMessage](../models_chats_chat_message/ChatMessage-class.md)?</span>  
The parent message if this is a reply.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[updatedAt](../models_chats_chat_message/ChatMessage/updatedAt.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
The timestamp when the message was last updated.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toJson](../models_chats_chat_message/ChatMessage/toJson.md)</span><span class="signature"> <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> </span>  
Converts the `ChatMessage` instance to a JSON object.

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
2.  [chat_message](../models_chats_chat_message/)
3.  ChatMessage class

##### chat_message library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

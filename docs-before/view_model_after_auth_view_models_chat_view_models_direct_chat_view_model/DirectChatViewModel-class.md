<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/direct_chat_view_model.dart](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  DirectChatViewModel class

<div class="self-name">

DirectChatViewModel

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class-sidebar.html">

<div>

# <span class="kind-class">DirectChatViewModel</span> class

</div>

<div class="section desc markdown">

This ViewModel class have different functions that are used interact
with model in the context of Direct Chat.

Functions include:

- `initialise` : Initialise the states.
- `getChatMessages` : to get all the messages of a chat.
- `sendMessageToDirectChat` : to send the message to chat.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- DirectChatViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[DirectChatViewModel.new](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/DirectChatViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[chatMessagesByUser](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatMessagesByUser.md)</span> <span class="signature">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>\></span></span>  
This is the getter for the chat messages by user.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[chats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chats.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)</span>\></span></span>  
This is the getter for the unique chat IDs.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[chatState](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatState.md)</span> <span class="signature">↔ [ChatState](../enums_enums/ChatState.md)</span>  
State of the chat.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[listKey](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/listKey.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[AnimatedListState](https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html)</span>\></span></span>  
This is the key for the AnimatedList widget.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[name](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/name.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Name of the chat.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[userConfig](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/userConfig.md)</span> <span class="signature">→ [UserConfig](../services_user_config/UserConfig-class.md)</span>  
User configuration service for accessing current user information.

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[chatName](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatName.md)</span><span class="signature">(<span id="chatName-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span> </span>  
Method to return chat name based on the chatId.

<span class="name">[dispose](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
will throw after the object is disposed).

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[getChatMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/getChatMessages.md)</span><span class="signature">(<span id="getChatMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function get all messages for a chat.

<span class="name">[hasMoreMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/hasMoreMessages.md)</span><span class="signature">(<span id="hasMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Check if there are more messages to load for a specific chat.

<span class="name">[initialise](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/initialise.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function is used to initialise the states.

<span class="name">[isLoadingMoreMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/isLoadingMoreMessages.md)</span><span class="signature">(<span id="isLoadingMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Getter for pagination loading state.

<span class="name">[loadMoreMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/loadMoreMessages.md)</span><span class="signature">(<span id="loadMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Load more messages (older messages) for a specific chat.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[refreshChats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/refreshChats.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function refresh the chats.

<span class="name">[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[sendMessageToDirectChat](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/sendMessageToDirectChat.md)</span><span class="signature">(<span id="sendMessageToDirectChat-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span>, </span><span id="sendMessageToDirectChat-param-messageContent" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">messageContent</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function send the message to Direct Chat.

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

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
2.  [direct_chat_view_model](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/)
3.  DirectChatViewModel class

##### direct_chat_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

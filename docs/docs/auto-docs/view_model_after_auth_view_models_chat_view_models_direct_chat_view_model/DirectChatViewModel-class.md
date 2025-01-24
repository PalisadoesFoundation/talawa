




DirectChatViewModel class - direct\_chat\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/chat\_view\_models/direct\_chat\_view\_model.dart](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. DirectChatViewModel class

DirectChatViewModel


dark\_mode

light\_mode




# DirectChatViewModel class


This ViewModel class have different functions that are used interact with model in the context of Direct Chat.

Functions include:

* `initialise` : Initialise the states.
* `getChatMessages` : to get all the messages of a chat.
* `sendMessageToDirectChat` : to send the message to chat.

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* DirectChatViewModel



## Constructors

[DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/DirectChatViewModel.html)()




## Properties

[chatMessagesByUser](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatMessagesByUser.html)
→ Map<String, List<[ChatMessage](../models_chats_chat_message/ChatMessage-class.html)>>

no setter

[chats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chats.html)
→ List<[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.html)>

no setter

[chatState](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatState.html)
↔ [ChatState](../enums_enums/ChatState.html)

getter/setter pair

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[listKey](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/listKey.html)
→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<[AnimatedListState](https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html)>

final

[name](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/name.html)
↔ String?

getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[chatName](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/chatName.html)(dynamic chatId)
→ void



[dispose](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
override

[getChatMessages](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/getChatMessages.html)(String chatId)
→ Future<void>


This function get all messages for a chat.

[initialise](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/initialise.html)()
→ Future<void>



[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[refreshChats](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/refreshChats.html)()
→ void


This function refresh the chats.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[sendMessageToDirectChat](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel/sendMessageToDirectChat.html)(String chatId, String messageContent)
→ Future<void>


This function send the message to Direct Chat.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [direct\_chat\_view\_model](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/view_model_after_auth_view_models_chat_view_models_direct_chat_view_model-library.html)
3. DirectChatViewModel class

##### direct\_chat\_view\_model library





talawa
1.0.0+1












ChatService class - chat\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/chat\_service.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. ChatService class

ChatService


dark\_mode

light\_mode




# ChatService class


Provides different services for direct chats of the user.

Services include:

* `sendMessageToDirectChat` - used to send messages.
* `getDirectChatsByUserId` - used to get all chats by the user.
* `getDirectChatMessagesByChatId` - gets all chats of a user with
  another user.

## Constructors

[ChatService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService/ChatService.html)()




## Properties

[chatListStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService/chatListStream.html)
→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)

Getter for chat list stream.
no setter

[chatMessagesStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService/chatMessagesStream.html)
→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)

Getter for chat messages stream.
no setter

[chatStream](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService/chatStream.html)
↔ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)

Stream for GraphQL query results.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[getDirectChatMessagesByChatId](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService/getDirectChatMessagesByChatId.html)(dynamic chatId)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function retrieves direct chat messages by chat ID.

[getDirectChatsByUserId](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService/getDirectChatsByUserId.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Retrieves direct chats by user ID.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[sendMessageToDirectChat](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService/sendMessageToDirectChat.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageContent)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Sends a message to a direct chat.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [chat\_service](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. ChatService class

##### chat\_service library





talawa
1.0.0+1







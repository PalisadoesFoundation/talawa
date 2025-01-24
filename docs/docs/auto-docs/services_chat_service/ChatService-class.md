




ChatService class - chat\_service library - Dart API







menu

1. [talawa](../index.html)
2. [services/chat\_service.dart](../services_chat_service/services_chat_service-library.html)
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

[ChatService](../services_chat_service/ChatService/ChatService.html)()




## Properties

[chatListStream](../services_chat_service/ChatService/chatListStream.html)
→ Stream<[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.html)>

Getter for chat list stream.
no setter

[chatMessagesStream](../services_chat_service/ChatService/chatMessagesStream.html)
→ Stream<[ChatMessage](../models_chats_chat_message/ChatMessage-class.html)>

Getter for chat messages stream.
no setter

[chatStream](../services_chat_service/ChatService/chatStream.html)
↔ Stream<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>

Stream for GraphQL query results.
getter/setter pair

[hashCode](../services_chat_service/ChatService/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[runtimeType](../services_chat_service/ChatService/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited



## Methods

[getDirectChatMessagesByChatId](../services_chat_service/ChatService/getDirectChatMessagesByChatId.html)(dynamic chatId)
→ Future<void>


This function retrieves direct chat messages by chat ID.

[getDirectChatsByUserId](../services_chat_service/ChatService/getDirectChatsByUserId.html)()
→ Future<void>


Retrieves direct chats by user ID.

[noSuchMethod](../services_chat_service/ChatService/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[sendMessageToDirectChat](../services_chat_service/ChatService/sendMessageToDirectChat.html)(String chatId, String messageContent)
→ Future<void>


Sends a message to a direct chat.

[toString](../services_chat_service/ChatService/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](../services_chat_service/ChatService/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [chat\_service](../services_chat_service/services_chat_service-library.html)
3. ChatService class

##### chat\_service library





talawa
1.0.0+1











menu

1.  [talawa](../index.md)
2.  [services/chat_service.dart](../services_chat_service/)
3.  ChatService class


ChatService


 dark_mode   light_mode 




<div>

# ChatService class

</div>


Unified service that provides all chat-related functionality.

This service acts as a facade that delegates to specialized services:

-   ChatCoreService: Core chat operations (CRUD)
-   ChatMembershipService: Member management operations
-   ChatMessageService: Message and subscription operations



## Constructors

[[ChatService](../services_chat_service/ChatService/ChatService.md)][]

:   



## Properties

[[chatListStream](../services_chat_service/ChatService/chatListStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)]\>]]
:   Stream for individual chat updates.
    ::: features
    no setter
    :::

[[chatMessagesStream](../services_chat_service/ChatService/chatMessagesStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]]
:   Stream for chat messages.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[addChatMember](../services_chat_service/ChatService/addChatMember.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Adds a member to an existing chat.

[[createChat](../services_chat_service/ChatService/createChat.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)?]\>]] ]
:   Creates a new chat.

[[createChatMembership](../services_chat_service/ChatService/createChatMembership.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Creates a chat membership (adds a user to a chat).

[[deleteChat](../services_chat_service/ChatService/deleteChat.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Deletes a chat.

[dispose](../services_chat_service/ChatService/dispose.md) [→ void ]
:   Disposes the service and closes streams.

[[fetchChatMembers](../services_chat_service/ChatService/fetchChatMembers.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?]\>]] ]
:   Fetches members of a specific chat with pagination support.

[[getChatDetails](../services_chat_service/ChatService/getChatDetails.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)?]\>]] ]
:   Retrieves chat details with initial messages.

[[getChatsByUser](../services_chat_service/ChatService/getChatsByUser.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)]\>]]\>]] ]
:   Retrieves all chats for the current user.

[[hasMoreMessages](../services_chat_service/ChatService/hasMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if there are more messages to load for a specific chat.

[[loadMoreMessages](../services_chat_service/ChatService/loadMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]]\>]] ]
:   Loads more messages (older messages) for a specific chat.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[removeChatMember](../services_chat_service/ChatService/removeChatMember.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Removes a member from a chat.

[[sendMessage](../services_chat_service/ChatService/sendMessage.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)?]\>]] ]
:   Sends a message to a chat.

[stopSubscription](../services_chat_service/ChatService/stopSubscription.md) [→ void ]
:   Stops the current chat subscription.

[[subscribeToChatMessages](../services_chat_service/ChatService/subscribeToChatMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]] ]
:   Subscribes to real-time chat messages for a specific chat.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateChat](../services_chat_service/ChatService/updateChat.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Updates a chat\'s name and/or description.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [chat_service](../services_chat_service/)
3.  ChatService class

##### chat_service library









 talawa 1.0.0+1 

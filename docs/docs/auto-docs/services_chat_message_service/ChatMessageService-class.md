



menu

1.  [talawa](../index.md)
2.  [services/chat_message_service.dart](../services_chat_message_service/)
3.  ChatMessageService class


ChatMessageService


 dark_mode   light_mode 




<div>

# ChatMessageService class

</div>


Provides message services for the PostgreSQL-based chat system.

Services include:

-   `getChatDetails` - gets chat details with messages
-   `sendMessage` - sends a message to a chat
-   `loadMoreMessages` - loads older messages with pagination
-   `hasMoreMessages` - checks if more messages are available
-   Real-time subscription services delegated to ChatSubscriptionService



## Constructors

[ChatMessageService](../services_chat_message_service/ChatMessageService/ChatMessageService.md)

:   



## Properties

[[beforeCursor](../services_chat_message_service/ChatMessageService/beforeCursor.md)] [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]\>]]
:   `before` cursor for loading older messages.
    ::: features
    final
    :::

[[chatMessagesStream](../services_chat_message_service/ChatMessageService/chatMessagesStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]]
:   Getter for chat messages stream.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[messagePageSize](../services_chat_message_service/ChatMessageService/messagePageSize.md)] [↔ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   `last` parameter for limiting the number of messages fetched.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[dispose](../services_chat_message_service/ChatMessageService/dispose.md) [→ void ]
:   Disposes the service and closes streams.

[[getChatDetails](../services_chat_message_service/ChatMessageService/getChatDetails.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId, ) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)?]\>]] ]
:   Retrieves chat details with initial messages.

[[hasMoreMessages](../services_chat_message_service/ChatMessageService/hasMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if there are more messages to load for a specific chat.

[[loadMoreMessages](../services_chat_message_service/ChatMessageService/loadMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]]\>]] ]
:   Loads more messages (older messages) for a specific chat.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[sendMessage](../services_chat_message_service/ChatMessageService/sendMessage.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)?]\>]] ]
:   Sends a message to a chat.

[stopSubscription](../services_chat_message_service/ChatMessageService/stopSubscription.md) [→ void ]
:   Stops the current chat subscription.

[[subscribeToChatMessages](../services_chat_message_service/ChatMessageService/subscribeToChatMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]] ]
:   Subscribes to real-time chat messages for a specific chat.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [chat_message_service](../services_chat_message_service/)
3.  ChatMessageService class

##### chat_message_service library









 talawa 1.0.0+1 

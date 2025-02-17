
<div>

# ChatService class

</div>


Provides different services for direct chats of the user.

Services include:

-   `sendMessageToDirectChat` - used to send messages.
-   `getDirectChatsByUserId` - used to get all chats by the user.
-   `getDirectChatMessagesByChatId` - gets all chats of a user with
    another user.



## Constructors

[ChatService](../services_chat_service/ChatService/ChatService.md)

:   



## Properties

[[chatListStream](../services_chat_service/ChatService/chatListStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)]\>]]
:   Getter for chat list stream.
    ::: features
    no setter
    :::

[[chatMessagesStream](../services_chat_service/ChatService/chatMessagesStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]]
:   Getter for chat messages stream.
    ::: features
    no setter
    :::

[[chatStream](../services_chat_service/ChatService/chatStream.md)] [↔ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
:   Stream for GraphQL query results.
    ::: features
    getter/setter pair
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

[[getDirectChatMessagesByChatId](../services_chat_service/ChatService/getDirectChatMessagesByChatId.md)]([[dynamic chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function retrieves direct chat messages by chat ID.

[[getDirectChatsByUserId](../services_chat_service/ChatService/getDirectChatsByUserId.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Retrieves direct chats by user ID.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[sendMessageToDirectChat](../services_chat_service/ChatService/sendMessageToDirectChat.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] messageContent]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Sends a message to a direct chat.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
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
2.  [chat_service](../services_chat_service/)
3.  ChatService class

##### chat_service library








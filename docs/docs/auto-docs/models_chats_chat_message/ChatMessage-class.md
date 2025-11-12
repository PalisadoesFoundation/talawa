



menu

1.  [talawa](../index.md)
2.  [models/chats/chat_message.dart](../models_chats_chat_message/)
3.  ChatMessage class


ChatMessage


 dark_mode   light_mode 




<div>

# ChatMessage class

</div>


The `ChatMessage` class represents a message in the new PostgreSQL-based
chat system.



## Constructors

[[ChatMessage](../models_chats_chat_message/ChatMessage/ChatMessage.md)][]
:   Constructs a `ChatMessage` instance.

[[ChatMessage.fromJson](../models_chats_chat_message/ChatMessage/ChatMessage.fromJson.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json])]
:   Creates a `ChatMessage` instance from a JSON object.
    ::: 
    factory
    :::



## Properties

[[body](../models_chats_chat_message/ChatMessage/body.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The actual text content of the message.
    ::: features
    getter/setter pair
    :::

[[chatId](../models_chats_chat_message/ChatMessage/chatId.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The ID of the chat this message belongs to.
    ::: features
    getter/setter pair
    :::

[[createdAt](../models_chats_chat_message/ChatMessage/createdAt.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The timestamp when the message was created.
    ::: features
    getter/setter pair
    :::

[[creator](../models_chats_chat_message/ChatMessage/creator.md)] [↔ [ChatUser](../models_chats_chat_user/ChatUser-class.md)?]
:   The user who created the message.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[id](../models_chats_chat_message/ChatMessage/id.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The unique identifier of the message.
    ::: features
    getter/setter pair
    :::

[[parentMessage](../models_chats_chat_message/ChatMessage/parentMessage.md)] [↔ [ChatMessage](../models_chats_chat_message/ChatMessage-class.md)?]
:   The parent message if this is a reply.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[updatedAt](../models_chats_chat_message/ChatMessage/updatedAt.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The timestamp when the message was last updated.
    ::: features
    getter/setter pair
    :::



## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toJson](../models_chats_chat_message/ChatMessage/toJson.md)][ [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Converts the `ChatMessage` instance to a JSON object.

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
2.  [chat_message](../models_chats_chat_message/)
3.  ChatMessage class

##### chat_message library









 talawa 1.0.0+1 

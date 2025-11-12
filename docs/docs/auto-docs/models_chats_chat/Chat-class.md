



menu

1.  [talawa](../index.md)
2.  [models/chats/chat.dart](../models_chats_chat/)
3.  Chat class


Chat


 dark_mode   light_mode 




<div>

# Chat class

</div>


The `Chat` class represents a chat in the new PostgreSQL-based chat
system.



## Constructors

[[Chat](../models_chats_chat/Chat/Chat.md)][]
:   Constructs a `Chat` instance.

[[Chat.fromJson](../models_chats_chat/Chat/Chat.fromJson.md)][([[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] json])]
:   Creates a `Chat` instance from a JSON object.
    ::: 
    factory
    :::



## Properties

[[createdAt](../models_chats_chat/Chat/createdAt.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The timestamp when the chat was created.
    ::: features
    getter/setter pair
    :::

[[creator](../models_chats_chat/Chat/creator.md)] [↔ [ChatUser](../models_chats_chat_user/ChatUser-class.md)?]
:   The user who created the chat.
    ::: features
    getter/setter pair
    :::

[[description](../models_chats_chat/Chat/description.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   A description of the chat.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[id](../models_chats_chat/Chat/id.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The unique identifier of the chat.
    ::: features
    getter/setter pair
    :::

[[members](../models_chats_chat/Chat/members.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatUser](../models_chats_chat_user/ChatUser-class.md)]\>]?]
:   A list of chat members.
    ::: features
    getter/setter pair
    :::

[[messages](../models_chats_chat/Chat/messages.md)] [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]?]
:   A list of messages in the chat.
    ::: features
    getter/setter pair
    :::

[[name](../models_chats_chat/Chat/name.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The name/title of the chat.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[updatedAt](../models_chats_chat/Chat/updatedAt.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   The timestamp when the chat was last updated.
    ::: features
    getter/setter pair
    :::



## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toJson](../models_chats_chat/Chat/toJson.md)][ [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Converts the `Chat` instance to a JSON object.

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
2.  [chat](../models_chats_chat/)
3.  Chat class

##### chat library









 talawa 1.0.0+1 

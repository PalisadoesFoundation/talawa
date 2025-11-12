



menu

1.  [talawa](../index.md)
2.  [services/chat_core_service.dart](../services_chat_core_service/)
3.  ChatCoreService class


ChatCoreService


 dark_mode   light_mode 




<div>

# ChatCoreService class

</div>


Provides core chat management services for the PostgreSQL-based chat
system.

Services include:

-   `createChat` - creates a new chat
-   `getChatsByUser` - gets all chats for a user
-   `deleteChat` - deletes a chat
-   `updateChat` - updates chat name/description



## Constructors

[ChatCoreService](../services_chat_core_service/ChatCoreService/ChatCoreService.md)

:   



## Properties

[[chatListStream](../services_chat_core_service/ChatCoreService/chatListStream.md)] [→ [Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)]\>]]
:   Getter for chat list stream.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[navigationService](../services_chat_core_service/ChatCoreService/navigationService.md)] [→ [NavigationService](../services_navigation_service/NavigationService-class.md)]
:   Navigation service instance.
    ::: features
    final
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[createChat](../services_chat_core_service/ChatCoreService/createChat.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)?]\>]] ]
:   Creates a new chat.

[[deleteChat](../services_chat_core_service/ChatCoreService/deleteChat.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Deletes a chat.

[dispose](../services_chat_core_service/ChatCoreService/dispose.md) [→ void ]
:   Disposes the service and closes streams.

[[getChatsByUser](../services_chat_core_service/ChatCoreService/getChatsByUser.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)]\>]]\>]] ]
:   Retrieves all chats for the current user.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateChat](../services_chat_core_service/ChatCoreService/updateChat.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Updates a chat\'s name and/or description.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [chat_core_service](../services_chat_core_service/)
3.  ChatCoreService class

##### chat_core_service library









 talawa 1.0.0+1 

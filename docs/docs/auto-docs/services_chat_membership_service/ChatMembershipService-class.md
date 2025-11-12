



menu

1.  [talawa](../index.md)
2.  [services/chat_membership_service.dart](../services_chat_membership_service/)
3.  ChatMembershipService class


ChatMembershipService


 dark_mode   light_mode 




<div>

# ChatMembershipService class

</div>


Provides chat membership management services for the PostgreSQL-based
chat system.

Services include:

-   `createChatMembership` - adds a user to a chat
-   `addChatMember` - alias for createChatMembership
-   `removeChatMember` - removes a user from a chat
-   `fetchChatMembers` - gets chat members with pagination



## Constructors

[ChatMembershipService](../services_chat_membership_service/ChatMembershipService/ChatMembershipService.md)

:   



## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[navigationService](../services_chat_membership_service/ChatMembershipService/navigationService.md)] [→ [NavigationService](../services_navigation_service/NavigationService-class.md)]
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

[[addChatMember](../services_chat_membership_service/ChatMembershipService/addChatMember.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Adds a member to an existing chat.

[[createChatMembership](../services_chat_membership_service/ChatMembershipService/createChatMembership.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Creates a chat membership (adds a user to a chat).

[[fetchChatMembers](../services_chat_membership_service/ChatMembershipService/fetchChatMembers.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]?]\>]] ]
:   Fetches members of a specific chat with pagination support.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[removeChatMember](../services_chat_membership_service/ChatMembershipService/removeChatMember.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Removes a member from a chat.

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
2.  [chat_membership_service](../services_chat_membership_service/)
3.  ChatMembershipService class

##### chat_membership_service library









 talawa 1.0.0+1 

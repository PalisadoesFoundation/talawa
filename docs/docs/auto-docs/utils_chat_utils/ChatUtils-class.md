



menu

1.  [talawa](../index.md)
2.  [utils/chat_utils.dart](../utils_chat_utils/)
3.  ChatUtils class


ChatUtils


 dark_mode   light_mode 




<div>

# ChatUtils class

</div>


Utility class for chat-related helper methods.

This class provides static methods for:

-   Chat type detection (group vs direct)
-   Group name formatting and extraction
-   Chat categorization logic



## Constructors

[ChatUtils](../utils_chat_utils/ChatUtils/ChatUtils.md)

:   



## Properties

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



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::



## Static Methods

[[categorizeChats](../utils_chat_utils/ChatUtils/categorizeChats.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Chat](../models_chats_chat/Chat-class.md)]\>]] chats]) [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)]\>]]\>]] ]
:   Categorizes chats into groups and direct chats.

[[extractGroupName](../utils_chat_utils/ChatUtils/extractGroupName.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatName]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Extracts the group name by removing the chatId suffix.

[[formatGroupName](../utils_chat_utils/ChatUtils/formatGroupName.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] userInput, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Formats a group name by appending the chatId suffix for uniqueness.

[[getDisplayName](../utils_chat_utils/ChatUtils/getDisplayName.md)][([[[Chat](../models_chats_chat/Chat-class.md)] chat, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] currentUserId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Gets the display name for a chat based on its type.

[[getMemberCount](../utils_chat_utils/ChatUtils/getMemberCount.md)][([[[Chat](../models_chats_chat/Chat-class.md)] chat]) [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)] ]
:   Gets the member count for display purposes.

[[isCurrentUserAdmin](../utils_chat_utils/ChatUtils/isCurrentUserAdmin.md)][([[[Chat](../models_chats_chat/Chat-class.md)] chat, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] currentUserId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if the current user is the admin (creator) of a group chat.

[[isDirectChat](../utils_chat_utils/ChatUtils/isDirectChat.md)][([[[Chat](../models_chats_chat/Chat-class.md)] chat]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Determines if a chat is a direct chat (exactly 2 members).

[[isGroupChat](../utils_chat_utils/ChatUtils/isGroupChat.md)][([[[Chat](../models_chats_chat/Chat-class.md)] chat]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Determines if a chat is a group chat (3 or more members).

[[validateAdminAction](../utils_chat_utils/ChatUtils/validateAdminAction.md)][ [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Checks if a user can perform admin actions on a chat.

[[validateGroupLeave](../utils_chat_utils/ChatUtils/validateGroupLeave.md)][ [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Validates if a user can leave a group chat.

[[validateGroupName](../utils_chat_utils/ChatUtils/validateGroupName.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] name]) [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Validates if a chat name is appropriate for a group.

[[validateMemberRemoval](../utils_chat_utils/ChatUtils/validateMemberRemoval.md)][ [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Validates if a member can be removed from a group chat.







1.  [talawa](../index.md)
2.  [chat_utils](../utils_chat_utils/)
3.  ChatUtils class

##### chat_utils library









 talawa 1.0.0+1 

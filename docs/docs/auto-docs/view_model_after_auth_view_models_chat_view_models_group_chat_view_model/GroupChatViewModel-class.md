



menu

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  GroupChatViewModel class


GroupChatViewModel


 dark_mode   light_mode 




<div>

# GroupChatViewModel class

</div>


This ViewModel class have different functions that are used interact
with model in the context of Group Chat.

Functions include:

-   `initialise` : Initialise the states.
-   `getChatMessages` : to get all the messages of a chat.
-   `sendMessageToGroupChat` : to send the message to group chat.
-   `refreshChats` : to refresh group chat list.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   GroupChatViewModel



## Constructors

[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/GroupChatViewModel.md)

:   



## Properties

[[chatMessagesByUser](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/chatMessagesByUser.md)] [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)]\>]]\>]]
:   This is the getter for the chat messages by user.
    ::: features
    no setter
    :::

[[chatState](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/chatState.md)] [↔ [ChatState](../enums_enums/ChatState.md)]
:   State of the chat.
    ::: features
    getter/setter pair
    :::

[[groupChats](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/groupChats.md)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)]\>]]
:   This is the getter for the group chats.
    ::: features
    no setter
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[listKey](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/listKey.md)] [→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)[\<[[AnimatedListState](https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html)]\>]]
:   This is the key for the AnimatedList widget.
    ::: features
    final
    :::

[[name](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/name.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Name of the chat.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[userConfig](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/userConfig.md)] [→ [UserConfig](../services_user_config/UserConfig-class.md)]
:   User configuration service for accessing current user information.
    ::: features
    final
    :::



## Methods

[[addGroupMember](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/addGroupMember.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Adds a member to the group chat (admin only).

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[createGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/createGroupChat.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[Chat](../models_chats_chat/Chat-class.md)?]\>]] ]
:   Creates a new group chat.

[[deleteGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/deleteGroupChat.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Deletes a group chat (admin only).

[dispose](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/dispose.md) [→ void ]
:   Function to dispose the model.
    ::: features
    override
    :::

[[fetchGroupMembers](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/fetchGroupMembers.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)?]\>]] ]
:   Fetches all members of a specific group chat with pagination
    support.

[[getAvailableMembers](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getAvailableMembers.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[User](../models_user_user_info/User-class.md)]\>]] ]
:   Gets available members for adding to a group chat.

[[getChatMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getChatMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function get all messages for a group chat.

[[getGroupDisplayName](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getGroupDisplayName.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Gets the display name for a group chat.

[[getMemberCount](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getMemberCount.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)] ]
:   Gets the member count for a specific group chat.

[[hasMoreMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/hasMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if there are more messages to load for a specific group chat.

[[initialise](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/initialise.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to initialise the states.

[[isCurrentUserAdmin](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/isCurrentUserAdmin.md)][([[[Chat](../models_chats_chat/Chat-class.md)] chat]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if the current user is an admin of the given group chat.

[[isCurrentUserAdminById](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/isCurrentUserAdminById.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Checks if the current user is admin of a specific group chat by ID.

[[isLoadingMoreMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/isLoadingMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   Getter for pagination loading state.

[[leaveGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/leaveGroupChat.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId, ][[[Chat](../models_chats_chat/Chat-class.md)] chat]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Leaves the group chat (removes current user from the group).

[[loadMoreMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/loadMoreMessages.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Loads more messages (older messages) for a specific group chat.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[refreshChats](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/refreshChats.md) [→ void ]
:   This function refresh the group chats.

[[removeGroupMember](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/removeGroupMember.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Removes a member from the group chat (admin only).

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[sendMessageToGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/sendMessageToGroupChat.md)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] chatId, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] messageText]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Send text message to a group chat.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateGroupDetails](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/updateGroupDetails.md)][ [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]] ]
:   Updates the group chat name and/or description (admin only).

[[validateMemberRemoval](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/validateMemberRemoval.md)][ [→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)], dynamic\>]] ]
:   Validates if a member can be removed from a group.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [group_chat_view_model](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  GroupChatViewModel class

##### group_chat_view_model library









 talawa 1.0.0+1 

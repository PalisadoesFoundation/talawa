



menu

1.  [talawa](../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_management_dialogs.dart](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/)
3.  GroupChatManagementDialogs class


GroupChatManagementDialogs


 dark_mode   light_mode 




<div>

# GroupChatManagementDialogs class

</div>


Utility class that provides management dialog functions for group chat
operations.

This class contains static methods for:

-   Add members dialog (admin only)
-   Manage members dialog (admin only)
-   Delete group dialog (admin only)
-   Leave group dialog (non-admin only)
-   Member addition logic



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



## Static Properties

[[navigationService](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/navigationService.md)] [→ [NavigationService](../services_navigation_service/NavigationService-class.md)]
:   Navigation service instance.
    ::: features
    final
    :::



## Static Methods

[[addSelectedMembers](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/addSelectedMembers.md)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[User](../models_user_user_info/User-class.md)]\>]] selectedMembers, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Adds selected members to the group chat.

[[showAddMembersDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showAddMembersDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) → void ]
:   Shows add members dialog (admin only).

[[showDeleteGroupDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showDeleteGroupDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) → void ]
:   Shows delete group confirmation dialog (admin only).

[[showLeaveGroupDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showLeaveGroupDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId, ][[[Chat](../models_chats_chat/Chat-class.md)] chat]) → void ]
:   Shows leave group confirmation dialog (non-admin only).

[[showManageMembersDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showManageMembersDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId, ][[[Chat](../models_chats_chat/Chat-class.md)] chat, ][[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] onMemberRemoved]) → void ]
:   Shows manage members dialog (admin only).







1.  [talawa](../index.md)
2.  [group_chat_management_dialogs](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/)
3.  GroupChatManagementDialogs class

##### group_chat_management_dialogs library









 talawa 1.0.0+1 

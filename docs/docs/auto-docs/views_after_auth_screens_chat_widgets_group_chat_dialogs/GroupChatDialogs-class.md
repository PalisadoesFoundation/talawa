



menu

1.  [talawa](../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_dialogs.dart](../views_after_auth_screens_chat_widgets_group_chat_dialogs/)
3.  GroupChatDialogs class


GroupChatDialogs


 dark_mode   light_mode 




<div>

# GroupChatDialogs class

</div>


Utility class that provides unified access to all group chat dialog
functions.

This class serves as a facade that delegates to specialized dialog
classes:

-   GroupChatInfoDialogs: For information and basic editing
-   GroupChatManagementDialogs: For complex management operations



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

[[showAddMembersDialog](../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs/showAddMembersDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) → void ]
:   Shows add members dialog (admin only).

[[showDeleteGroupDialog](../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs/showDeleteGroupDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) → void ]
:   Shows delete group confirmation dialog (admin only).

[[showEditGroupDialog](../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs/showEditGroupDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[Chat](../models_chats_chat/Chat-class.md)] chat, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId]) → void ]
:   Shows edit group dialog for admin users.

[[showGroupInfo](../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs/showGroupInfo.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[Chat](../models_chats_chat/Chat-class.md)] chat]) → void ]
:   Shows group information dialog.

[[showLeaveGroupDialog](../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs/showLeaveGroupDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId, ][[[Chat](../models_chats_chat/Chat-class.md)] chat]) → void ]
:   Shows leave group confirmation dialog (non-admin only).

[[showManageMembersDialog](../views_after_auth_screens_chat_widgets_group_chat_dialogs/GroupChatDialogs/showManageMembersDialog.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context, ][[[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)] model, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] chatId, ][[[Chat](../models_chats_chat/Chat-class.md)] chat, ][[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] onMemberRemoved]) → void ]
:   Shows manage members dialog (admin only).







1.  [talawa](../index.md)
2.  [group_chat_dialogs](../views_after_auth_screens_chat_widgets_group_chat_dialogs/)
3.  GroupChatDialogs class

##### group_chat_dialogs library









 talawa 1.0.0+1 

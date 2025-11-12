



menu

1.  [talawa](../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_app_bar.dart](../views_after_auth_screens_chat_widgets_group_chat_app_bar/)
3.  GroupChatAppBar class


GroupChatAppBar


 dark_mode   light_mode 




<div>

# GroupChatAppBar class

</div>


GroupChatAppBar is a specialized app bar for group chat screens.

This widget provides:

-   Group chat title and member count
-   Admin and non-admin specific actions
-   Navigation back functionality




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
    -   GroupChatAppBar

Implemented types

:   -   [PreferredSizeWidget](https://api.flutter.dev/flutter/widgets/PreferredSizeWidget-class.html)



## Constructors

[[GroupChatAppBar](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/GroupChatAppBar.md)][]
:   Creates a GroupChatAppBar widget.
    ::: 
    const
    :::



## Properties

[[chatId](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/chatId.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The ID of the group chat.
    ::: features
    final
    :::

[[currentChat](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/currentChat.md)] [→ [Chat](../models_chats_chat/Chat-class.md)?]
:   The current chat object.
    ::: features
    final
    :::

[[groupChatName](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/groupChatName.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The display name of the group chat.
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[isCurrentUserAdmin](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/isCurrentUserAdmin.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether the current user is an admin.
    ::: features
    final
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)] [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]
:   Controls how one widget replaces another widget in the tree.
    ::: features
    finalinherited
    :::

[[memberCount](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/memberCount.md)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The number of members in the group.
    ::: features
    final
    :::

[[model](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/model.md)] [→ [GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)]
:   The GroupChatViewModel instance.
    ::: features
    final
    :::

[[preferredSize](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/preferredSize.md)] [→ [Size](https://api.flutter.dev/flutter/dart-ui/Size-class.html)]
:   The size this widget would prefer if it were otherwise
    unconstrained.
    ::: features
    no setteroverride
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[build](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/build.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
:   Describes the part of the user interface represented by this widget.
    ::: features
    override
    :::

[[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)][ [→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)] ]
:   Creates a
    [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)
    to manage this widget\'s location in the tree.
    ::: features
    inherited
    :::

[[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)][ [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]\>]] ]
:   Returns a list of
    [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)
    objects describing this node\'s children.
    ::: features
    inherited
    :::

[[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)][([[[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.md)] properties]) → void ]
:   Add additional properties associated with the node.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)][ [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)] ]
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a string representation of this node and its descendants.
    ::: features
    inherited
    :::

[[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a one-line detailed description of the object.
    ::: features
    inherited
    :::

[[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)][ [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A short, textual description of this widget.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::



## Static Properties

[[navigationService](../views_after_auth_screens_chat_widgets_group_chat_app_bar/GroupChatAppBar/navigationService.md)] [→ [NavigationService](../services_navigation_service/NavigationService-class.md)]
:   Navigation service instance.
    ::: features
    final
    :::







1.  [talawa](../index.md)
2.  [group_chat_app_bar](../views_after_auth_screens_chat_widgets_group_chat_app_bar/)
3.  GroupChatAppBar class

##### group_chat_app_bar library









 talawa 1.0.0+1 

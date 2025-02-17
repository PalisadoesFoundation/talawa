
<div>

# ChatTile class

</div>


ChatTile return a widget for a tile in the list of Direct Chats in the
Chat List Screen.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
    -   ChatTile

Available extensions

:   -   [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)



## Constructors

[[ChatTile](../views_after_auth_screens_chat_direct_chats/ChatTile/ChatTile.md)][({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.md)?] key, ][required [[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)] chat, ][required [[DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)] model]})]

:   ::: 
    const
    :::



## Properties

[[chat](../views_after_auth_screens_chat_direct_chats/ChatTile/chat.md)] [→ [ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)]

:   ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)] [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]
:   Controls how one widget replaces another widget in the tree.
    ::: features
    finalinherited
    :::

[[model](../views_after_auth_screens_chat_direct_chats/ChatTile/model.md)] [→ [DirectChatViewModel](../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)]

:   ::: features
    final
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::



## Methods

[[animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions/animate.html)][({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.md)?] key, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Effect](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Effect-class.html)]\>]?] effects, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onInit, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onPlay, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onComplete, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] autoPlay, ][[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)?] delay, ][[[AnimationController](https://api.flutter.dev/flutter/animation/AnimationController-class.html)?] controller, ][[[Adapter](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Adapter-class.html)?] adapter, ][[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?] target, ][[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?] value]}) [→ [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)] ]

:   Available on
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html),
    provided by the
    [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)
    extension

    Wraps the target
    [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    in an
    [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)
    instance, and returns the instance for chaining calls. Ex.
    `myWidget.` is equivalent to `Animate(child: myWidget)`.

[[build](../views_after_auth_screens_chat_direct_chats/ChatTile/build.md)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
:   Describes the part of the user interface represented by this widget.
    ::: features
    override
    :::

[[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)][() [→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)] ]
:   Creates a
    [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)
    to manage this widget\'s location in the tree.
    ::: features
    inherited
    :::

[[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)][() [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)]\>]] ]
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

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?] name, ][[[DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)?] style]}) [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)] ]
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)][({[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.md)] minLevel = DiagnosticLevel.info]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] prefixLineOne = \'\', ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] prefixOtherLines, ][[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)] minLevel = DiagnosticLevel.debug, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] wrapWidth = 65]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a string representation of this node and its descendants.
    ::: features
    inherited
    :::

[[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)] joiner = \', \', ][[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)] minLevel = DiagnosticLevel.debug]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a one-line detailed description of the object.
    ::: features
    inherited
    :::

[[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
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







1.  [talawa](../index.md)
2.  [direct_chats](../views_after_auth_screens_chat_direct_chats/)
3.  ChatTile class

##### direct_chats library








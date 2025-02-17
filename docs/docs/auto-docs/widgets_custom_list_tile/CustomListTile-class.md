
<div>

# CustomListTile class

</div>


Returns a widget for rendering Customized tiles.

A Tile shows the org info, user info, options that on tap user & org
info.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
    -   CustomListTile

Available extensions

:   -   [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)



## Constructors

[[CustomListTile](../widgets_custom_list_tile/CustomListTile/CustomListTile.html)][({[required [[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)] key, ][required [[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] index, ][required [[TileType](../enums_enums/TileType.html)] type, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] showIcon = false, ][[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)?] orgInfo, ][[[User](../models_user_user_info/User-class.html)?] userInfo, ][[[Attendee](../models_events_event_model/Attendee-class.html)?] attendeeInfo, ][[[Options](../models_options_options/Options-class.html)?] option, ][dynamic onTapOrgInfo([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]])?, ][dynamic ?, ][dynamic ?, ][dynamic ?]})]

:   ::: 
    const
    :::



## Properties

[[attendeeInfo](../widgets_custom_list_tile/CustomListTile/attendeeInfo.html)] [→ [Attendee](../models_events_event_model/Attendee-class.html)?]
:   Object containing all the necessary info regarding the Attendee.
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[index](../widgets_custom_list_tile/CustomListTile/index.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   Index int of tiles.
    ::: features
    final
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)] [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]
:   Controls how one widget replaces another widget in the tree.
    ::: features
    finalinherited
    :::

[[onTapAttendeeInfo](../widgets_custom_list_tile/CustomListTile/onTapAttendeeInfo.html)] → dynamic Function[()?]
:   Function to handle the tap on attendee info.
    ::: features
    final
    :::

[[onTapOption](../widgets_custom_list_tile/CustomListTile/onTapOption.html)] → dynamic Function[()?]
:   Object containing all the necessary info regarding the onTapOption.
    ::: features
    final
    :::

[[onTapOrgInfo](../widgets_custom_list_tile/CustomListTile/onTapOrgInfo.html)] [→ dynamic Function[([[[OrgInfo](../models_organization_org_info/OrgInfo-class.html)]])]?]
:   Function to handle the tap on org info.
    ::: features
    final
    :::

[[onTapUserInfo](../widgets_custom_list_tile/CustomListTile/onTapUserInfo.html)] → dynamic Function[()?]
:   Function to handle the tap on user info.
    ::: features
    final
    :::

[[option](../widgets_custom_list_tile/CustomListTile/option.html)] [→ [Options](../models_options_options/Options-class.html)?]
:   Object containing all the necessary info regarding the options.
    ::: features
    final
    :::

[[orgInfo](../widgets_custom_list_tile/CustomListTile/orgInfo.html)] [→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?]
:   Object containing all the necessary info regarding the org.
    ::: features
    final
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[showIcon](../widgets_custom_list_tile/CustomListTile/showIcon.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Flag to determine whether thge Icons should be shown.
    ::: features
    final
    :::

[[type](../widgets_custom_list_tile/CustomListTile/type.html)] [→ [TileType](../enums_enums/TileType.html)]
:   Tiletype object to specify tle type.
    ::: features
    final
    :::

[[userInfo](../widgets_custom_list_tile/CustomListTile/userInfo.html)] [→ [User](../models_user_user_info/User-class.html)?]
:   Object containing all the necessary info regarding the user.
    ::: features
    final
    :::



## Methods

[[animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions/animate.html)][({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?] key, ][[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Effect](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Effect-class.html)]\>]?] effects, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onInit, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onPlay, ][[[AnimateCallback](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateCallback.html)?] onComplete, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?] autoPlay, ][[[Duration](https://api.flutter.dev/flutter/dart-core/Duration-class.html)?] delay, ][[[AnimationController](https://api.flutter.dev/flutter/animation/AnimationController-class.html)?] controller, ][[[Adapter](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Adapter-class.html)?] adapter, ][[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?] target, ][[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)?] value]}) [→ [Animate](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/Animate-class.html)] ]

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

[[build](../widgets_custom_list_tile/CustomListTile/build.html)][([[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)] context]) [→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)] ]
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

[[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)][([[[DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.html)] properties]) → void ]
:   Add additional properties associated with the node.
    ::: features
    inherited
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] name, ][[[DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)?] style]}) [→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)] ]
:   Returns a debug representation of the object that is used by
    debugging tools and by
    [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
    ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)][({[[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)] minLevel = DiagnosticLevel.info]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] prefixLineOne = \'\', ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] prefixOtherLines, ][[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)] minLevel = DiagnosticLevel.debug, ][[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)] wrapWidth = 65]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   Returns a string representation of this node and its descendants.
    ::: features
    inherited
    :::

[[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] joiner = \', \', ][[[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html)] minLevel = DiagnosticLevel.debug]}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
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

[[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [custom_list_tile](../widgets_custom_list_tile/)
3.  CustomListTile class

##### custom_list_tile library








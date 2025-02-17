
<div>

# CustomAlertDialogWithCheckbox class

</div>


This Class returns CustomAlertDialogWithCheckbox widget . Custom Alert
Dialog with check box is a popup.

that appeared in the screen showing Alert message along with the event
buttons. This extends stateful widget that means it cannot change its
state during the runtime of a application. This has a check box which
wil rewuire user input to change.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
    -   [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
    -   [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
    -   CustomAlertDialogWithCheckbox

Available extensions

:   -   [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)



## Constructors

[[CustomAlertDialogWithCheckbox](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/CustomAlertDialogWithCheckbox.md)][({[[[Key](https://api.flutter.dev/flutter/foundation/Key-class.md)?] key, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] successText = \'Confirm\', ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] dialogTitle = \'Confirmation\', ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] reverse = false, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] secondaryButtonText = \'Close\', ][dynamic ?, ]required [dynamic success([[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)?]]), ][required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] dialogSubTitle, ][required [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] checkboxLabel, ][[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] initialCheckboxValue = false]})]

:   ::: 
    const
    :::



## Properties

[[checkboxLabel](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/checkboxLabel.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Label for the checkbox.
    ::: features
    final
    :::

[[dialogSubTitle](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/dialogSubTitle.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Subtitle or message content of the dialog.
    ::: features
    final
    :::

[[dialogTitle](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/dialogTitle.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Title displayed in the dialog (default value is \'Confirmation\').
    ::: features
    final
    :::

[[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[initialCheckboxValue](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/initialCheckboxValue.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Initial value for the checkbox.
    ::: features
    final
    :::

[[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)] [→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]
:   Controls how one widget replaces another widget in the tree.
    ::: features
    finalinherited
    :::

[[reverse](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/reverse.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Indicates whether the order of action buttons should be reversed.
    ::: features
    final
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[secondaryButtonTap](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/secondaryButtonTap.md)] → dynamic Function[()?]
:   Function triggered upon tapping the secondary action button.
    ::: features
    final
    :::

[[secondaryButtonText](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/secondaryButtonText.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Text displayed on the secondary action button (default value is
    \'Close\').
    ::: features
    final
    :::

[[success](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/success.md)] [→ dynamic Function[([[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)?]])]]
:   Function triggered upon tapping the primary action button.
    ::: features
    final
    :::

[[successText](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/successText.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Text displayed on the primary action button.
    ::: features
    final
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

[[createElement](https://api.flutter.dev/flutter/widgets/StatefulWidget/createElement.html)][() [→ [StatefulElement](https://api.flutter.dev/flutter/widgets/StatefulElement-class.html)] ]
:   Creates a
    [StatefulElement](https://api.flutter.dev/flutter/widgets/StatefulElement-class.html)
    to manage this widget\'s location in the tree.
    ::: features
    inherited
    :::

[createState](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/createState.md) [→ \_CustomAlertDialogWithCheckboxState ]
:   Creates the mutable state for this widget at a given location in the
    tree.
    ::: features
    override
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
2.  [custom_alert_dialog_with_checkbox](../widgets_custom_alert_dialog_with_checkbox/)
3.  CustomAlertDialogWithCheckbox class

##### custom_alert_dialog_with_checkbox library








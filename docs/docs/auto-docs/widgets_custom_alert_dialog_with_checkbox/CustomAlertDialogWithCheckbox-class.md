




CustomAlertDialogWithCheckbox class - custom\_alert\_dialog\_with\_checkbox library - Dart API







menu

1. [talawa](../index.html)
2. [widgets/custom\_alert\_dialog\_with\_checkbox.dart](../widgets_custom_alert_dialog_with_checkbox/widgets_custom_alert_dialog_with_checkbox-library.html)
3. CustomAlertDialogWithCheckbox class

CustomAlertDialogWithCheckbox


dark\_mode

light\_mode




# CustomAlertDialogWithCheckbox class


This Class returns CustomAlertDialogWithCheckbox widget . Custom Alert Dialog with check box is a popup.

that appeared in the screen showing Alert message along with the event buttons.
This extends stateful widget that means it cannot change its state during the
runtime of a application.
This has a check box which wil rewuire user input to change.


Inheritance

* Object
* [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
* [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
* [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
* CustomAlertDialogWithCheckbox

Available extensions

* [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)



## Constructors

[CustomAlertDialogWithCheckbox](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/CustomAlertDialogWithCheckbox.html)({[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key, String successText = 'Confirm', String dialogTitle = 'Confirmation', bool reverse = false, String secondaryButtonText = 'Close', dynamic secondaryButtonTap()?, required dynamic success(bool?), required String dialogSubTitle, required String checkboxLabel, bool initialCheckboxValue = false})

const



## Properties

[checkboxLabel](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/checkboxLabel.html)
→ String

Label for the checkbox.
final

[dialogSubTitle](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/dialogSubTitle.html)
→ String

Subtitle or message content of the dialog.
final

[dialogTitle](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/dialogTitle.html)
→ String

Title displayed in the dialog (default value is 'Confirmation').
final

[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[initialCheckboxValue](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/initialCheckboxValue.html)
→ bool

Initial value for the checkbox.
final

[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)
→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?

Controls how one widget replaces another widget in the tree.
finalinherited

[reverse](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/reverse.html)
→ bool

Indicates whether the order of action buttons should be reversed.
final

[runtimeType](https://api.flutter.dev/flutter/foundation/Diagnosticable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[secondaryButtonTap](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/secondaryButtonTap.html)
→ dynamic Function()?

Function triggered upon tapping the secondary action button.
final

[secondaryButtonText](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/secondaryButtonText.html)
→ String

Text displayed on the secondary action button (default value is 'Close').
final

[success](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/success.html)
→ dynamic Function(bool?)

Function triggered upon tapping the primary action button.
final

[successText](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/successText.html)
→ String

Text displayed on the primary action button.
final



## Methods

[createElement](https://api.flutter.dev/flutter/widgets/StatefulWidget/createElement.html)()
→ [StatefulElement](https://api.flutter.dev/flutter/widgets/StatefulElement-class.html)


Creates a [StatefulElement](https://api.flutter.dev/flutter/widgets/StatefulElement-class.html) to manage this widget's location in the tree.
inherited

[createState](../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox/createState.html)()
→ \_CustomAlertDialogWithCheckboxState


Creates the mutable state for this widget at a given location in the tree.
override

[debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)()
→ List<[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)>


Returns a list of [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html) objects describing this node's
children.
inherited

[debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)([DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.html) properties)
→ void


Add additional properties associated with the node.
inherited

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Diagnosticable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)({String? name, [DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)? style})
→ [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)


Returns a debug representation of the object that is used by debugging
tools and by [DiagnosticsNode.toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html).
inherited

[toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)({[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.info})
→ String


A string representation of this object.
inherited

[toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)({String prefixLineOne = '', String? prefixOtherLines, [DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.debug})
→ String


Returns a string representation of this node and its descendants.
inherited

[toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)({String joiner = ', ', [DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.debug})
→ String


Returns a one-line detailed description of the object.
inherited

[toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)()
→ String


A short, textual description of this widget.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [custom\_alert\_dialog\_with\_checkbox](../widgets_custom_alert_dialog_with_checkbox/widgets_custom_alert_dialog_with_checkbox-library.html)
3. CustomAlertDialogWithCheckbox class

##### custom\_alert\_dialog\_with\_checkbox library





talawa
1.0.0+1







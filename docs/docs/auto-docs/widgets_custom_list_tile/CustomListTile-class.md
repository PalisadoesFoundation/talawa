




CustomListTile class - custom\_list\_tile library - Dart API







menu

1. [talawa](../index.html)
2. [widgets/custom\_list\_tile.dart](../widgets_custom_list_tile/widgets_custom_list_tile-library.html)
3. CustomListTile class

CustomListTile


dark\_mode

light\_mode




# CustomListTile class


Returns a widget for rendering Customized tiles.

A Tile shows the org info, user info, options that on tap user & org info.


Inheritance

* Object
* [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
* [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
* CustomListTile

Available extensions

* [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.0/flutter_animate/AnimateWidgetExtensions.html)



## Constructors

[CustomListTile](../widgets_custom_list_tile/CustomListTile/CustomListTile.html)({required [Key](https://api.flutter.dev/flutter/foundation/Key-class.html) key, required int index, required [TileType](../enums_enums/TileType.html) type, bool showIcon = false, [OrgInfo](../models_organization_org_info/OrgInfo-class.html)? orgInfo, [User](../models_user_user_info/User-class.html)? userInfo, [Attendee](../models_events_event_model/Attendee-class.html)? attendeeInfo, [Options](../models_options_options/Options-class.html)? option, dynamic onTapOrgInfo([OrgInfo](../models_organization_org_info/OrgInfo-class.html))?, dynamic onTapUserInfo()?, dynamic onTapAttendeeInfo()?, dynamic onTapOption()?})

const



## Properties

[attendeeInfo](../widgets_custom_list_tile/CustomListTile/attendeeInfo.html)
→ [Attendee](../models_events_event_model/Attendee-class.html)?

Object containing all the necessary info regarding the Attendee.
final

[hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[index](../widgets_custom_list_tile/CustomListTile/index.html)
→ int

Index int of tiles.
final

[key](https://api.flutter.dev/flutter/widgets/Widget/key.html)
→ [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?

Controls how one widget replaces another widget in the tree.
finalinherited

[onTapAttendeeInfo](../widgets_custom_list_tile/CustomListTile/onTapAttendeeInfo.html)
→ dynamic Function()?

Function to handle the tap on attendee info.
final

[onTapOption](../widgets_custom_list_tile/CustomListTile/onTapOption.html)
→ dynamic Function()?

Object containing all the necessary info regarding the onTapOption.
final

[onTapOrgInfo](../widgets_custom_list_tile/CustomListTile/onTapOrgInfo.html)
→ dynamic Function([OrgInfo](../models_organization_org_info/OrgInfo-class.html))?

Function to handle the tap on org info.
final

[onTapUserInfo](../widgets_custom_list_tile/CustomListTile/onTapUserInfo.html)
→ dynamic Function()?

Function to handle the tap on user info.
final

[option](../widgets_custom_list_tile/CustomListTile/option.html)
→ [Options](../models_options_options/Options-class.html)?

Object containing all the necessary info regarding the options.
final

[orgInfo](../widgets_custom_list_tile/CustomListTile/orgInfo.html)
→ [OrgInfo](../models_organization_org_info/OrgInfo-class.html)?

Object containing all the necessary info regarding the org.
final

[runtimeType](https://api.flutter.dev/flutter/foundation/Diagnosticable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[showIcon](../widgets_custom_list_tile/CustomListTile/showIcon.html)
→ bool

Flag to determine whether thge Icons should be shown.
final

[type](../widgets_custom_list_tile/CustomListTile/type.html)
→ [TileType](../enums_enums/TileType.html)

Tiletype object to specify tle type.
final

[userInfo](../widgets_custom_list_tile/CustomListTile/userInfo.html)
→ [User](../models_user_user_info/User-class.html)?

Object containing all the necessary info regarding the user.
final



## Methods

[build](../widgets_custom_list_tile/CustomListTile/build.html)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)
→ [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)


Describes the part of the user interface represented by this widget.
override

[createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)()
→ [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)


Creates a [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html) to manage this widget's location in the tree.
inherited

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
2. [custom\_list\_tile](../widgets_custom_list_tile/widgets_custom_list_tile-library.html)
3. CustomListTile class

##### custom\_list\_tile library





talawa
1.0.0+1







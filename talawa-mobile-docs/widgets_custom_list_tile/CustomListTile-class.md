


# CustomListTile class









<p>Returns a widget for rendering Customized tiles.
A Tile shows the org info, user info, options that on tap user &amp; org info.</p>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [DiagnosticableTree](https://api.flutter.dev/flutter/foundation/DiagnosticableTree-class.html)
- [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
- [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
- CustomListTile








## Constructors

[CustomListTile](../widgets_custom_list_tile/CustomListTile/CustomListTile.md) ({required [Key](https://api.flutter.dev/flutter/foundation/Key-class.html) key, required [int](https://api.flutter.dev/flutter/dart-core/int-class.html) index, required [TileType](../enums_enums/TileType.md) type, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) showIcon = false, [OrgInfo](../models_organization_org_info/OrgInfo-class.md)? orgInfo, dynamic onTapOrgInfo([OrgInfo](../models_organization_org_info/OrgInfo-class.md))?, [User](../models_user_user_info/User-class.md)? userInfo, dynamic onTapUserInfo()?, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html)? onTapOption, [Options](../models_options_options/Options-class.md)? option})

  _const_ 


## Properties

##### [hashCode](https://api.flutter.dev/flutter/widgets/Widget/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [index](../widgets_custom_list_tile/CustomListTile/index.md) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



  
_<span class="feature">final</span>_



##### [key](https://api.flutter.dev/flutter/widgets/Widget/key.html) &#8594; [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?



Controls how one widget replaces another widget in the tree.  
_<span class="feature">final</span><span class="feature">inherited</span>_



##### [onTapOption](../widgets_custom_list_tile/CustomListTile/onTapOption.md) &#8594; [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html)?



  
_<span class="feature">final</span>_



##### [onTapOrgInfo](../widgets_custom_list_tile/CustomListTile/onTapOrgInfo.md) &#8594; (dynamic Function([OrgInfo](../models_organization_org_info/OrgInfo-class.md))?)



  
_<span class="feature">final</span>_



##### [onTapUserInfo](../widgets_custom_list_tile/CustomListTile/onTapUserInfo.md) &#8594; (dynamic Function()?)



  
_<span class="feature">final</span>_



##### [option](../widgets_custom_list_tile/CustomListTile/option.md) &#8594; [Options](../models_options_options/Options-class.md)?



  
_<span class="feature">final</span>_



##### [orgInfo](../widgets_custom_list_tile/CustomListTile/orgInfo.md) &#8594; [OrgInfo](../models_organization_org_info/OrgInfo-class.md)?



  
_<span class="feature">final</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [showIcon](../widgets_custom_list_tile/CustomListTile/showIcon.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">final</span>_



##### [type](../widgets_custom_list_tile/CustomListTile/type.md) &#8594; [TileType](../enums_enums/TileType.md)



  
_<span class="feature">final</span>_



##### [userInfo](../widgets_custom_list_tile/CustomListTile/userInfo.md) &#8594; [User](../models_user_user_info/User-class.md)?



  
_<span class="feature">final</span>_





## Methods

##### [build](../widgets_custom_list_tile/CustomListTile/build.md)([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context) [Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)



Describes the part of the user interface represented by this widget.  
_<span class="feature">override</span>_



##### [createElement](https://api.flutter.dev/flutter/widgets/StatelessWidget/createElement.html)() [StatelessElement](https://api.flutter.dev/flutter/widgets/StatelessElement-class.html)



Creates a <a href="https://api.flutter.dev/flutter/widgets/StatelessElement-class.html">StatelessElement</a> to manage this widget's location in the tree.  
_<span class="feature">inherited</span>_



##### [debugDescribeChildren](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/debugDescribeChildren.html)() [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)>



Returns a list of <code>DiagnosticsNode</code> objects describing this node's
children.  
_<span class="feature">inherited</span>_



##### [debugFillProperties](https://api.flutter.dev/flutter/widgets/Widget/debugFillProperties.html)([DiagnosticPropertiesBuilder](https://api.flutter.dev/flutter/foundation/DiagnosticPropertiesBuilder-class.html) properties) void



Add additional properties associated with the node.  
_<span class="feature">inherited</span>_



##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [toDiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toDiagnosticsNode.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? name, [DiagnosticsTreeStyle](https://api.flutter.dev/flutter/foundation/DiagnosticsTreeStyle.html)? style}) [DiagnosticsNode](https://api.flutter.dev/flutter/foundation/DiagnosticsNode-class.html)



Returns a debug representation of the object that is used by debugging
tools and by <a href="https://api.flutter.dev/flutter/foundation/DiagnosticsNode/toStringDeep.html">DiagnosticsNode.toStringDeep</a>.  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/foundation/Diagnosticable/toString.html)({[DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.info}) [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_



##### [toStringDeep](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringDeep.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html) prefixLineOne = '', [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? prefixOtherLines, [DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.debug}) [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



Returns a string representation of this node and its descendants.  
_<span class="feature">inherited</span>_



##### [toStringShallow](https://api.flutter.dev/flutter/foundation/DiagnosticableTree/toStringShallow.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html) joiner = ', ', [DiagnosticLevel](https://api.flutter.dev/flutter/foundation/DiagnosticLevel.html) minLevel = DiagnosticLevel.debug}) [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



Returns a one-line detailed description of the object.  
_<span class="feature">inherited</span>_



##### [toStringShort](https://api.flutter.dev/flutter/widgets/Widget/toStringShort.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A short, textual description of this widget.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/widgets/Widget/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_
















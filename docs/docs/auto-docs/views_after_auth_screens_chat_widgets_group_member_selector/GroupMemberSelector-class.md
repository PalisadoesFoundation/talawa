<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [views/after_auth_screens/chat/widgets/group_member_selector.dart](../views_after_auth_screens_chat_widgets_group_member_selector/views_after_auth_screens_chat_widgets_group_member_selector-library.md)
3.  GroupMemberSelector class

<div class="self-name">

GroupMemberSelector

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_widgets_group_member_selector/views_after_auth_screens_chat_widgets_group_member_selector-library-sidebar.html"
below-sidebar="views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector-class-sidebar.html">

<div>

# <span class="kind-class">GroupMemberSelector</span> class

</div>

<div class="section desc markdown">

GroupMemberSelector is a widget for selecting organization members for
group chat creation.

This widget handles:

- Loading organization members
- Displaying members with checkboxes
- Managing member selection state
- Validating selection limits

</div>

<div class="section">

Available Extensions  
- [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.2/flutter_animate/AnimateWidgetExtensions.html)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[GroupMemberSelector](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/GroupMemberSelector.md)</span><span class="signature"></span>  
Creates a GroupMemberSelector widget.

<div class="constructor-modifier features">

const

</div>

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[hashCode](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/hashCode.md)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[key](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/key.md)</span> <span class="signature">→ Key?</span>  
Controls how one widget replaces another widget in the tree.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[onMembersChanged](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/onMembersChanged.md)</span> <span class="signature">→ dynamic Function<span class="signature">(<span id="param-" class="parameter"><span class="type-annotation">[Set](https://api.flutter.dev/flutter/dart-core/Set-class.md)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span></span>)</span></span>  
Callback function called when selected members change.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[selectedMembers](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/selectedMembers.md)</span> <span class="signature">→ [Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span>  
Currently selected members.

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[createElement](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/createElement.md)</span><span class="signature"> <span class="returntype parameter">→ StatefulElement</span> </span>  
Creates a `StatefulElement` to manage this widget's location in the
tree.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[createState](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/createState.md)</span><span class="signature"> <span class="returntype parameter">→ State<span class="signature">\<<span class="type-parameter">[GroupMemberSelector](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector-class.md)</span>\></span></span> </span>  
Creates the mutable state for this widget at a given location in the
tree.

<span class="name">[debugDescribeChildren](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/debugDescribeChildren.md)</span><span class="signature"> <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">DiagnosticsNode</span>\></span></span> </span>  
Returns a list of `DiagnosticsNode` objects describing this node's
children.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[debugFillProperties](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/debugFillProperties.md)</span><span class="signature">(<span id="debugFillProperties-param-properties" class="parameter"><span class="type-annotation">DiagnosticPropertiesBuilder</span> <span class="parameter-name">properties</span></span>) <span class="returntype parameter">→ void</span> </span>  
Add additional properties associated with the node.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toDiagnosticsNode](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/toDiagnosticsNode.md)</span><span class="signature"> <span class="returntype parameter">→ DiagnosticsNode</span> </span>  
Returns a debug representation of the object that is used by debugging
tools and by `DiagnosticsNode.toStringDeep`.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/toString.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringDeep](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/toStringDeep.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Returns a string representation of this node and its descendants.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringShallow](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/toStringShallow.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Returns a one-line detailed description of the object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringShort](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/toStringShort.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A short, textual description of this widget.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](../views_after_auth_screens_chat_widgets_group_member_selector/GroupMemberSelector/operator_equals.md)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [group_member_selector](../views_after_auth_screens_chat_widgets_group_member_selector/views_after_auth_screens_chat_widgets_group_member_selector-library.md)
3.  GroupMemberSelector class

##### group_member_selector library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

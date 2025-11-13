<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [views/after_auth_screens/chat/group_chats.dart](../views_after_auth_screens_chat_group_chats/views_after_auth_screens_chat_group_chats-library.md)
3.  GroupChats class

<div class="self-name">

GroupChats

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_group_chats/views_after_auth_screens_chat_group_chats-library-sidebar.html"
below-sidebar="views_after_auth_screens_chat_group_chats/GroupChats-class-sidebar.html">

<div>

# <span class="kind-class">GroupChats</span> class

</div>

<div class="section desc markdown">

GroupChats returns a StatelessWidget for rendering all the group chats
of the current user in the Chat List Screen.

This widget displays either an empty state when no group chats are
available or a scrollable list of group chat tiles when group chats
exist. It includes pull-to-refresh functionality for updating the group
chat list.

Group chats are defined as chats with 3 or more members.

</div>

<div class="section">

Available Extensions  
- [AnimateWidgetExtensions](https://pub.dev/documentation/flutter_animate/4.5.2/flutter_animate/AnimateWidgetExtensions.html)

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[GroupChats](../views_after_auth_screens_chat_group_chats/GroupChats/GroupChats.md)</span><span class="signature"></span>  
Creates a GroupChats widget.

<div class="constructor-modifier features">

const

</div>

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](../views_after_auth_screens_chat_group_chats/GroupChats/hashCode.md)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[key](../views_after_auth_screens_chat_group_chats/GroupChats/key.md)</span> <span class="signature">→ Key?</span>  
Controls how one widget replaces another widget in the tree.

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[build](../views_after_auth_screens_chat_group_chats/GroupChats/build.md)</span><span class="signature">(<span id="build-param-context" class="parameter"><span class="type-annotation">BuildContext</span> <span class="parameter-name">context</span></span>) <span class="returntype parameter">→ Widget</span> </span>  
Describes the part of the user interface represented by this widget.

<span class="name">[createElement](../views_after_auth_screens_chat_group_chats/GroupChats/createElement.md)</span><span class="signature"> <span class="returntype parameter">→ StatelessElement</span> </span>  
Creates a `StatelessElement` to manage this widget's location in the
tree.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[debugDescribeChildren](../views_after_auth_screens_chat_group_chats/GroupChats/debugDescribeChildren.md)</span><span class="signature"> <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">DiagnosticsNode</span>\></span></span> </span>  
Returns a list of `DiagnosticsNode` objects describing this node's
children.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[debugFillProperties](../views_after_auth_screens_chat_group_chats/GroupChats/debugFillProperties.md)</span><span class="signature">(<span id="debugFillProperties-param-properties" class="parameter"><span class="type-annotation">DiagnosticPropertiesBuilder</span> <span class="parameter-name">properties</span></span>) <span class="returntype parameter">→ void</span> </span>  
Add additional properties associated with the node.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[onRefresh](../views_after_auth_screens_chat_group_chats/GroupChats/onRefresh.md)</span><span class="signature">(<span id="onRefresh-param-model" class="parameter"><span class="type-annotation">[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span> <span class="parameter-name">model</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Handles the refresh action for the group chat list.

<span class="name">[toDiagnosticsNode](../views_after_auth_screens_chat_group_chats/GroupChats/toDiagnosticsNode.md)</span><span class="signature"> <span class="returntype parameter">→ DiagnosticsNode</span> </span>  
Returns a debug representation of the object that is used by debugging
tools and by `DiagnosticsNode.toStringDeep`.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](../views_after_auth_screens_chat_group_chats/GroupChats/toString.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringDeep](../views_after_auth_screens_chat_group_chats/GroupChats/toStringDeep.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Returns a string representation of this node and its descendants.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringShallow](../views_after_auth_screens_chat_group_chats/GroupChats/toStringShallow.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Returns a one-line detailed description of the object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toStringShort](../views_after_auth_screens_chat_group_chats/GroupChats/toStringShort.md)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A short, textual description of this widget.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](../views_after_auth_screens_chat_group_chats/GroupChats/operator_equals.md)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
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
2.  [group_chats](../views_after_auth_screens_chat_group_chats/views_after_auth_screens_chat_group_chats-library.md)
3.  GroupChats class

##### group_chats library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

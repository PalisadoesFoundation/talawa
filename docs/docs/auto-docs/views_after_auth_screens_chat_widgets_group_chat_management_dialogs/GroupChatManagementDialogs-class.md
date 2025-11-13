<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_management_dialogs.dart](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/views_after_auth_screens_chat_widgets_group_chat_management_dialogs-library.md)
3.  GroupChatManagementDialogs class

<div class="self-name">

GroupChatManagementDialogs

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_widgets_group_chat_management_dialogs/views_after_auth_screens_chat_widgets_group_chat_management_dialogs-library-sidebar.html"
below-sidebar="views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class-sidebar.html">

<div>

# <span class="kind-class">GroupChatManagementDialogs</span> class

</div>

<div class="section desc markdown">

Utility class that provides management dialog functions for group chat
operations.

This class contains static methods for:

- Add members dialog (admin only)
- Manage members dialog (admin only)
- Delete group dialog (admin only)
- Leave group dialog (non-admin only)
- Member addition logic

</div>

<div id="instance-properties"
class="section summary offset-anchor inherited">

## Properties

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

</div>

<div id="instance-methods"
class="section summary offset-anchor inherited">

## Methods

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
The equality operator.

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div id="static-properties" class="section summary offset-anchor">

## Static Properties

<span class="name">[navigationService](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/navigationService.md)</span> <span class="signature">→ [NavigationService](../services_navigation_service/NavigationService-class.md)</span>  
Navigation service instance.

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div id="static-methods" class="section summary offset-anchor">

## Static Methods

<span class="name">[addSelectedMembers](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/addSelectedMembers.md)</span><span class="signature">(<span id="addSelectedMembers-param-selectedMembers" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span> <span class="parameter-name">selectedMembers</span>, </span><span id="addSelectedMembers-param-model" class="parameter"><span class="type-annotation">[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span> <span class="parameter-name">model</span>, </span><span id="addSelectedMembers-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Adds selected members to the group chat.

<span class="name">[showAddMembersDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showAddMembersDialog.md)</span><span class="signature">(<span id="showAddMembersDialog-param-context" class="parameter"><span class="type-annotation">BuildContext</span> <span class="parameter-name">context</span>, </span><span id="showAddMembersDialog-param-model" class="parameter"><span class="type-annotation">[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span> <span class="parameter-name">model</span>, </span><span id="showAddMembersDialog-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ void</span> </span>  
Shows add members dialog (admin only).

<span class="name">[showDeleteGroupDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showDeleteGroupDialog.md)</span><span class="signature">(<span id="showDeleteGroupDialog-param-context" class="parameter"><span class="type-annotation">BuildContext</span> <span class="parameter-name">context</span>, </span><span id="showDeleteGroupDialog-param-model" class="parameter"><span class="type-annotation">[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span> <span class="parameter-name">model</span>, </span><span id="showDeleteGroupDialog-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ void</span> </span>  
Shows delete group confirmation dialog (admin only).

<span class="name">[showLeaveGroupDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showLeaveGroupDialog.md)</span><span class="signature">(<span id="showLeaveGroupDialog-param-context" class="parameter"><span class="type-annotation">BuildContext</span> <span class="parameter-name">context</span>, </span><span id="showLeaveGroupDialog-param-model" class="parameter"><span class="type-annotation">[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span> <span class="parameter-name">model</span>, </span><span id="showLeaveGroupDialog-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">chatId</span>, </span><span id="showLeaveGroupDialog-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span></span>) <span class="returntype parameter">→ void</span> </span>  
Shows leave group confirmation dialog (non-admin only).

<span class="name">[showManageMembersDialog](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs/showManageMembersDialog.md)</span><span class="signature">(<span id="showManageMembersDialog-param-context" class="parameter"><span class="type-annotation">BuildContext</span> <span class="parameter-name">context</span>, </span><span id="showManageMembersDialog-param-model" class="parameter"><span class="type-annotation">[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span> <span class="parameter-name">model</span>, </span><span id="showManageMembersDialog-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">chatId</span>, </span><span id="showManageMembersDialog-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span>, </span><span id="showManageMembersDialog-param-onMemberRemoved" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)</span> <span class="parameter-name">onMemberRemoved</span></span>) <span class="returntype parameter">→ void</span> </span>  
Shows manage members dialog (admin only).

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [group_chat_management_dialogs](../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/views_after_auth_screens_chat_widgets_group_chat_management_dialogs-library.md)
3.  GroupChatManagementDialogs class

##### group_chat_management_dialogs library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

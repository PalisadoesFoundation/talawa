<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  GroupChatViewModel class

<div class="self-name">

GroupChatViewModel

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_chat_view_models_group_chat_view_model/view_model_after_auth_view_models_chat_view_models_group_chat_view_model-library-sidebar.html"
below-sidebar="view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class-sidebar.html">

<div>

# <span class="kind-class">GroupChatViewModel</span> class

</div>

<div class="section desc markdown">

This ViewModel class have different functions that are used interact
with model in the context of Group Chat.

Functions include:

- `initialise` : Initialise the states.
- `getChatMessages` : to get all the messages of a chat.
- `sendMessageToGroupChat` : to send the message to group chat.
- `refreshChats` : to refresh group chat list.

</div>

<div class="section">

Inheritance  
- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- GroupChatViewModel

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[GroupChatViewModel](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/GroupChatViewModel.md)</span><span class="signature"></span>  

</div>

<div id="instance-properties" class="section summary offset-anchor">

## Properties

<span class="name">[chatMessagesByUser](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/chatMessagesByUser.md)</span> <span class="signature">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>\></span></span>  
This is the getter for the chat messages by user.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[chatState](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/chatState.md)</span> <span class="signature">↔ [ChatState](../enums_enums/ChatState.md)</span>  
State of the chat.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[groupChats](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/groupChats.md)</span> <span class="signature">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ChatListTileDataModel](../models_chats_chat_list_tile_data_model/ChatListTileDataModel-class.md)</span>\></span></span>  
This is the getter for the group chats.

<div class="features">

<span class="feature">no setter</span>

</div>

<span class="name">[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)</span> <span class="signature">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span>  
The hash code for this object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
Whether any listeners are currently registered.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)</span> <span class="signature">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[listKey](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/listKey.md)</span> <span class="signature">→ [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html)<span class="signature">\<<span class="type-parameter">[AnimatedListState](https://api.flutter.dev/flutter/widgets/AnimatedListState-class.html)</span>\></span></span>  
This is the key for the AnimatedList widget.

<div class="features">

<span class="feature">final</span>

</div>

<span class="name">[name](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/name.md)</span> <span class="signature">↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>  
Name of the chat.

<div class="features">

<span class="feature">getter/setter pair</span>

</div>

<span class="name">[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)</span> <span class="signature">→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>  
A representation of the runtime type of the object.

<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[state](../view_model_base_view_model/BaseModel/state.md)</span> <span class="signature">→ [ViewState](../enums_enums/ViewState.md)</span>  
<div class="features">

<span class="feature">no
setter</span><span class="feature">inherited</span>

</div>

<span class="name">[userConfig](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/userConfig.md)</span> <span class="signature">→ [UserConfig](../services_user_config/UserConfig-class.md)</span>  
User configuration service for accessing current user information.

<div class="features">

<span class="feature">final</span>

</div>

</div>

<div id="instance-methods" class="section summary offset-anchor">

## Methods

<span class="name">[addGroupMember](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/addGroupMember.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Adds a member to the group chat (admin only).

<span class="name">[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)</span><span class="signature">(<span id="addListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Register a closure to be called when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[createGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/createGroupChat.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)?</span>\></span></span> </span>  
Creates a new group chat.

<span class="name">[deleteGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/deleteGroupChat.md)</span><span class="signature">(<span id="deleteGroupChat-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Deletes a group chat (admin only).

<span class="name">[dispose](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/dispose.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Function to dispose the model.

<div class="features">

<span class="feature">override</span>

</div>

<span class="name">[fetchGroupMembers](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/fetchGroupMembers.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)?</span>\></span></span> </span>  
Fetches all members of a specific group chat with pagination support.

<span class="name">[getAvailableMembers](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getAvailableMembers.md)</span><span class="signature">(<span id="getAvailableMembers-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[User](../models_user_user_info/User-class.md)</span>\></span></span> </span>  
Gets available members for adding to a group chat.

<span class="name">[getChatMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getChatMessages.md)</span><span class="signature">(<span id="getChatMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function get all messages for a group chat.

<span class="name">[getGroupDisplayName](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getGroupDisplayName.md)</span><span class="signature">(<span id="getGroupDisplayName-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Gets the display name for a group chat.

<span class="name">[getMemberCount](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/getMemberCount.md)</span><span class="signature">(<span id="getMemberCount-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span> </span>  
Gets the member count for a specific group chat.

<span class="name">[hasMoreMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/hasMoreMessages.md)</span><span class="signature">(<span id="hasMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Checks if there are more messages to load for a specific group chat.

<span class="name">[initialise](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/initialise.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
This function is used to initialise the states.

<span class="name">[isCurrentUserAdmin](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/isCurrentUserAdmin.md)</span><span class="signature">(<span id="isCurrentUserAdmin-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Checks if the current user is an admin of the given group chat.

<span class="name">[isCurrentUserAdminById](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/isCurrentUserAdminById.md)</span><span class="signature">(<span id="isCurrentUserAdminById-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Checks if the current user is admin of a specific group chat by ID.

<span class="name">[isLoadingMoreMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/isLoadingMoreMessages.md)</span><span class="signature">(<span id="isLoadingMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Getter for pagination loading state.

<span class="name">[leaveGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/leaveGroupChat.md)</span><span class="signature">(<span id="leaveGroupChat-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span>, </span><span id="leaveGroupChat-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Leaves the group chat (removes current user from the group).

<span class="name">[loadMoreMessages](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/loadMoreMessages.md)</span><span class="signature">(<span id="loadMoreMessages-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Loads more messages (older messages) for a specific group chat.

<span class="name">[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)</span><span class="signature">(<span id="noSuchMethod-param-invocation" class="parameter"><span class="type-annotation">[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)</span> <span class="parameter-name">invocation</span></span>) <span class="returntype parameter">→ dynamic</span> </span>  
Invoked when a nonexistent method or property is accessed.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
Call all the registered listeners.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[refreshChats](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/refreshChats.md)</span><span class="signature"> <span class="returntype parameter">→ void</span> </span>  
This function refresh the group chats.

<span class="name">[removeGroupMember](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/removeGroupMember.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Removes a member from the group chat (admin only).

<span class="name">[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)</span><span class="signature">(<span id="removeListener-param-listener" class="parameter"><span class="type-annotation">[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)</span> <span class="parameter-name">listener</span></span>) <span class="returntype parameter">→ void</span> </span>  
Remove a previously registered closure from the list of closures that
are notified when the object changes.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[sendMessageToGroupChat](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/sendMessageToGroupChat.md)</span><span class="signature">(<span id="sendMessageToGroupChat-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatId</span>, </span><span id="sendMessageToGroupChat-param-messageText" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">messageText</span></span>) <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span> </span>  
Send text message to a group chat.

<span class="name">[setState](../view_model_base_view_model/BaseModel/setState.md)</span><span class="signature">(<span id="setState-param-viewState" class="parameter"><span class="type-annotation">[ViewState](../enums_enums/ViewState.md)</span> <span class="parameter-name">viewState</span></span>) <span class="returntype parameter">→ void</span> </span>  
<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)</span><span class="signature"> <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
A string representation of this object.

<div class="features">

<span class="feature">inherited</span>

</div>

<span class="name">[updateGroupDetails](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/updateGroupDetails.md)</span><span class="signature"> <span class="returntype parameter">→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span> </span>  
Updates the group chat name and/or description (admin only).

<span class="name">[validateMemberRemoval](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel/validateMemberRemoval.md)</span><span class="signature"> <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> </span>  
Validates if a member can be removed from a group.

</div>

<div id="operators" class="section summary offset-anchor inherited">

## Operators

<span class="name">[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)</span><span class="signature">(<span id="==-param-other" class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span> <span class="parameter-name">other</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
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
2.  [group_chat_view_model](../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  GroupChatViewModel class

##### group_chat_view_model library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [utils/chat_utils.dart](../utils_chat_utils/utils_chat_utils-library.md)
3.  ChatUtils class

<div class="self-name">

ChatUtils

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_utils/utils_chat_utils-library-sidebar.html"
below-sidebar="utils_chat_utils/ChatUtils-class-sidebar.html">

<div>

# <span class="kind-class">ChatUtils</span> class

</div>

<div class="section desc markdown">

Utility class for chat-related helper methods.

This class provides static methods for:

- Chat type detection (group vs direct)
- Group name formatting and extraction
- Chat categorization logic

</div>

<div id="constructors" class="section summary offset-anchor">

## Constructors

<span class="name">[ChatUtils](../utils_chat_utils/ChatUtils/ChatUtils.md)</span><span class="signature"></span>  

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

<div id="static-methods" class="section summary offset-anchor">

## Static Methods

<span class="name">[categorizeChats](../utils_chat_utils/ChatUtils/categorizeChats.md)</span><span class="signature">(<span id="categorizeChats-param-chats" class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)</span>\></span></span> <span class="parameter-name">chats</span></span>) <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../models_chats_chat/Chat-class.md)</span>\></span></span>\></span></span> </span>  
Categorizes chats into groups and direct chats.

<span class="name">[extractGroupName](../utils_chat_utils/ChatUtils/extractGroupName.md)</span><span class="signature">(<span id="extractGroupName-param-chatName" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">chatName</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Extracts the group name by removing the chatId suffix.

<span class="name">[formatGroupName](../utils_chat_utils/ChatUtils/formatGroupName.md)</span><span class="signature">(<span id="formatGroupName-param-userInput" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">userInput</span>, </span><span id="formatGroupName-param-chatId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">chatId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Formats a group name by appending the chatId suffix for uniqueness.

<span class="name">[getDisplayName](../utils_chat_utils/ChatUtils/getDisplayName.md)</span><span class="signature">(<span id="getDisplayName-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span>, </span><span id="getDisplayName-param-currentUserId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">currentUserId</span></span>) <span class="returntype parameter">→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> </span>  
Gets the display name for a chat based on its type.

<span class="name">[getMemberCount](../utils_chat_utils/ChatUtils/getMemberCount.md)</span><span class="signature">(<span id="getMemberCount-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span></span>) <span class="returntype parameter">→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)</span> </span>  
Gets the member count for display purposes.

<span class="name">[isCurrentUserAdmin](../utils_chat_utils/ChatUtils/isCurrentUserAdmin.md)</span><span class="signature">(<span id="isCurrentUserAdmin-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span>, </span><span id="isCurrentUserAdmin-param-currentUserId" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span> <span class="parameter-name">currentUserId</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Checks if the current user is the admin (creator) of a group chat.

<span class="name">[isDirectChat](../utils_chat_utils/ChatUtils/isDirectChat.md)</span><span class="signature">(<span id="isDirectChat-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Determines if a chat is a direct chat (exactly 2 members).

<span class="name">[isGroupChat](../utils_chat_utils/ChatUtils/isGroupChat.md)</span><span class="signature">(<span id="isGroupChat-param-chat" class="parameter"><span class="type-annotation">[Chat](../models_chats_chat/Chat-class.md)</span> <span class="parameter-name">chat</span></span>) <span class="returntype parameter">→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span> </span>  
Determines if a chat is a group chat (3 or more members).

<span class="name">[validateAdminAction](../utils_chat_utils/ChatUtils/validateAdminAction.md)</span><span class="signature"> <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> </span>  
Checks if a user can perform admin actions on a chat.

<span class="name">[validateGroupLeave](../utils_chat_utils/ChatUtils/validateGroupLeave.md)</span><span class="signature"> <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> </span>  
Validates if a user can leave a group chat.

<span class="name">[validateGroupName](../utils_chat_utils/ChatUtils/validateGroupName.md)</span><span class="signature">(<span id="validateGroupName-param-name" class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span> <span class="parameter-name">name</span></span>) <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> </span>  
Validates if a chat name is appropriate for a group.

<span class="name">[validateMemberRemoval](../utils_chat_utils/ChatUtils/validateMemberRemoval.md)</span><span class="signature"> <span class="returntype parameter">→ [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>, <span class="type-parameter">dynamic</span>\></span></span> </span>  
Validates if a member can be removed from a group chat.

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [chat_utils](../utils_chat_utils/utils_chat_utils-library.md)
3.  ChatUtils class

##### chat_utils library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

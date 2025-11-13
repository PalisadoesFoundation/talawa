<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  isCurrentUserAdmin static method

<div class="self-name">

isCurrentUserAdmin

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_utils/ChatUtils-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">isCurrentUserAdmin</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">isCurrentUserAdmin</span>(

1.  <span id="isCurrentUserAdmin-param-chat"
    class="parameter"><span class="type-annotation">[Chat](../../models_chats_chat/Chat-class.md)</span>
    <span class="parameter-name">chat</span>, </span>
2.  <span id="isCurrentUserAdmin-param-currentUserId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">currentUserId</span></span>

)

</div>

<div class="section desc markdown">

Checks if the current user is the admin (creator) of a group chat.

**params**:

- `chat`: The chat to check
- `currentUserId`: The ID of the current user

**returns**:

- `bool`: True if the current user is the admin, false otherwise

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static bool isCurrentUserAdmin(Chat chat, String currentUserId) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  isCurrentUserAdmin static method

##### ChatUtils class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

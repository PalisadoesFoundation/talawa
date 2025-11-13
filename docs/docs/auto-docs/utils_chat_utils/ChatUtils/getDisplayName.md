<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  getDisplayName static method

<div class="self-name">

getDisplayName

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_utils/ChatUtils-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getDisplayName</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">getDisplayName</span>(

1.  <span id="getDisplayName-param-chat"
    class="parameter"><span class="type-annotation">[Chat](../../models_chats_chat/Chat-class.md)</span>
    <span class="parameter-name">chat</span>, </span>
2.  <span id="getDisplayName-param-currentUserId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">currentUserId</span></span>

)

</div>

<div class="section desc markdown">

Gets the display name for a chat based on its type.

For group chats, extracts the clean name without chatId suffix. For
direct chats, creates a name from member names.

**params**:

- `chat`: The chat to get the display name for
- `currentUserId`: The ID of the current user (to exclude from direct
  chat names)

**returns**:

- `String`: The appropriate display name for the chat

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static String getDisplayName(Chat chat, String currentUserId) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  getDisplayName static method

##### ChatUtils class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

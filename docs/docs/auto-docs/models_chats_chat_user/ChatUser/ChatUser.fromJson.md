<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [models/chats/chat_user.dart](../../models_chats_chat_user/)
3.  [ChatUser](../../models_chats_chat_user/ChatUser-class.md)
4.  ChatUser.fromJson factory constructor

<div class="self-name">

ChatUser.fromJson

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_chats_chat_user/ChatUser-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-constructor">ChatUser.fromJson</span> constructor

</div>

<div class="section multi-line-signature">

<span class="name">ChatUser.fromJson</span>(

1.  <span id="fromJson-param-json"
    class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
    <span class="type-parameter">dynamic</span>\></span></span>
    <span class="parameter-name">json</span></span>

)

</div>

<div class="section desc markdown">

Creates a `ChatUser` instance from a JSON object.

The `json` parameter is a map containing the user data. Handles the new
PostgreSQL API format with 'name' and 'avatarURL' fields.

**params**:

- `json`: Map containing user data from API

**returns**:

- `ChatUser`: Parsed chat user instance

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
factory ChatUser.fromJson(Map<String, dynamic> json) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_user](../../models_chats_chat_user/)
3.  [ChatUser](../../models_chats_chat_user/ChatUser-class.md)
4.  ChatUser.fromJson factory constructor

##### ChatUser class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

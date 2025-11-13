<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/chat_view_models/group_chat_view_model.dart](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  leaveGroupChat method

<div class="self-name">

leaveGroupChat

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">leaveGroupChat</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span>
<span class="name">leaveGroupChat</span>(

1.  <span id="leaveGroupChat-param-chatId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">chatId</span>, </span>
2.  <span id="leaveGroupChat-param-chat"
    class="parameter"><span class="type-annotation">[Chat](../../models_chats_chat/Chat-class.md)</span>
    <span class="parameter-name">chat</span></span>

)

</div>

<div class="section desc markdown">

Leaves the group chat (removes current user from the group).

**params**:

- `chatId`: The ID of the group chat to leave
- `chat`: The chat object for validation

**returns**:

- `Future<bool>`: True if user left successfully, false otherwise

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<bool> leaveGroupChat(String chatId, Chat chat) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  leaveGroupChat method

##### GroupChatViewModel class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

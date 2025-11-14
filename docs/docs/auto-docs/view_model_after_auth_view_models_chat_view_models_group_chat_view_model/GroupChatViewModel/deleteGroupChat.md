<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/view_model_after_auth_view_models_chat_view_models_group_chat_view_model-library.md)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  deleteGroupChat method

<div class="self-name">

deleteGroupChat

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">deleteGroupChat</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span>
<span class="name">deleteGroupChat</span>(

1.  <span id="deleteGroupChat-param-chatId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">chatId</span></span>

)

</div>

<div class="section desc markdown">

Deletes a group chat (admin only).

**params**:

- `chatId`: The ID of the group chat to delete

**returns**:

- `Future<bool>`: True if group was deleted successfully, false
  otherwise

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<bool> deleteGroupChat(String chatId) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/view_model_after_auth_view_models_chat_view_models_group_chat_view_model-library.md)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  deleteGroupChat method

##### GroupChatViewModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

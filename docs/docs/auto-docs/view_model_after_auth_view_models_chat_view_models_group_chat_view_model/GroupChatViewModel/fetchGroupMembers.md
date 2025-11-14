<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/view_model_after_auth_view_models_chat_view_models_group_chat_view_model-library.md)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  fetchGroupMembers method

<div class="self-name">

fetchGroupMembers

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

# <span class="kind-method">fetchGroupMembers</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)?</span>\></span></span>
<span class="name">fetchGroupMembers</span>(

1.  <span id="fetchGroupMembers-param-chatId"
    class="parameter"></span>

)

</div>

<div class="section desc markdown">

Fetches all members of a specific group chat with pagination support.

This method uses the ChatService. to load members with
pagination, which is useful for groups with many members.

**params**:

- `chatId`: The ID of the group chat
- `limit`: Maximum number of members to fetch (default: 32)

**returns**:

- `Future<List<dynamic>?>`: List of chat members or null if failed

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<List<dynamic>?>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [group_chat_view_model](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/view_model_after_auth_view_models_chat_view_models_group_chat_view_model-library.md)
3.  [GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)
4.  fetchGroupMembers method

##### GroupChatViewModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

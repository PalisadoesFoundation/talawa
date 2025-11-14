<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [group_chat_management_dialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/views_after_auth_screens_chat_widgets_group_chat_management_dialogs-library.md)
3.  [GroupChatManagementDialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class.md)
4.  addSelectedMembers static method

<div class="self-name">

addSelectedMembers

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">addSelectedMembers</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">addSelectedMembers</span>(

1.  <span id="addSelectedMembers-param-selectedMembers"
    class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[User](../../models_user_user_info/User-class.md)</span>\></span></span>
    <span class="parameter-name">selectedMembers</span>, </span>
2.  <span id="addSelectedMembers-param-model"
    class="parameter"><span class="type-annotation">[GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span>
    <span class="parameter-name">model</span>, </span>
3.  <span id="addSelectedMembers-param-chatId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">chatId</span></span>

)

</div>

<div class="section desc markdown">

Adds selected members to the group chat.

**params**:

- `selectedMembers`: List of users to add to the group
- `model`: The GroupChatViewModel instance
- `chatId`: The ID of the chat

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static Future<void> addSelectedMembers(
  List<User> selectedMembers,
  GroupChatViewModel model,
  String chatId,
) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [group_chat_management_dialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/views_after_auth_screens_chat_widgets_group_chat_management_dialogs-library.md)
3.  [GroupChatManagementDialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class.md)
4.  addSelectedMembers static method

##### GroupChatManagementDialogs class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/widgets/group_chat_management_dialogs.dart](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/)
3.  [GroupChatManagementDialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class.md)
4.  showLeaveGroupDialog static method

<div class="self-name">

showLeaveGroupDialog

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">showLeaveGroupDialog</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">void</span>
<span class="name">showLeaveGroupDialog</span>(

1.  <span id="showLeaveGroupDialog-param-context"
    class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span>
    <span class="parameter-name">context</span>, </span>
2.  <span id="showLeaveGroupDialog-param-model"
    class="parameter"><span class="type-annotation">[GroupChatViewModel](../../view_model_after_auth_view_models_chat_view_models_group_chat_view_model/GroupChatViewModel-class.md)</span>
    <span class="parameter-name">model</span>, </span>
3.  <span id="showLeaveGroupDialog-param-chatId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">chatId</span>, </span>
4.  <span id="showLeaveGroupDialog-param-chat"
    class="parameter"><span class="type-annotation">[Chat](../../models_chats_chat/Chat-class.md)</span>
    <span class="parameter-name">chat</span>, </span>

)

</div>

<div class="section desc markdown">

Shows leave group confirmation dialog (non-admin only).

**params**:

- `context`: The build context
- `model`: The GroupChatViewModel instance
- `chatId`: The ID of the chat
- `chat`: The chat object for validation

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static void showLeaveGroupDialog(
  BuildContext context,
  GroupChatViewModel model,
  String chatId,
  Chat chat,
) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [group_chat_management_dialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/)
3.  [GroupChatManagementDialogs](../../views_after_auth_screens_chat_widgets_group_chat_management_dialogs/GroupChatManagementDialogs-class.md)
4.  showLeaveGroupDialog static method

##### GroupChatManagementDialogs class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

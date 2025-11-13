<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/chat/direct_chats.dart](../../views_after_auth_screens_chat_direct_chats/views_after_auth_screens_chat_direct_chats-library.md)
3.  [DirectChats](../../views_after_auth_screens_chat_direct_chats/DirectChats-class.md)
4.  onRefresh method

<div class="self-name">

onRefresh

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_chat_direct_chats/DirectChats-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">onRefresh</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">void</span>\></span></span>
<span class="name">onRefresh</span>(

1.  <span id="onRefresh-param-model"
    class="parameter"><span class="type-annotation">[DirectChatViewModel](../../view_model_after_auth_view_models_chat_view_models_direct_chat_view_model/DirectChatViewModel-class.md)</span>
    <span class="parameter-name">model</span></span>

)

</div>

<div class="section desc markdown">

Handles the refresh action for the chat list.

This method is called when the user pulls down to refresh the chat list.
It sets the chat state to loading, triggers a refresh of the chats, and
adds a small delay for better user experience.

**params**:

- `model`: The DirectChatViewModel instance to refresh

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<void> onRefresh(DirectChatViewModel model) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [direct_chats](../../views_after_auth_screens_chat_direct_chats/views_after_auth_screens_chat_direct_chats-library.md)
3.  [DirectChats](../../views_after_auth_screens_chat_direct_chats/DirectChats-class.md)
4.  onRefresh method

##### DirectChats class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

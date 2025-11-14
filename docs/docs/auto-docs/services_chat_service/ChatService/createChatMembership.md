<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/services_chat_service-library.md)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  createChatMembership method

<div class="self-name">

createChatMembership

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_service/ChatService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">createChatMembership</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span>
<span class="name">createChatMembership</span>(

1.  <span id="createChatMembership-param-chatId"
    class="parameter"></span>

)

</div>

<div class="section desc markdown">

Creates a chat membership (adds a user to a chat).

**params**:

- `chatId`: The ID of the chat
- `userId`: The ID of the user to add

**returns**:

- `Future<bool>`: True if successful, false otherwise

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<bool>  =>
    _membershipService.createChatMembership(
      chatId: chatId,
      userId: userId,
    );
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/services_chat_service-library.md)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  createChatMembership method

##### ChatService class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

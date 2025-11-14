<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/chat_service.dart](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  getChatDetails method

<div class="self-name">

getChatDetails

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_service/ChatService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getChatDetails</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../../models_chats_chat/Chat-class.md)?</span>\></span></span>
<span class="name">getChatDetails</span>(

1.  <span id="getChatDetails-param-chatId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">chatId</span>, )

</div>

<div class="section desc markdown">

Retrieves chat details with initial messages.

**params**:

- `chatId`: The ID of the chat
- `isInitialLoad`: Whether this is the initial load (for setting up
  pagination)

**returns**:

- `Future<Chat?>`: The chat with messages or null if failed

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<Chat?> getChatDetails(
  String chatId, ) =>
    _messageService.getChatDetails(chatId, isInitialLoad: isInitialLoad);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  getChatDetails method

##### ChatService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

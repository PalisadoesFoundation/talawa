<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/chat_subscription_service.dart](../../services_chat_subscription_service/)
3.  [ChatSubscriptionService](../../services_chat_subscription_service/ChatSubscriptionService-class.md)
4.  subscribeToChatMessages method

<div class="self-name">

subscribeToChatMessages

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_subscription_service/ChatSubscriptionService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">subscribeToChatMessages</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Stream](https://api.flutter.dev/flutter/dart-core/Stream-class.html)<span class="signature">\<<span class="type-parameter">[ChatMessage](../../models_chats_chat_message/ChatMessage-class.md)</span>\></span></span>
<span class="name">subscribeToChatMessages</span>(

1.  <span id="subscribeToChatMessages-param-chatId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">chatId</span></span>

)

</div>

<div class="section desc markdown">

Subscribes to real-time chat messages for a specific chat.

**params**:

- `chatId`: The ID of the chat to subscribe to

**returns**:

- `Stream<ChatMessage>`: Stream of incoming messages for the specified
  chat

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Stream<ChatMessage> subscribeToChatMessages(String chatId) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_subscription_service](../../services_chat_subscription_service/)
3.  [ChatSubscriptionService](../../services_chat_subscription_service/ChatSubscriptionService-class.md)
4.  subscribeToChatMessages method

##### ChatSubscriptionService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

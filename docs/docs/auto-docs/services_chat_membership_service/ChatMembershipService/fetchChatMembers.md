<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/chat_membership_service.dart](../../services_chat_membership_service/services_chat_membership_service-library.md)
3.  [ChatMembershipService](../../services_chat_membership_service/ChatMembershipService-class.md)
4.  fetchChatMembers method

<div class="self-name">

fetchChatMembers

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_chat_membership_service/ChatMembershipService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">fetchChatMembers</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
<span class="type-parameter">dynamic</span>\></span>?</span>\></span></span>
<span class="name">fetchChatMembers</span>

</div>

<div class="section desc markdown">

Fetches members of a specific chat with pagination support.

**params**:

- `chatId`: The ID of the chat
- `first`: Number of members to fetch from the beginning (optional)
- `last`: Number of members to fetch from the end (optional)
- `after`: Cursor for forward pagination (optional)
- `before`: Cursor for backward pagination (optional)

**returns**:

- `Future<Map<String, dynamic>?>`: Chat with members and pagination
  info, or null if failed

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<Map<String, dynamic>?>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_membership_service](../../services_chat_membership_service/services_chat_membership_service-library.md)
3.  [ChatMembershipService](../../services_chat_membership_service/ChatMembershipService-class.md)
4.  fetchChatMembers method

##### ChatMembershipService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

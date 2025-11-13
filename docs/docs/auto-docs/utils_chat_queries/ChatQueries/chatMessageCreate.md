<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/chat_queries.dart](../../utils_chat_queries/utils_chat_queries-library.md)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.md)
4.  chatMessageCreate property

<div class="self-name">

chatMessageCreate

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_queries/ChatQueries-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">chatMessageCreate</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">chatMessageCreate</span>

</div>

<div class="section desc markdown">

Gets the GraphQL subscription for chat message creation events.

**params**: None

**returns**:

- `String`: The GraphQL subscription string for listening to chat
  message creation

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String get chatMessageCreate => '''
    subscription chatMessageCreate(\$input: SubscriptionChatMessageCreateInput!) 
''';
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_queries](../../utils_chat_queries/utils_chat_queries-library.md)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.md)
4.  chatMessageCreate property

##### ChatQueries class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

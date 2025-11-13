<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  categorizeChats static method

<div class="self-name">

categorizeChats

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_utils/ChatUtils-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">categorizeChats</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Chat](../../models_chats_chat/Chat-class.md)</span>\></span></span>\></span></span>
<span class="name">categorizeChats</span>(

1.  <span id="categorizeChats-param-chats"
    class="parameter"><span class="type-annotation">[List](https://api.flutter.dev/flutter/dart-core/List-class.md)<span class="signature">\<<span class="type-parameter">[Chat](../../models_chats_chat/Chat-class.md)</span>\></span></span>
    <span class="parameter-name">chats</span></span>

)

</div>

<div class="section desc markdown">

Categorizes chats into groups and direct chats.

**params**:

- `chats`: List of all chats to categorize

**returns**:

- `Map<String, List<Chat>>`: Map with 'groups' and 'direct' keys
  containing categorized chats

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static Map<String, List<Chat>> categorizeChats(List<Chat> chats) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  categorizeChats static method

##### ChatUtils class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

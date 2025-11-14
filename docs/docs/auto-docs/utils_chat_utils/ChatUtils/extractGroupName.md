<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  extractGroupName static method

<div class="self-name">

extractGroupName

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_utils/ChatUtils-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">extractGroupName</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">extractGroupName</span>(

1.  <span id="extractGroupName-param-chatName"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">chatName</span></span>

)

</div>

<div class="section desc markdown">

Extracts the group name by removing the chatId suffix.

Group chats may have their chatId appended as a suffix to ensure
uniqueness. This method removes that suffix to get the user-friendly
name.

**params**:

- `chatName`: The full chat name that may include chatId suffix

**returns**:

- `String`: The group name without the chatId suffix

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static String extractGroupName(String chatName) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/utils_chat_utils-library.md)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  extractGroupName static method

##### ChatUtils class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>

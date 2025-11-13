<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/chat_utils.dart](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  formatGroupName static method

<div class="self-name">

formatGroupName

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_chat_utils/ChatUtils-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">formatGroupName</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">formatGroupName</span>(

1.  <span id="formatGroupName-param-userInput"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">userInput</span>, </span>
2.  <span id="formatGroupName-param-chatId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">chatId</span></span>

)

</div>

<div class="section desc markdown">

Formats a group name by appending the chatId suffix for uniqueness.

This ensures that group names are unique by appending the chat ID.
Format: "UserInputName_chatId"

**params**:

- `userInput`: The user's desired group name
- `chatId`: The unique chat ID

**returns**:

- `String`: The formatted group name with chatId suffix

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static String formatGroupName(String userInput, String chatId) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [chat_utils](../../utils_chat_utils/)
3.  [ChatUtils](../../utils_chat_utils/ChatUtils-class.md)
4.  formatGroupName static method

##### ChatUtils class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
